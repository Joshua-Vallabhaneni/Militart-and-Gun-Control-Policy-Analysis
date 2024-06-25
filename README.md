# Survey Analysis Project

This project leverages data visualization and statistical analysis in R to analyze over 1,500 survey responses on military and gun control policies, leading to the ongoing development of a professional memo for a U.S. senator.

## Directory Structure
- `data/`: Contains the dataset (`GVPT201_S24_Final_Survey.RData`).
- `scripts/`: Contains the R scripts for data loading, cleaning, analysis, visualizations, and models.
  - `data_loading.R`: Script for loading the dataset.
  - `data_cleaning.R`: Script for cleaning the data and creating variables.
  - `analysis.R`: Script for computing descriptive statistics and means of IVs.
  - `visualizations.R`: Script for generating visualizations.
  - `models.R`: Script for running regression models.

## Setup
1. Clone the repository.
2. Place the `GVPT201_S24_Final_Survey.RData` file in the `data/` directory.
3. Run the scripts in the following order:
   - `data_loading.R`
   - `data_cleaning.R`
   - `analysis.R`
   - `visualizations.R`
   - `models.R`

## Features
- Data loading and cleaning
- Creation of dependent and independent variables
- Descriptive statistics and means computation
- Advanced visualizations with `ggplot2`
- Linear and logistic regression models

## Future Enhancements
- Add more advanced visualizations
- Include interaction terms in regression models
- Perform cross-validation for model evaluation

## Contact
For any questions, please contact [your email].

