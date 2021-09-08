library(rstan)
rstan_options(auto_write=TRUE)
options(mc.cores=parallel::detectCores())

file_beer_sales_1 <- read.csv("2-4-1-beer-sales-1.csv")

sample_size<-nrow(file_beer_sales_1)
data_list<-list(sales=file_beer_sales_1$sales, N=sample_size)

mcmc_result<-stan(
  file="2-4-1-calc.mean-variance.stan",
  data=data_list,
  seed=1,
  chains=4,
  iter=2000,
  warmup=1000,
  thin=1
)

print(mcmc_result, probs=c(0.025,0.5,0.975))

traceplot(mcmc_result)