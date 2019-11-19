// function to match data set
// match.cov : main matching function given data sets
// ref : data set considered as a reference
// obj : data set whose each observation searches for a matching observation in ref
// thres : threshold against which similarity is obtained between ref and obj data sets
// circ_pos : position of circular variables (such as wind direction etc), if supplied by user

#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;

// [[Rcpp::export]]
arma::vec matchcov(arma::mat& ref , arma::mat& obj, arma::rowvec& thres, arma::rowvec& circ_pos, int pos)
{
  // Variables to store no of rows
  int row_ref = ref.n_rows;
  int row_obj = obj.n_rows;

  // Vector to store matched obj data set index
  arma::vec match(row_ref);
  match.fill(0.0);

  // Vector to store index of obj data set
  arma::vec index = arma::linspace(1, row_obj, row_obj);

  // Looping through each element of reference set
  for(int i = 0; i < row_ref; i++){

    //# Calculating ratio between obj set and each ref observation
    arma::rowvec ref_i = ref.row(i);
    arma::mat score = arma::abs(obj.each_row() - ref_i);
    score = score.each_row() / ref_i;








  }

}
