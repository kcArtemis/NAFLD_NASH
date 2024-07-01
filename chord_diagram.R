# Install and load the circlize package
#install.packages("circlize")
library(circlize)

# Recreate the dataset
data <- data.frame(
  From = c("Up_HN", "Up_HN", "Up_HN", "Up_HN", "Down_HN", "Down_HN", "Down_HN", "Down_HN", "Non_HN", "Non_HN", "Non_HN", "Non_HN"),
  To = c("Up_LN", "Down_LN", "Non_LN", "Up_HN", "Up_LN", "Down_LN", "Non_LN", "Down_HN", "Up_LN", "Down_LN", "Non_LN", "Non_HN"),
  Value = c(1329, 4, 112, 660, 10, 940, 124, 665, 261, 109 ,2668, 2850)
)

# Generate the circos plot
circos.clear() # Clear any previous plots
circos.par(gap.after = c(5, 5, 85, 5, 5, 85), start.degree = 58.5)
chordDiagram(data, transparency = 0.5, grid.col = c(Up_HN = "red", Down_HN = "blue", Non_HN = "green", Up_LN = "pink", Down_LN = "lightblue", Non_LN = "lightgreen"))

# Adding titles and labels for better clarity
title("Circos Plot of Connections Between Categories")
