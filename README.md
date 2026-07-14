Customer Segmentation using Gaussian Mixture Model (GMM) with EM Algorithm in R

Project Overview

This project implements the Gaussian Mixture Model (GMM) using the Expectation-Maximization (EM) Algorithm* from scratch using the R programming language.

The main objective of this project is to perform customer segmentation by grouping customers based on their characteristics such as Age and Annual Income.

Unlike built-in machine learning libraries, this project manually implements every step of the EM algorithm to understand the internal working of Gaussian Mixture Models.

Features

- Generates a customer dataset using Gaussian distributions.
- Implements Gaussian Mixture Model from scratch.
- Manually performs the Expectation-Maximization algorithm.
- Computes multivariate Gaussian probability density.
- Performs:
  - Expectation Step (E-Step)
  - Maximization Step (M-Step)
- Updates:
  - Mixture Weights
  - Mean Vectors
  - Covariance Matrices
- Calculates Log-Likelihood for convergence checking.
- Assigns customers to different clusters.
- Visualizes customer segments using plots.
- Displays cluster probability values.

Algorithm

1. Data Generation

A synthetic customer dataset is generated using two Gaussian distributions.

The dataset contains two features:

 * Age
 * Annual Income

Customer groups are generated as:

Cluster 1
- Young customers
- Lower income group

Cluster 2
- Middle-aged customers
- Higher income group

The generated datasets are combined into a single dataset for clustering.

 2. Parameter Initialization

The EM algorithm initializes the following parameters:

- Mixture weights
- Mean vectors
- Covariance matrices

Initial cluster means are selected randomly from the dataset.

3. Expectation Step (E-Step)

In the E-Step, the algorithm calculates the probability that each customer belongs to each Gaussian component.

This probability is called responsibility (γ).

The responsibility value represents how strongly a data point belongs to a particular cluster.

4. Maximization Step (M-Step)

Using the calculated responsibilities, the algorithm updates the model parameters:

Updated Parameters:

- Mixture weights
- Mean values
- Covariance matrices

These updated parameters improve the accuracy of cluster estimation.

5. Log-Likelihood Calculation

After every iteration, the algorithm calculates the log-likelihood value.

The algorithm checks the difference between current and previous log-likelihood values.

If the change is smaller than the tolerance value, the algorithm stops.

6. Cluster Assignment

Each customer is assigned to the cluster with the highest responsibility value.

The final output contains:

- Cluster number for each customer
- Cluster centers
- Mixture probabilities

Technologies Used

| Technology | Purpose |
|------------|---------|
| R Programming | Algorithm implementation |
| Base R Functions | Mathematical operations and visualization |
| Matrix Operations | Gaussian calculation and covariance computation |

---

Project Structure

Customer-Segmentation-GMM
│
├── GMM_Project.R
│
├── README.md
│
└── Output
    │
    ├── Customer_Segmentation_Plot.png
    │
    └── Cluster_Probability_Plot.png

