data {
  int N;            // サンプルサイズ
  int K;            // デザイン行列の行数（説明変数の数+1）
  vector[N] Y;      // 応答変数
  matrix[N, K] X;   // デザイン行列
}

parameters {
  vector[K] b;         // 切片を含む係数ベクトル
  real<lower=0> sigma; // データのばらつきを表す標準偏差
}

model {
  vector[N] mu = X * b;
  Y ~ normal(mu, sigma);
}
