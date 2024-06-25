library(RCPA3)
library(labelled)

# Load the dataset
load("GVPT201 S24 Final Survey.RData")

# Define and describe the dependent variables
# DV1: Support for deep cuts to the military budget
gvpt201_S24final$military_cuts_support <- as.numeric(gvpt201_S24final$Q9_2)
describeC(gvpt201_S24final$military_cuts_support)

# DV2: Support for outlawing civilians from purchasing assault weapons
gvpt201_S24final$assault_weapons_ban <- ifelse(gvpt201_S24final$Q17_8 > 50, "Support", "Do Not Support")
gvpt201_S24final$assault_weapons_ban <- factor(gvpt201_S24final$assault_weapons_ban, levels = c("Support", "Do Not Support"))
freqC(gvpt201_S24final$assault_weapons_ban, plot = TRUE)

# Create dummy variables for Independent Variables
# Political Affiliation as Democrat
gvpt201_S24final$political_affiliation_dem <- transformC(type="dummy",
                                                         x=Q5,
                                                         data=gvpt201_S24final,
                                                         response="Democrat",
                                                         confirm=F)
levels(gvpt201_S24final$political_affiliation_dem) <- c("No", "Yes")
freqC(gvpt201_S24final$political_affiliation_dem, plot = TRUE)

# Age Group 18-24
gvpt201_S24final$age_group_18_24 <- transformC(type="dummy",
                                               x=Q2,
                                               data=gvpt201_S24final,
                                               response="18-24 years old",
                                               confirm=F)
levels(gvpt201_S24final$age_group_18_24) <- c("No", "Yes")
freqC(gvpt201_S24final$age_group_18_24, plot = TRUE)

# Education Level for college
gvpt201_S24final$education_college <- transformC(type="dummy",
                                                 x=Q6,
                                                 data=gvpt201_S24final,
                                                 response="Currently in college",
                                                 confirm=F)
levels(gvpt201_S24final$education_college) <- c("No", "Yes")
freqC(gvpt201_S24final$education_college, plot = TRUE)

# Gender Male
gvpt201_S24final$gender_male <- transformC(type="dummy",
                                           x=Q1,
                                           data=gvpt201_S24final,
                                           response="Male",
                                           confirm=F)
levels(gvpt201_S24final$gender_male) <- c("No", "Yes")
freqC(gvpt201_S24final$gender_male, plot = TRUE)


# Generate histograms for DVs
histC(x=gvpt201_S24final$military_cuts_support, data = gvpt201_S24final,
      xlab = "Support Level for Military Cuts (0 to 100)",
      main = "Support for Military Budget Cuts",
      bar.col = "deepskyblue", plot = TRUE)

barplot(table(gvpt201_S24final$assault_weapons_ban),
        main = "Support for Outlawing Assault Weapons",
        ylab = "Frequency",
        xlab = "Support Level",
        col = "darkorange")

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


# Regression Models
# Linear Regression Model for Interval DV (military cuts support)
model1 <- regC(military_cuts_support ~ political_affiliation_dem + education_college + age_group_18_24, data = gvpt201_S24final)

# Logistic Regression Model for Binary DV (assault weapons ban support)
model2 <- logregC(assault_weapons_ban ~ political_affiliation_dem + age_group_18_24 + gender_male, data = gvpt201_S24final)

