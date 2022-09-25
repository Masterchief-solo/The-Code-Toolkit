#create vector 1 for matrix construction
v1mat<-c(14,22,31,46,25,36,7,8,10,13,9)

#create vector 2 for matrix construction
v2mat<-c(20,3,15,4,5,26,47,8,9,10,11)

# the rbind creates a matrix as rows
matD<-rbind(v1mat,v2mat) 
matname<-matD
rownames(matname)<-c('datarow1','datarow1')
colnames(matname)<-c('col1','col2','col3','col4','col5','col6','col7','col8','col9','col10','col11')

# matname addition
matname+matname

# matname subtraction
matname-matname * -1

# matname division 
matname /2 ** -1
