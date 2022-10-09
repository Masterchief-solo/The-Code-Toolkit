#Control Flow -- WHILE LOOP

die1<- -1 #set control variable

while (die1<1.25) { #check condition of control variable
  
  vd1d2<-c((die1+.25))#create vector
  
  prntvd1d2<-c(die1) #create vector die1
  
  print(prntvd1d2) #print vector as you process each die1
  
  die1<-die1+.25 #increment control variable
  
}
