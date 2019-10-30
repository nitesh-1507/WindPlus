#' Title
#'
#' @param dname
#' @param cov
#' @param weight
#' @param cov_circ
#'
#' @return
#' @export
#'
#' @examples
covmatch.binary = function(dname, cov, weight = 0.2, cov_circ = NULL ){
  # Loading library
  library(parallel)

  if(length(dname) != 2){


    stop('The number of data sets to match should be equal to two')

  }

  # Checks whether the provided data set is a list or not
  if(!is.list(dname)){

    stop('Data set provided should be a list containing data sets')

  }

  # Checks for non circular covariates
  if(length(cov) > 0){

    if(!is.vector(cov)){

      stop('Non circular covariates column number should be provided as a vector')

    }
  }

  # Checks for circular covariates
  if(length(cov_circ) > 0){

    if(!is.vector(cov_circ)){

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

  ## reference set as a baseline
  # file names to be matched
  dname_1 = rep(list(c()),2)
  dname_1[[1]]= dname[[1]]
  dname_1[[2]]= dname[[2]]

  ## test set as a baseline
  # file names to be matched

  dname_2 = rep(list(c()),2)
  dname_2[[1]]= dname[[2]]
  dname_2[[2]]= dname[[1]]


  file_list = list(dname_1,dname_2)

  # Non circular covariates
  cov = cov

  # circular covariates
  cov_circ = cov_circ

  # weight for threshold calculation
  weight = weight

}
