// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// matchcov
arma::vec matchcov(arma::mat& ref, arma::mat& obj, arma::rowvec& thres, arma::rowvec& circ_pos, int flag);
RcppExport SEXP _WindPlus_matchcov(SEXP refSEXP, SEXP objSEXP, SEXP thresSEXP, SEXP circ_posSEXP, SEXP flagSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat& >::type ref(refSEXP);
    Rcpp::traits::input_parameter< arma::mat& >::type obj(objSEXP);
    Rcpp::traits::input_parameter< arma::rowvec& >::type thres(thresSEXP);
    Rcpp::traits::input_parameter< arma::rowvec& >::type circ_pos(circ_posSEXP);
    Rcpp::traits::input_parameter< int >::type flag(flagSEXP);
    rcpp_result_gen = Rcpp::wrap(matchcov(ref, obj, thres, circ_pos, flag));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_WindPlus_matchcov", (DL_FUNC) &_WindPlus_matchcov, 5},
    {NULL, NULL, 0}
};

RcppExport void R_init_WindPlus(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
