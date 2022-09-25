# vector representing number of females in high school
v1 <- c(121, 131, 134, 128)

# vector representing number of males in high school
v2 <- c(152, 137, 129, 142)

# combing v1 and v2 by column
matCol = cbind(v1, v2)
matCol

# transpose the matrix matCol
matRow <- t(matCol)
matRow

# Adding labels to rows and columns of matrix matRow
rownames(matRow) <- c('F', 'M')
colnames(matRow) <- c('9th', '10th', '11th', '12th')
matRow
