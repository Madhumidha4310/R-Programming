# Gaussian Mixture Model (GMM) using EM Algorithm from Scratch

## Project Overview

This project implements a **Gaussian Mixture Model (GMM)** using the **Expectation-Maximization (EM) Algorithm** from scratch using the **R Programming Language**.

The main purpose of this project is to understand the mathematical working of the EM algorithm and how it estimates hidden cluster information by repeatedly updating model parameters.

Unlike built-in machine learning libraries, this project manually implements:

- Gaussian probability calculation
- Expectation Step (E-Step)
- Maximization Step (M-Step)
- Log-Likelihood calculation
- Cluster assignment
- Data visualization


---

# Objectives

The objectives of this project are:

- To understand Gaussian Mixture Models.
- To implement the EM algorithm manually.
- To estimate Gaussian distribution parameters.
- To perform unsupervised clustering.
- To analyze convergence using log-likelihood.
- To visualize the final clustering results.


---

# Technologies Used

| Category | Technology |
|----------|------------|
| Programming Language | R |
| Algorithm | Expectation-Maximization Algorithm |
| Machine Learning Model | Gaussian Mixture Model |
| Visualization | Base R Plot Functions |
| Data Processing | R Matrix Operations |


---



---

# Algorithm Explanation

## 1. Dataset Generation

A synthetic dataset is created using two Gaussian distributions.

Each cluster contains:

- Mean vector
- Covariance matrix
- Random data points


The generated dataset contains:



---

# 2. Parameter Initialization

Before starting EM iterations, initial parameters are assigned:

- Cluster probability (Mixing coefficient)
- Mean values
- Covariance matrices


Initial parameters are updated during the EM process to achieve better clustering.


---

# 3. Gaussian Density Function

The Gaussian Density Function calculates the probability of each data point belonging to a Gaussian distribution.

It considers:

- Distance between point and mean
- Covariance information
- Distribution probability


This probability is used during the Expectation Step.


---

# 4. Expectation Step (E-Step)

The E-Step calculates the responsibility value.

Responsibility represents:

"The probability that a particular data point belongs to a specific cluster."


The output of E-Step is a responsibility matrix:



---

# 5. Maximization Step (M-Step)

The M-Step updates the parameters using the responsibility values.

The following parameters are updated:


### Mean

The new center position of each cluster.


### Covariance Matrix

Represents the spread and relationship between data points.


### Mixing Coefficient

Represents the probability of each cluster.


---

# 6. Log Likelihood Calculation

Log likelihood measures how well the Gaussian Mixture Model fits the dataset.

During each iteration:

- EM updates parameters.
- Log likelihood increases.
- Algorithm moves closer to convergence.


---

# 7. EM Algorithm Process

The EM algorithm follows these steps repeatedly:



The algorithm stops when:

- Maximum iterations are completed, or
- Change in log likelihood becomes very small.


---

# 8. Cluster Assignment

After EM completion, every data point is assigned to the cluster with the highest probability.

The final cluster label is obtained using:



---

# 9. Visualization

The project generates graphical outputs.

## Final Cluster Visualization

Displays:

- Data points
- Cluster colors
- Estimated cluster centers


Output:

<img width="800" height="600" alt="final_clusters" src="https://github.com/user-attachments/assets/6a42613e-3963-4160-aadb-e02eedbd804e" />

<img width="800" height="600" alt="log_likelihood" src="https://github.com/user-attachments/assets/9043f076-5d18-4634-91e9-c66c2eb4210d" />
