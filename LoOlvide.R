# Helper packages
library(dplyr) # for data wrangling
library(ggplot2) # for awesome graphics
library(rsample) # for data splitting

# Modeling packages
library(caret) # for classification and regression training
library(kernlab) # for fitting SVMs

# Model interpretability packages
library(pdp) # for partial dependence plots, etc.
library(vip) # for variable importance plots

# Load attrition data
df <- attrition %>% mutate_if(is.ordered, factor, ordered = FALSE)

# Create training (70%) and test (30%) sets
set.seed(123) # for reproducibility
churn_split <- initial_split(df, prop = 0.7, strata = "Attrition")
churn_train <- training(churn_split)
churn_test <- testing(churn_split)
