# Load cleaned data
source("scripts/data_cleaning.R")

# Regression Models
# Linear Regression Model for Interval DV (military cuts support)
model1 <- regC(military_cuts_support ~ political_affiliation_dem + education_college + age_group_18_24, data = gvpt201_S24final)

# Logistic Regression Model for Binary DV (assault weapons ban support)
model2 <- logregC(assault_weapons_ban ~ political_affiliation_dem + age_group_18_24 + gender_male, data = gvpt201_S24final)

# Print summaries of the models
print(summary(model1))
print(summary(model2))
