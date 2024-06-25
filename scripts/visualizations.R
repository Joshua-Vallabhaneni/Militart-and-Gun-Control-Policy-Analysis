# Load cleaned data
source("scripts/data_cleaning.R")

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

# Advanced visualizations
library(ggplot2)

# Density plot for military cuts support
ggplot(gvpt201_S24final, aes(x = military_cuts_support)) +
  geom_density(fill = "blue", alpha = 0.5) +
  labs(title = "Density Plot of Support for Military Budget Cuts",
       x = "Support Level for Military Cuts (0 to 100)",
       y = "Density")

# Bar plot with ggplot for assault weapons ban support
ggplot(gvpt201_S24final, aes(x = assault_weapons_ban)) +
  geom_bar(fill = "orange") +
  labs(title = "Bar Plot of Support for Outlawing Assault Weapons",
       x = "Support Level",
       y = "Frequency")
