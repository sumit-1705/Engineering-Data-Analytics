Engineering Data Analytics (EDA) Project
Author      : Siren Group Project — Engineering Data Analytics
Institution : Adelaide University
Station     : Adelaide Airport(023034) and Kent Town(023090)
Data Source : Australian Bureau of Meteorology (BOM)
Period      : 1981 – 2020 (40 years)
Language    : R (tidyverse, ggplot2)
Software    : R Studio
--------------------------------------------------------------------------------
1. PROJECT OVERVIEW
--------------------------------------------------------------------------------

This project analyses 40 years of Annual, monthly and seasonal rainfall data (1981–2020)
recorded at Adelaide Airport and Kent Town weather station in Adelaide, South
Australia. The analysis uses exploratory data analysis (EDA) techniques to
visualise seasonal rainfall distribution across Summer, Autumn, Winter, and
Spring using R and ggplot2.

-------------------------------------------------------------------------------
2. REPOSITORY / FOLDER STRUCTURE
--------------------------------------------------------------------------------

Data file
Graphs
R Studio Code

--------------------------------------------------------------------------------
3. R PACKAGES REQUIRED
--------------------------------------------------------------------------------

  Install the required packages by running this in your R console:

    install.packages(c("tidyverse", "ggplot2"))

  Package     | Version  | Purpose
  ------------|----------|--------------------------------------------
  tidyverse   | >= 1.3   | Data manipulation and pipe operators (%>%)
  ggplot2     | >= 3.3   | Boxplot visualisation and styling


--------------------------------------------------------------------------------
4. HOW TO RUN THE SCRIPT (STEP-BY-STEP)
--------------------------------------------------------------------------------

  STEP 1 — Install R and RStudio (if not already installed)
           R       : https://cran.r-project.org/
           RStudio : https://posit.co/download/rstudio-desktop/

  STEP 2 — Download or clone this project folder to your computer
           Keep the folder structure exactly as shown in Section 2 above.

  STEP 3 — Open RStudio
           Go to File > Open File
           Navigate to: scripts/Kent_Town_023090__Seasonal_Rainfall.R
           Open the file.

  STEP 4 — Update the working directory path
           Find this line near the top of the script:

             setwd("C:/Users/Admin/OneDrive/Desktop/University/EDA/Project/Data files")

           Replace it with the path to the "data/" folder on YOUR computer.
           Example (Windows):
             setwd("C:/Users/YourName/Documents/project-folder/data")
           Example (Mac/Linux):
             setwd("/Users/YourName/Documents/project-folder/data")

  STEP 5 — Install packages (first time only)
           In the R console at the bottom of RStudio, run:

             install.packages(c("tidyverse", "ggplot2"))

  STEP 6 — Run the script
           Click the "Source" button (top-right of the script panel), OR
           press Ctrl+Shift+Enter (Windows) / Cmd+Shift+Enter (Mac)
           to run the entire script at once.

  STEP 7 — View the output
           The boxplot will appear in the "Plots" panel in RStudio.
           The figure is automatically saved to your data folder as:
             "Project Report 1.png"


--------------------------------------------------------------------------------
5. EXPECTED OUTPUT
--------------------------------------------------------------------------------

  The script produces a seasonal rainfall boxplot with the following features:

  - X-axis : Four seasons (AUTUMN, SPRING, SUMMER, WINTER)
  - Y-axis : Rainfall in millimetres (mm)
  - Colours: Each season shown in a distinct colour with a legend
  - Style  : Black and white theme (theme_bw) with error bar whiskers
  - Title  : "Kent Town(023090) Seasonal Rainfall"

  The figure is saved as a PNG file (width = 7 inches, height = 5 inches,
  300 DPI recommended for academic submission).


--------------------------------------------------------------------------------
6. TROUBLESHOOTING
--------------------------------------------------------------------------------

  PROBLEM : "could not find function" error
  SOLUTION: Package not loaded. Run:
              library(tidyverse)
              library(ggplot2)

  PROBLEM : "cannot open file" or "No such file or directory"
  SOLUTION: The setwd() path is wrong or the CSV filename doesn't match.
            Double-check the path in Step 4 above and confirm the CSV file
            is named exactly: IDCJAC0001_023090_Seasonality.csv

  PROBLEM : Plot does not appear
  SOLUTION: Click the "Plots" tab in the bottom-right panel of RStudio.
            If still blank, run the ggplot() block manually by selecting
            it and pressing Ctrl+Enter.

  PROBLEM : ggsave() does not save the file
  SOLUTION: Confirm your working directory is set correctly using:
              getwd()
            The PNG will be saved to whichever folder getwd() returns.
