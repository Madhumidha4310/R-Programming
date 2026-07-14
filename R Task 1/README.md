# Customer Segmentation using GMM (EM Algorithm) in R

## Project Overview

This project implements **Customer Segmentation using Gaussian Mixture Model (GMM)** with the **Expectation-Maximization (EM) Algorithm** from scratch using R programming.

The project groups customers based on **Age** and **Annual Income** using an unsupervised machine learning approach.

## Features

- Generates customer data using Age and Income attributes.
- Applies data scaling for better clustering.
- Implements GMM using EM Algorithm without external libraries.
- Performs:
  - Expectation Step (E-Step)
  - Maximization Step (M-Step)
- Calculates multivariate Gaussian probability.
- Computes log-likelihood for convergence.
- Assigns customers into different clusters.
- Visualizes customer segments and cluster probabilities.

## Algorithm Steps

### 1. Data Generation

- Creates two customer groups:
  - Cluster 1:
    - Age mean: 25
    - Income mean: 30,000
  - Cluster 2:
    - Age mean: 45
    - Income mean: 70,000
- Combines both datasets for clustering.

### 2. Parameter Initialization

- Initializes:
  - Mixture weights
  - Mean vectors
  - Covariance matrices
- Random data points are selected as initial cluster centers.

### 3. Expectation Step (E-Step)

- Calculates the probability of each customer belonging to each cluster.
- Computes responsibility values (γ).

### 4. Maximization Step (M-Step)

- Updates:
  - Cluster weights
  - Mean values
  - Covariance matrices

### 5. Log-Likelihood

- Calculates model performance after each iteration.
- Stops when the model reaches convergence.

### 6. Cluster Assignment

- Assigns customers to the cluster with the highest probability.

## Technologies Used

- R Programming
- Base R Functions
- Machine Learning Concepts
- Statistical Computing

## Project Structure
