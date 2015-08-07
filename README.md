# assert-bench

A project to bench Assert versions against themselves and others

## Notes

* assert-2.14: baseline version for benching

## Results

### 01_basic

Suite of 1000 tests producing 3 passing results per test

|    Version    | Real       | User       | Sys        |
| ------------- | ---------- | ---------- | ---------- |
| assert-2.15.0 |       2.73 |       2.57 |       0.15 |
| assert-2.14.0 |       2.88 |       2.62 |       0.17 |

### 02_double

Suite of 2000 tests producing 6 passing results per test

|    Version    | Real       | User       | Sys        |
| ------------- | ---------- | ---------- | ---------- |
| assert-2.15.0 |       4.97 |       4.70 |       0.25 |
| assert-2.14.0 |       5.08 |       4.82 |       0.25 |
