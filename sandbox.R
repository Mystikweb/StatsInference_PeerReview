library(dplyr)
library(ggplot2)
library(datasets)

vc_supp <- subset(ToothGrowth, supp == "VC")
oj_supp <- subset(ToothGrowth, supp == "OJ")

# vc_test <- t.test(len ~ dose, data = vc_supp, paired = FALSE, var.equal = FALSE)
# oj_test <- t.test(len ~ dose, data = oj_supp, paired = FALSE, var.equal = FALSE)
# 
# print(vc_test)
# print(oj_test)

small_dose <- subset(ToothGrowth, dose == 0.5)
medium_dose <- subset(ToothGrowth, dose == 1.0)
large_dose <- subset(ToothGrowth, dose == 2.0)

small_test <- t.test(len ~ supp, data = small_dose, paired = FALSE, var.equal = FALSE)
medium_test <- t.test(len ~ supp, data = medium_dose, paired = FALSE, var.equal = FALSE)
large_test <- t.test(len ~ supp, data = large_dose, paired = FALSE, var.equal = FALSE)

dosage_title <- c("0.5mg/day", "1mg/day", "2mg/day")
p_values <- c(small_test$p.value, medium_test$p.value, large_test$p.value)
conf1_values <- c(small_test$conf.int[1], medium_test$conf.int[1], large_test$conf.int[1])
conf2_values <- c(small_test$conf.int[2], medium_test$conf.int[2], large_test$conf.int[2])

summary_data <- data.frame(dosage_title, p_values, conf1_values, conf2_values, stringsAsFactors = FALSE)


str(summary_data)