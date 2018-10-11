library(glue)

installed_packages <- as.character(as.data.frame(installed.packages())$Package)
installed_packages_p <- paste(installed_packages, collapse = ",")
file <- ".Rprofile"
pat <- "#libs:"


# TODO decide about methodology ,,, do we wanna 
# TODO do a check if its already been written to Rprofile. ~ DELTE In that case! 
# TODO or append missing items 
# TODO create central repoo
# TODO creat permanunent backup solution
# TODO a function that integrates with a github profile and pulls data from there.. eg .Rprofile 


register_libs <- function(file = ".Rprofile"){
  
  setwd("~")
  
  if(file.exists(file)){ # .Rproilee exists
    lgl <- grepl(pat, readLines(file))
    if(any(lgl)){ # libraries have been written already
      
      thing <- c(readLines(file), glue("{pat} {installed_packages_p"))
      writeLines(text = thing, con = ".Rprofile")
      shell(glue("echo {pat} {thing} > .Rprofile "))
      
    } else { # this thingy already exists in .Rprofile
      shell(glue("echo {pat} {installed_packages} >> .Rprofile"))
      message(paste0("Libraries appended to .RProfile at ", getwd(), file))  
    }
  } # rprofile dont exist
  
  
}

register_libs()


# find libs too



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







