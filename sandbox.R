library(ggplot2)

nosim <- 1000

n <- 40
lambda <- 0.2

mu_d <- 1/lambda
sd_d <- 1/lambda

mu_n <- sum(c(1:n))/n

test_data <- NULL
for(i in 1:nosim) test_data <- c(test_data, mean(rexp(n,lambda)))

sim_data <- data.frame(
    x = test_data
)

g <- ggplot(data = sim_data) +
    geom_histogram(aes(x)) +
    geom_vline(xintercept = mu_d)
    

print(g)