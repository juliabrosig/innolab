#' This function calculates the mean of one column

myOwnMean = function(vec){
  assert(
    checkNumeric(vec, lower = 1.3, upper = 2.4),
    checkDataFrame(vec, types = "numeric")
  )
  m = sum(vec)/length(vec)
  return(m)
}
