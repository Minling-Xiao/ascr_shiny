#' Script to check required pakages for the 'ascr' shiny application are loaded
#' and launch the application given a user defined <path/to/ascr_shiny>

appDir <- "/Users/SIU/Desktop/scr/GitHub/ascr_shiny" ## user should set "path/to/ascr_shiny" to the path to where the ascr_shiny folder is

pkgs <- c("shiny","rmarkdown", "shinyjs", "shinycssloaders","shinythemes","animation","devtools","gstat","RANN","ggplot2","gridExtra","raster","rasterVis")
options(warn = -1)
for (i in pkgs){
    if (!require(i, quietly = TRUE, character.only = TRUE)){
        install.packages(i)
    }
}
if(!require("ascr",quietly = TRUE, character.only = TRUE) ){
    devtools::install_github("b-steve/ascr")
}
if(require("ascr",quietly = TRUE, character.only = TRUE) & packageVersion("ascr") < 2.1 ){
    devtools::install_github("b-steve/ascr")
}
options(warn = 0)
runApp(appDir, display.mode = "normal",launch.browser = TRUE)




