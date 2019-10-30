covmatch.mult = function(dname, cov = NULL, weight = 0.2, cov_circ = NULL ){
  # Loading library
  library(matrixStats)

  # Checks for number of data sets provided by user
  if(length(dname) < 2){

    stop('Atleast two data sets must be provided for matching')

  }

  # Checks whether the provided data set is a list or not
  !is.list(dname){

    stop('Data set provided should be a list containing data sets')

  }

  # Checks for non circular covariates
  if(length(cov) > 0){

    !is.vector(cov){

      stop('Non circular covariates column number should be provided as a vector')

    }
  }

  # Checks for circular covariates
  if(length(cov_circ) > 0){

    !is.vector(cov_circ){

      stop('Circular covariates column number should be provided as a vector')

    }
  }

  # Checks whether any covariate is provided by user or not
  if(!(length(cov) > 0) && !(length(cov_circ) > 0)){

    stop('Atleast a single covariate, either circular or non circular should be provided')

  }

  # Checks for dimension compatibility of weight supplied
  if(!(length(weight) == 1) || !(length(weight) == length(c(cov, cov_circ)))){

    stop('The weight provided should be a single value or vector with weight for each covariate')

  }



}
