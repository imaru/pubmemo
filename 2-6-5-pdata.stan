data {
  int Nx;
  int Ny; // サンプルサイズ
  vector[Nx] datax;      // ビールAの売り上げデータ
  vector[Ny] datay;      // ビールBの売り上げデータ
}

parameters {
  real mu_x;                // ビールAの平均
  real<lower=0> sigma_x;    // ビールAの標準偏差
  real mu_y;                // ビールBの平均
  real<lower=0> sigma_y;    // ビールBの標準偏差
}

model {
  // 平均mu、標準偏差sigmaの正規分布に従ってデータが得られたと仮定
  datax ~ normal(mu_x, sigma_x);
  datay ~ normal(mu_y, sigma_y);
}

generated quantities {
  real diff;                // ビールAとBの売り上げ平均の差
  diff = mu_x - mu_y;
}
