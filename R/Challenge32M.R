matX = matrix(
  c(78,65,82,66,79,62,77,65,81,68,84,70,88,72)   # high low temp values
  nrow=2,                                        # number of rows
  ncol=7,                                        # number of columns
  byrow = FALSE)                                 # fill matrix by columns
matX                                             # print the matrix

rownames(matX) <- c('High','Low')                # name the row High & Low
colnames(matX) <- c(‘M’,’T’,’W’,’R’,’F’,’S’,’S’) # name the col M-S
matX

# select the high temp for Wednesday
matX['High','W']
