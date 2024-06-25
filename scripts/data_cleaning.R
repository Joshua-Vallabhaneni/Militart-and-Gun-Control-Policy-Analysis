# Load data
source("scripts/data_loading.R")

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
