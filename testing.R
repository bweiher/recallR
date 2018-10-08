
installed_packages <- as.character(as.data.frame(installed.packages())$Package)

pat <- "#libs:"
# TODO decide about methodology ,,, do we wanna 
# TODO do a check if its already been written to Rprofile. ~ DELTE In that case! 
register_libs <- function(){
  installed_packages <- paste(as.character(as.data.frame(installed.packages())$Package), collapse = ",")
  setwd("~") ; shell(paste("echo", pat, installed_packages, ">> .Rprofile"))
  message(paste0("Libraries addied to .RProfile at ", getwd(), "/.Rprofile"))
}

register_libs()


# find libs too

# TODO a function that integrates with a github profile and pulls data from there.. eg .Rprofile 


lines <- readLines("~/.Rprofile")
packages_registered <- trimws(strsplit(gsub(pattern = pat, x = lines[grepl("^#libs", lines)], replacement = ""),",")[[1]],"both")
what_to_install <- setdiff(packages_registered, as.character(installed.packages()[,1]))


# does the pat exist from above ?
pat_exists_vector <- grepl(pat, lines) 

#paste(other_items[length(other_items)], "\n")

# if it exists already, edit that line only...
if(sum(pat_exists) > 0){
  print("m")
}

# pull in other lines
other_items <- lines[!pat_exists_vector]

# item to adjust
item_to_adjust <- lines[pat_exists_vector]
lib_to_add <- "meowlibrary" # TODO add in collapse paste ,
item_to_adjust <- paste(trimws(item_to_adjust,"both"), trimws(lib_to_add, "both"), sep = ",")


writeLines(text = c(other_items, item_to_adjust),con = "~/.Rprofile")







