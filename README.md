# **WindPlus Package**

- [Introduction](#introduction)
- [Theory](#theory)
    - [1. Definition](#definition)
    - [2. Algorithm](#algorithm)
- [Installation](#installation)
- [Usage](#usage)
    - [1. Matching binary](#matching-binary)
    - [2. Matching many](#matching-many)
- [Details](#details)

# Introduction
The package aims at unveiling a unique technique called covariate matching, which takes in different data sets and returns data sets whose feature values exhibit similar characteristics or similar distribution.

#  Theory
Covariate matching methods are rooted in the statistical literature. In
stabilizing the non-experimental discrepancy between non-treated and treated subjects of observational data, covariate distributions are adjusted by selecting non-treated subjects that have a similar covariate condition as that of treated ones. Through the process of matching, non-treated and treated groups become only randomly different on all background covariates, as if these covariates were designed by experimenters. As a result, the outcomes of the matched non-treated and treated groups, which keep the originally observed values, are comparable under the matched covariate conditions.

### 1. Definition
Covariate matching is a technique to adjust covariates distribution to make treated and non treated group to have the same covariates condition.

### 2. Algorithm
Covariate matching is broadly divided into steps : Hierarchial subgrouping and one to one matching.
### Hierarchial subrouping - Filters data record in non-treated group which satifies the threshold condition for each data record in treated group.
1. Locate a data record in the treated group, Q<sub>aft</sub>, and label it by the index
j.
2. Select one of the covariates, for instance, wind speed, V , and designate
it as the variable of which the similarity between two data records is
computed.
3. Go through the data records in the non-treated group, Q<sub>bef</sub>, by selecting
the subset of data records such that the difference, in terms of the
designated covariate, between the data record j in Q<sub>aft</sub> and any one of
the records in Q<sub>bef</sub> is smaller than a pre-specified threshold. When
V is in fact the one designated in Step 2, the resulting subset is then
labeled by placing V as the subscript to Q, namely Q<sub>V</sub> .
4. Next, designate another covariate and use it to prune Q<sub>V</sub> in the same
way as one prunes Q<sub>bef</sub> into Q<sub>V</sub> in Step 3. Doing so produces a smaller
subset nested within Q<sub>V</sub> . Then continue with another covariate until all
covariates are used.

### One to One matching - returns the most similar data record after hierarchial sub-grouping
1. Select the most similar record from Q<sub>bef</sub> for each Q<sub>aft</sub> using mahalanobis distance as the similarity measure.
2. Remove the record from Q<sub>aft</sub>, if a record in Q<sub>bef</sub> satisfies the above mentioned criteria. 
3. Repeat the process for each record in Q<sub>aft</sub>

# Installation
The package building relies on certain tool chains in windows and mac respectively, as the compiler for C++ code along with package devtools

**Step 1 (Download necessary tool chain):**

Tool chain : [Rtools - Windows](https://cran.r-project.org/bin/windows/Rtools/), [GFortran - Mac OS](https://gcc.gnu.org/wiki/GFortranBinariesMacOS)

**Step 2 (Install package devtools in R):**

Install package devtools:
```R
install.packages("devtools")
```

**Step 3 (Build package using devtools):**

```R
devtools::install_github("nitesh-1507/WindPlus", build_vignettes = TRUE)
```
# Usage 
The package can be used to match many different data sets. Broadly two functions are available to match the data sets provided by user.

Loading library

```R
library(WindPlus)
```
### 1. Matching binary
The function can be used to match, when the number data sets are two.

```R
# Load library
library(WindPlus)

# Prepare data set for matching
dname = rep(list(), 2)
dname[[1]] = data1
dname[[2]] = data2


# Non circular covariates column
cov = c(6, 1, 13)

# Weight 
weight = c(0.1, 0.1, 0.05)

# Matching
matched = covmatch.binary(dname = dname, weight = weight, cov = cov, cov_circ = NULL)

# Commpare result of one covariate with original data
dev.new(width = 550, height = 330, unit = "px")
par(mfrow =  c(1, 2))
par(bg = 'grey')

plot(density(dname[[1]][, 13]), col = 'red', main = 'Before Matching', xlab = 'Turbulence Intensity', lwd = 2, xlim = c(0, 0.8), ylim = c(0, 8))
lines(density(dname[[2]][, 13]), col = 'blue', lwd = 2, ylim = c(0, 8), xlim = c(0, 0.8), ylim = c(0, 8))
legend('topright', legend = c('data1', 'data2'), col=c("red", "blue"), lty=1, lwd = 2)

plot(density(matched[[1]][, 13]), col = 'red', main = 'After Matching', xlab = 'Turbulence Intensity', lwd = 2, xlim = c(0, 0.8), ylim = c(0, 8))
lines(density(matched[[2]][,13]), col = 'blue', lwd = 2, xlim = c(0, 0.8), ylim = c(0, 8))
legend('topright', legend = c('data1', 'data2'), col=c("red", "blue"), lty=1, lwd = 2)

```
![git_1](https://user-images.githubusercontent.com/49033958/69440659-d86dd000-0d0e-11ea-9d73-da840f432167.jpeg)

### 2. Matching many
The function can be used to match, when the number of data sets are more than two.

```R
# Load library
library(WindPlus)

# Prepare data set for matching
dname = rep(list(), 3)
dname[[1]] = Season1
dname[[2]] = Season2
dname[[3]] = Season3

# Non circular covariates column
cov = c(1, 6, 14)

# Weight 
weight = c(0.2, 0.2, 0.2)

# Matching
matched = covmatch.mult(dname = dname, weight = weight, cov = cov, cov_circ = NULL)

# Commpare result of one covariate with original data
dev.new(width = 550, height = 330, unit = "px")
par(mfrow =  c(1, 2))
par(bg = 'grey')

plot(density(dname[[1]][, 1]), col = 'red', main = 'Before Matching', xlab = 'Wind Speed (m/s)', lwd = 2, xlim = c(0, 20), ylim = c(0, 0.18))
lines(density(dname[[2]][, 1]), col = 'blue', lwd = 2, xlim = c(0, 20), ylim = c(0, 0.18))
lines(density(dname[[3]][, 1]), col = 'green', lwd = 2, xlim = c(0, 20), ylim = c(0, 0.18))
legend('topright',legend = c('Season1', 'Season2', 'Season3'), col=c("red", "blue", "green"), lty=1, lwd = 2)

plot(density(matched[[1]][, 1]), col = 'red', main = 'After Matching', xlab = 'Wind Speed (m/s)', lwd = 2, xlim = c(0, 20), ylim = c(0, 0.18))
lines(density(matched[[2]][, 1]), col = 'blue', lwd = 2, xlim = c(0, 20), ylim = c(0, 0.18))
lines(density(matched[[3]][, 1]), col = 'green', lwd = 2, xlim = c(0, 20), ylim = c(0, 0.18))
legend('topright',legend = c('Season1', 'Season2', 'Season3'), col=c("red", "blue", "green"), lty=1, lwd = 2)
```
![git_1](https://user-images.githubusercontent.com/49033958/69439975-942e0000-0d0d-11ea-927a-2f2aa2666185.jpeg)

Note :- Even covmatch.mult() function can be used to match two data sets, but it is suggested to use covmatch.binary() when the number of data sets are two.

# Details
For more information on WindPlus Package, please access the package documentations or vignettes. Please feel free to contact the author.



