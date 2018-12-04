test <- tbl_df(read.csv("./Projetos/Projeto_1/A/GTHouse/test.csv"))

train <- tbl_df(read.csv("./Projetos/Projeto_1/A/GTHouse/train.csv"))

miss <- colSums(is.na(train))
miss_prec <- miss/nrow(train)*100
print(miss_prec[miss_prec > 20])
col_miss <- names(miss_prec[miss_prec>20])

train[,c(col_miss)] <- NULL
test[,c(col_miss)] <- NULL

sd <- names(which(sapply(test,is.factor)))
f <- c()
for(i in sd){
  f <- c(f, length(levels(test[,i])))
}
print(sd[which(f == 1)])
train$Utilities <- NULL
test$Utilities <- NULL

library(mice)
temptrain <- mice(train, m = 5, method = "rf", maxit = 10)
trainnew <- complete(temptrain, 1)
temptest <- mice(test, m = 5, method = "rf", maxit = 10)
testnew <- complete(temptest, 1)

housedum <- rbind(trainnew %>% select(-SalePrice), testnew)

library(caret)
housedumnew <-  dummyVars(~., data = housedum)
housedumpred <- predict(housedumnew,housedum)

trainnewpred <- housedumpred[1:nrow(trainnew),]
testnewpred <- housedumpred[-(1:nrow(trainnew)),]


prin_train <- prcomp(trainnewpred, scale. = T)
std_dev <- prin_train$sdev
pr_var <- std_dev^2
prop_varex <- pr_var/sum(pr_var)

plot(prop_varex, xlab = "Principal Component", ylab = "Proportion of Variance Explained",
     type = "b")

plot(cumsum(prop_varex), xlab = "Principal Component", 
     ylab = "Cumulative Proportion of Variance Explained", type = "b")

# Train data set
housetrain <- data.frame(SalePrice = train$SalePrice, prin_train$x)
housetrain <- housetrain[,1:151]
# Test data set
housetest <- predict(prin_train, newdata = testnewpred)
housetest <- as.data.frame(housetest)
housetest <- housetest[,1:150]


library(caret)

modelnames <- paste(names(getModelInfo()), collapse=',  ')
modelnames

modelLookup(algo)


control <- trainControl(method = "repeatedcv", repeats = 3)

model_dt <- train(SalePrice~., data=housetrain, trControl = control, method = "rpart",tuneLength = 15)
# Random Forest:
model_rf <- train(SalePrice~., data=housetrain, trControl = control, method = "rf", tuneLength = 15)
# kNN
model_knn <- train(SalePrice~., housetrain, trControl = control, method = "knn", tuneLength = 15)
# Decision Tree
pred_dt <- predict(model_dt, housetest)
# Random Forest
pred_rf <- predict(model_rf, housetest)
# kNN
pred_knn <- predict(model_knn, housetest)

