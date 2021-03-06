## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=F-------------------------------------------------------------------
#  install("ProSGPV")

## ----eval=F-------------------------------------------------------------------
#  devtools::install_github("zuoyi93/ProSGPV")

## -----------------------------------------------------------------------------
library(ProSGPV)

## -----------------------------------------------------------------------------
x <- spine[,-ncol(spine)]
y <- spine[,ncol(spine)]

sgpv.2s.l <- pro.sgpv(x,y,family="binomial") 

sgpv.2s.l

## -----------------------------------------------------------------------------
summary(sgpv.2s.l)

## -----------------------------------------------------------------------------
coef(sgpv.2s.l)

## -----------------------------------------------------------------------------
head(predict(sgpv.2s.l))

## -----------------------------------------------------------------------------
set.seed(1)
data.log <- gen.sim.data(n=80,p=100,s=4,beta.min=0.5,beta.max=1.5,family="poisson")

x <- data.log[[1]]
y <- data.log[[2]]
(true.index <- data.log[[3]])
(true.beta <- data.log[[4]])

sgpv.2s.p <- pro.sgpv(x,y,family="poisson")
sgpv.2s.p

## -----------------------------------------------------------------------------
summary(sgpv.2s.p)

## -----------------------------------------------------------------------------
coef(sgpv.2s.p)

## -----------------------------------------------------------------------------
head(predict(sgpv.2s.p))

## -----------------------------------------------------------------------------
set.seed(1)
data.log <- gen.sim.data(n=10,p=100,s=4,beta.min=0.5,beta.max=1.5,family="poisson")

x.new <- data.log[[1]]
y.new <- data.log[[2]]

data.frame(Observed=y.new,Predicted=predict(sgpv.2s.p,newdata=x.new))


## ----eval=F-------------------------------------------------------------------
#  plot(sgpv.2s.p,lambda.max = 0.5)

## ----eval=F-------------------------------------------------------------------
#  plot(sgpv.2s.p,lambda.max = 0.5,lpv=1)

## -----------------------------------------------------------------------------
set.seed(1)
data.cox <- gen.sim.data(n=100, p=20, s=4, family="cox", 
                         beta.min=0.5, beta.max=1.5, sig=2)

x <- data.cox[[1]]
y <- data.cox[[2]]
(true.index <- data.cox[[3]])
true.beta <- data.cox[[4]]

sgpv.2s.c <- pro.sgpv(x,y,stage=2,family="cox")
sgpv.2s.c

## -----------------------------------------------------------------------------
sgpv.1s.c <- pro.sgpv(x,y,stage=1,family="cox")
sgpv.1s.c

## ----eval=F-------------------------------------------------------------------
#  plot(sgpv.1s.c)

