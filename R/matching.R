######### function to match data set##################
# match.cov : main matching function given data sets
# ref : data set considered as a reference
# obj : data set whose each observation searches for a matching observation in ref
# thres : threshold against which similarity is obtained between ref and obj data sets
# circ_pos : position of circular variables (such as wind direction etc), if supplied by user
match.cov = function(ref, obj, thres, circ_pos = NULL){

  # Ensuring that the data sets are converted to matrix
  ref = as.matrix(ref)
  obj = as.matrix(obj)

}


