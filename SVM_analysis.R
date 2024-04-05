library(e1071)

#reading data
happiness <- read.csv("./Zehaan/Happiness_cleaned.csv")


#train-test split
smp_size <- floor(0.75 * nrow(happiness))

set.seed(123)

train_ind <- sample(seq_len(nrow(happiness)), size = smp_size)

train <- happiness[train_ind, ]
test <- happiness[-train_ind, ]


#training model without PCA
model <- svm(Happiness.Score ~ . , data = train[,c(5,6,7)])

pred <- predict(model , test[,c(6,7)])

df <- data.frame ("pred" = pred , "true" = test[,5])

MAPE <- function(df){
  
  foo <- abs(df[,2]-df[,1])
  foo <- foo/df[,2]
  
  val <- (sum(foo)/nrow(df))*100
  
  return(val)
}

MSE <- function(df){
  
  foo <- (df[,2]-df[,1])^2
  
  return(sum(foo)/nrow(df))
  
}

Model_metrics <- c(MAPE(df),MSE(df))

#Training model with PCA

happiness2 <- happiness[,c(5,6,7)]
pcs <- prcomp(happiness2[,c(2,3)])
data <- pcs$x

smp_size <- floor(0.75 * nrow(data))

#split
set.seed(123)

dat <- cbind(data , happiness2$Happiness.Score)
train_ind <- sample(seq_len(nrow(dat)), size = smp_size)

train <- dat[train_ind, ]
test <- dat[-train_ind, ]

#SVM
model2 <- svm(x = train[,c(1,2)] , y = train[,3])

pred2 <- predict(model2 , test[,c(1,2)])

df2 <- data.frame ("pred" = pred2 , "true" = test[,3])

Model2_metrics <- c(MAPE(df2),MSE(df2))

<<<<<<< HEAD
print("Having proved that happiness and suicide rates and uncorrelated, we can go on to attempt to predict happiness values based purely on GDP and life expectancies. Obviously there are a lot more features, not present in this data , that might impact Happiness,but if the predicted values and fairly close enough to reported values, then this lends confidence to the model but also validates the analysis that it is independent of suicide rates")
print(paste0("Mean Absolute Percentage error of the SVM model =" , Model_metrics[1]))
print(paste0("Mean Squared Error of the SVM model =" , Model_metrics[2]))
=======

>>>>>>> 2d1549060b69c0ceded12cedf8e00c6aaeca047f
