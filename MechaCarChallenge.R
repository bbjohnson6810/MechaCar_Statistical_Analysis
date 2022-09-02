#####################
### Deliverable 1 ###
#####################

# 3: load dplyr library
library(dplyr)

# 4: read in MechaCar data
cars<-read.csv("data/MechaCar_mpg.csv")

# 5: linear regression
car_mod <- lm(mpg ~ vehicle_length + vehicle_weight + 
                spoiler_angle + ground_clearance + factor(AWD), cars)

# 6: p-value and r^2
mod_summary <- summary(car_mod)
mod_summary
mod_r2 <- mod_summary$r.squared # 0.7149033
mod_pval <- 5.35e-11 # hard-coded from summary output


#####################
### Deliverable 2 ###
#####################

# 2: read in Suspension_Coil data
coils <- read.csv("data/Suspension_Coil.csv")

# 3: summary dataframe: suspension coil PSIs
psi_summary <- coils %>% summarize(mean_psi = mean(PSI),  # mean PSI
                                   med_psi = median(PSI), # median PSI
                                   var_psi = var(PSI),    # variance of all PSIs
                                   sd_psi = sd(PSI),      # standard deviation of all PSIs
                                   .groups = "keep")
psi_summary

# 4: summary dataframe: manufacturing lots
lot_summary <- coils %>% group_by(Manufacturing_Lot) %>% 
  summarize(mean_psi = mean(PSI),  # mean PSI per lot
            med_psi = median(PSI), # median PSI per lot
            var_psi = var(PSI),    # variance of all PSIs per lot
            sd_psi = sd(PSI),      # standard deviation of all PSIs per lot
            .groups = "keep")
lot_summary


#####################
### Deliverable 3 ###
#####################

# 1: t-test: all lots vs. a population mean of 1500 PSI
t.test(coils$PSI, mu=1500) # p = 0.060

# 2: t-test: each lot vs. a population mean of 1500 PSI
t.test(subset(coils, Manufacturing_Lot == "Lot1")$PSI, mu=1500) # p = 1.000
t.test(subset(coils, Manufacturing_Lot == "Lot2")$PSI, mu=1500) # p = 0.607
t.test(subset(coils, Manufacturing_Lot == "Lot3")$PSI, mu=1500) # p = 0.042

