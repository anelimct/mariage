
# Load packages required to define the pipeline:
library(targets)
library(ggplot2)
# library(tarchetypes) # Load other packages as needed.

# Set target options:
tar_option_set(
  packages = c("tibble")
)

tar_config_set(store = "outputs/pipeline/", script = "analyses/pipeline.R")

# Run the R scripts in the R/ folder with your custom functions:
tar_source()

# tar_source("other_functions.R") # Source other scripts as needed.

# Replace the target list below with your own:
list(
  
  tar_target(url, url_data()),

  tar_target(data_file_zip, download_data(url)), 
  
  tar_target(data_file,  unzip_data(data_file_zip)), 
  
  tar_target(data, open_data_folder(data_file)), 
  
  tar_target(mariage_gay, filtre_mariages_gay(data)), 
  
  tar_target(mariage_lesbien, filtre_mariage_lesbian(data)), 
  
  tar_target(mariage_hetero, filtre_mariage_hetero(data)),
  
  tar_target(hist_mois, hist_mois_mariage(data)),
  
  # tar_target(diff_age_gay, difference_age_absolu_gay(mariage_gay)[1]),
  # 
  # tar_target(diff_age_lesb, difference_age_absolu_lesbien(mariage_lesbien)[1]),
  # 
  # tar_target(diff_age_hetero, difference_age_absolu_hetero(mariage_hetero)[1]),
  
  #tar_target(plot_violon, plot_violin_diff_type_de_mariage(diff_age_hetero, diff_age_lesb, diff_age_gay)),
  
  tar_target(wedding_counts, wed_reg(data)),
  
  tar_target(map_wedding, open_deps(wedding_counts)),
  
  tar_target(wedding_counts_gay, wed_reg_prop(mariage_gay, data)),
  tar_target(wedding_counts_lesb, wed_reg_prop(mariage_lesbien, data)),
  
  tar_target(map_wedding_prop_gay, open_deps(wedding_counts_gay)),
  tar_target(map_wedding_prop_lesb, open_deps(wedding_counts_lesb)),
  
  tar_target(gay_age_diff, difference_age_absolu_gay(mariage_gay)),
  tar_target(lesbian_age_diff, difference_age_absolu_lesbien(mariage_lesbien)),
  tar_target(hetero_age_diff, difference_age_absolu_hetero(mariage_hetero)),
  
  tar_target(map_diff_gay, open_deps2(gay_age_diff)),
  tar_target(map_diff_lesb, open_deps2(lesbian_age_diff)),
  tar_target(map_diff_het, open_deps2(hetero_age_diff)),
  
  tarchetypes::tar_quarto(report, "mariage.qmd")
  
)


