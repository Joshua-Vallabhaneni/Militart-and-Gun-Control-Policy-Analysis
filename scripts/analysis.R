# Load cleaned data
source("scripts/data_cleaning.R")

# Compute the means for each IV
mean_political_affiliation_dem <- mean(gvpt201_S24final$political_affiliation_dem == "Yes", na.rm = TRUE)
mean_age_group_18_24 <- mean(gvpt201_S24final$age_group_18_24 == "Yes", na.rm = TRUE)
mean_education_college <- mean(gvpt201_S24final$education_college == "Yes", na.rm = TRUE)
mean_gender_male <- mean(gvpt201_S24final$gender_male == "Yes", na.rm = TRUE)

# Print the means for IVs used in both regression and logistic regression models
print("Means for IVs used in Regression Model:")
print(paste("Mean Political Affiliation (Democrat):", mean_political_affiliation_dem))
print(paste("Mean Age Group 18-24:", mean_age_group_18_24))
print(paste("Mean Education (Currently in College):", mean_education_college))

print("Means for IVs used in Logistic Regression Model:")
print(paste("Mean Political Affiliation (Democrat):", mean_political_affiliation_dem))
print(paste("Mean Age Group 18-24:", mean_age_group_18_24))
print(paste("Mean Gender (Male):", mean_gender_male))
