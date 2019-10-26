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

  # vector to store matched index of observation in obj
  match = rep(NA, nrow(ref))

  # vector to store index of obj set
  index = c(1:nrow(obj))

  # Loop to iterate over each ref observation
  for(i in 1:nrow(ref)){

       # Calculating ratio between obj set and each ref observation
       ref.i = as.numeric(ref[i, ])
       score = sweep(abs(sweep(obj, 2, ref.i, FUN = '-')), 2, ref.i, FUN = '/')

       # Adjusting the score of circular
       if(length(circ_pos > 0)){

         # Manipulating the circular variable difference to fit in the range 0 to 180
         id.dcor = which(abs(obj[, circ_pos, drop = F] - ref.i[circ_pos]) > 180)
         score[id.dcor, circ_pos] = (360 - abs(obj[id.dcor, circ_pos, drop = F] - ref.i[circ_pos])) / ref.i[circ_pos]

       }

       # Checking which observation in test set matches reference set
       id = which(rowSums(sweep(score, 2, thres, FUN = '<')) == ncol(ref))


    }



}


