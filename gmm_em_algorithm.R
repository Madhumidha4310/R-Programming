###############################################################
# Gaussian Mixture Model (GMM) using EM Algorithm
# Vectorized EM Implementation from Scratch
#
# Student Name :
# Register Number :
###############################################################

rm(list = ls())
cat("\014")

if (!dir.exists("Output")) {
  dir.create("Output")
}

###############################################################
# PART 1 : Generate Dataset
###############################################################

cat("\nPART 1 : Generating Dataset\n")

set.seed(123)

n <- 200
K <- 2


mu1_true <- c(2,3)
sigma1_true <- matrix(c(1,0.5,
                        0.5,1),2,2)


mu2_true <- c(7,8)
sigma2_true <- matrix(c(1,-0.3,
                        -0.3,1),2,2)


generate_data <- function(n, mean, sigma){

  Z <- matrix(rnorm(n*2), ncol=2)
  L <- chol(sigma)

  X <- Z %*% L +
    matrix(mean,n,2,byrow=TRUE)

  return(X)
}


data1 <- generate_data(n/2,mu1_true,sigma1_true)
data2 <- generate_data(n/2,mu2_true,sigma2_true)


X <- rbind(data1,data2)


write.csv(X,"synthetic_data.csv",
          row.names = FALSE)


cat("Dataset Generated Successfully\n")

print(head(X))


###############################################################
# PART 2 : Initialize Parameters
###############################################################

cat("\nPART 2 : Parameter Initialization\n")


n <- nrow(X)
d <- ncol(X)


set.seed(456)


# Random initialization

mu_k <- X[sample(1:n,K),]


pi_k <- rep(1/K,K)


sigma_k <- list()


for(k in 1:K){

  sigma_k[[k]] <-
    diag(apply(X,2,var)) +
    diag(1e-6,d)

}


cat("Initial Means:\n")
print(mu_k)



###############################################################
# PART 3 : Gaussian Density Function
###############################################################

cat("\nPART 3 : Gaussian Density Function\n")


gaussian_density <- function(X,mu,sigma){


  d <- length(mu)


  sigma <- sigma +
    diag(1e-6,d)


  inv_sigma <- solve(sigma)


  det_sigma <- det(sigma)


  constant <-
    1 /
    ((2*pi)^(d/2) *
       sqrt(det_sigma))


  density <- numeric(nrow(X))


  for(i in 1:nrow(X)){


    diff <- X[i,]-mu


    density[i] <-
      constant *
      exp(-0.5 *
            t(diff)%*%
            inv_sigma%*%
            diff)

  }


  return(density)

}



###############################################################
# PART 4 : Expectation Step (E-Step)
###############################################################

cat("\nPART 4 : E Step\n")


E_step <- function(X,pi_k,mu_k,sigma_k){


  n <- nrow(X)

  K <- length(pi_k)


  gamma <- matrix(0,n,K)


  for(k in 1:K){

    gamma[,k] <-
      pi_k[k] *
      gaussian_density(
        X,
        mu_k[k,],
        sigma_k[[k]]
      )

  }


  gamma <-
    gamma /
    rowSums(gamma)


  return(gamma)

}



###############################################################
# PART 5 : Maximization Step (M-Step)
###############################################################

cat("\nPART 5 : M Step\n")


M_step <- function(X,gamma){


  n <- nrow(X)
  d <- ncol(X)

  K <- ncol(gamma)


  Nk <- colSums(gamma)


  pi_new <- Nk/n


  mu_new <- matrix(0,K,d)


  sigma_new <- list()



  for(k in 1:K){


    mu_new[k,] <-
      colSums(
        gamma[,k]*X
      ) / Nk[k]



    covariance <-
      matrix(0,d,d)



    for(i in 1:n){


      diff <-
        matrix(
          X[i,]-mu_new[k,],
          ncol=1
        )


      covariance <-
        covariance +
        gamma[i,k] *
        (diff%*%t(diff))

    }



    sigma_new[[k]] <-
      covariance/Nk[k]+
      diag(1e-6,d)

  }


 return(
   list(
     pi_k=pi_new,
     mu_k=mu_new,
     sigma_k=sigma_new
   )
 )

}



###############################################################
# PART 6 : Log Likelihood
###############################################################

cat("\nPART 6 : Log Likelihood\n")


log_likelihood <- function(X,
                           pi_k,
                           mu_k,
                           sigma_k){


  likelihood <- 0


  for(i in 1:nrow(X)){


    probability <- 0


    for(k in 1:length(pi_k)){


      probability <-
        probability +
        pi_k[k]*
        gaussian_density(
          X[i,,drop=FALSE],
          mu_k[k,],
          sigma_k[[k]]
        )

    }


    likelihood <-
      likelihood +
      log(probability)

  }


 return(likelihood)

}



###############################################################
# PART 7 : EM Algorithm
###############################################################

cat("\nPART 7 : Running EM Algorithm\n")


max_iter <- 50

tol <- 1e-6


log_values <- numeric(max_iter)



for(iter in 1:max_iter){



 gamma <-
   E_step(
     X,
     pi_k,
     mu_k,
     sigma_k
   )



 params <-
   M_step(
     X,
     gamma
   )



 pi_k <- params$pi_k

 mu_k <- params$mu_k

 sigma_k <- params$sigma_k



 log_values[iter] <-
   log_likelihood(
     X,
     pi_k,
     mu_k,
     sigma_k
   )



 cat("Iteration:",
     iter,
     " Log Likelihood:",
     log_values[iter],
     "\n")



 if(iter>1 &&
    abs(log_values[iter]-
        log_values[iter-1])<tol){

   cat("Convergence Achieved\n")

   break

 }


}



log_values <-
 log_values[1:iter]



###############################################################
# PART 8 : Cluster Assignment
###############################################################

cat("\nPART 8 : Cluster Assignment\n")


clusters <-
 apply(
   gamma,
   1,
   which.max
 )


print(table(clusters))



###############################################################
# PART 9 : Visualization
###############################################################

cat("\nPART 9 : Visualization\n")



png("Output/final_clusters.png",
    width=800,
    height=600)


plot(
 X,
 col=clusters,
 pch=16,
 main="Final EM Clusters",
 xlab="X1",
 ylab="X2"
)


points(
 mu_k,
 col=1:K,
 pch=8,
 cex=2
)


dev.off()



png("Output/log_likelihood.png",
    width=800,
    height=600)


plot(
 log_values,
 type="l",
 main="Log Likelihood Convergence",
 xlab="Iteration",
 ylab="Log Likelihood"
)


dev.off()



###############################################################
# PART 10 : Results Summary
###############################################################

cat("\nPART 10 : Results Summary\n")


cat("\nMixing Coefficients:\n")
print(pi_k)


cat("\nEstimated Means:\n")
print(mu_k)


cat("\nCovariance Matrices:\n")


for(k in 1:K){

cat("\nCluster",k,"\n")

print(sigma_k[[k]])

}



cat("\n====================================\n")
cat("EM ALGORITHM COMPLETED SUCCESSFULLY\n")
cat("====================================\n")


cat("Total Data Points :",n,"\n")
cat("Clusters :",K,"\n")
cat("Iterations :",length(log_values),"\n")
cat("Final Log Likelihood :",
    tail(log_values,1),
    "\n")