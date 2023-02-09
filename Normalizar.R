library(readr)
crx <- read_csv("Machine Learning/crx.data", 
                col_names = FALSE)
View(crx)

crx[crx == "?"] = NA

#define Min-Max normalization function
min_max_norm = function(x) {
  (x - min(x)) / (max(x) - min(x))
}

#apply Min-Max normalization to first four columns in crx dataset
crx_norm = as.data.frame(lapply(crx[1:16], min_max_norm))
