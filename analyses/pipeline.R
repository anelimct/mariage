
# Load packages required to define the pipeline:
library(targets)
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
  
  tar_target(data, open_data_folder(data_file)) 
  
)


