setwd("C:/Users/taturyousuke/Documents/R/第3部第4章/")
#パッケージ読み込み
library(rstan)
library(bayesplot)
#計算の高速化
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

#分析対象のデータ
file_beer_sales_2 <- read.csv("3-2-1-beer-sales-2.csv")
#サンプルサイズ
sample_size <- nrow(file_beer_sales_2)

#formulaの作成
formula_lm <- formula(sales ~ temperature)
#デザイン行列の作成
X <- model.matrix(formula_lm, file_beer_sales_2)

#サンプルサイズ
N <- nrow(file_beer_sales_2)
#デザイン行列の列数（説明変数＋1）
K <- 2
#応答変数
Y <- file_beer_sales_2$sales
#listにまとめる
data_list_design <- list(N = N, K = K,Y = Y, X = X)

#MCMCの実行
mcmc_result_design <- stan(
  file = "3-4-1-lm-design-matrix.stan",
  data = data_list_design,
  seed = 1
)