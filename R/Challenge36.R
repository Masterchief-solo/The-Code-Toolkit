# create starting_weights vector
starting_weights <- c(145,122,127,245,362,152)

# create ending_weights vector
ending_weights <- c(125,128,117,205,300,173)

# subtract ending and starting weights into the weight_loss variable
weight_loss <- starting_weight-ending_weight

# determine the total weight loss
sum(weight_loss)

# determine the mean weight loss
mean(weight_loss)
