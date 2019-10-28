
# **WindPlus Package**

- [Introduction](#introduction)
- [Theory](#theory)
    - [1. Definition](#definition)
    - [2. Algorithm](#algorithm)
    - [3. Result](#result)
- [Installation](#installation)
- [Usage](#usage)
- [Details](#details)

# Introduction
The package aims at unveiling a unique technique called covariate matching, which takes in different data sets and returns data sets whose feature values exhibit similar characteristics or similar distribution.

# Theory
Covariate matching methods are rooted in the statistical literature. In
stabilizing the non-experimental discrepancy between non-treated and treated subjects of observational data, covariate distributions are adjusted by selecting non-treated subjects that have a similar covariate condition as that of treated ones. Through the process of matching, non-treated and treated groups become only randomly different on all background covariates, as if these covariates were designed by experimenters. As a result, the outcomes of the matched non-treated and treated groups, which keep the originally observed values, are comparable under the matched covariate conditions.

# Definition
Covariate matching is a technique to adjust covariates distribution to make treated and non treated group to have the same covariates condition.

# Algorithm
Covariate matching is broadly divided into steps : Hierarchial subgrouping and one to one matching.
### Hierarchial subrouping - Filters data record in non-treated group which satifies the threshold condition for each data record in treated group.
1. Locate a data record in the treated group, Q<sub>aft</sub>, and label it by the index
j.
2. Select one of the covariates, for instance, wind speed, V , and designate
it as the variable of which the similarity between two data records is
computed.
3. Go through the data records in the non-treated group, Q<sub>bef</sub>, by selecting
the subset of data records such that the dierence, in terms of the
designated covariate, between the data record j in Q<sub>aft</sub> and any one of
the records in Q<sub>bef</sub> is smaller than a pre-specied threshold. When
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

# Result
Sample result highlighting two data sets distribution - before applying the matching technique and after applying the technique for a single covariate.

![matched](https://user-images.githubusercontent.com/49033958/67720553-3d4d3900-f9a2-11e9-9f76-3ba6df0c0c37.jpg)



# Installation
```R
devtools::install_github("nitesh-1507/WindPlus")
```
# Usage 

```R
library(Windplus)
```
# Details
For more information on WindPlus Package, please access the package documentations or vignettes. Please feel free to contact the author.



