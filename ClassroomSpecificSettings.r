#rm(list=ls())

#install.packages("rstudioapi")
library(rstudioapi)

my_work_dir = rstudioapi::getActiveDocumentContext()$path 


#my_work_dir = gsub("\\\\", "/", my_work_dir)

pathParts = strsplit(my_work_dir,'/')[[1]]

my_work_dir = paste(pathParts[1:length(pathParts)-1],sep='', collapse = "/")

setwd(my_work_dir)

libPath = paste(my_work_dir,'/','my_libs', sep="")

if (!file.exists(libPath))
{
  dir.create(libPath, showWarnings = FALSE)  
}


dataPath = paste(my_work_dir,'/','Data', sep="")

if (!file.exists(dataPath))
{
  dir.create(dataPath, showWarnings = FALSE)  
}

twitterDataPath = paste(my_work_dir,'/','Data','/','Twitter', sep="")

if (!file.exists(twitterDataPath))
{
  dir.create(twitterDataPath, showWarnings = FALSE)  
}


stackDataPath = paste(my_work_dir,'/','Data','/','Stack', sep="")

if (!file.exists(stackDataPath))
{
  dir.create(stackDataPath, showWarnings = FALSE)  
}


scopusDataPath = paste(my_work_dir,'/','Data','/','Scopus', sep="")

if (!file.exists(scopusDataPath))
{
  dir.create(scopusDataPath, showWarnings = FALSE)  
}


if (libPath %in% .libPaths() == FALSE)
{
  .libPaths(c(libPath,.libPaths()))
}

#Key Janne
sc_api_key_Janne = "320b07d78fa6a4b47b7dcc1f156658de"

sc_api_key_Ohto = "cbf4132ececcb84b58a2aa5244ba7ce7"

so_api_key = "EgDQqc14dkQjHIDevXFJ)A(("

tw_api_key = ""

getoldtweets_path = paste(my_work_dir,"/GetOldTweets-java-master", sep="")


#-----Removing unnecessary words----------------
#various stopword lists can be used https://cran.r-project.org/web/packages/stopwords/stopwords.pdf
#stopword list is also context specific. Here you can do manual removals
#also automated methods tf/idf exist. EDIT
#my_stopwords = c(stopwords::stopwords(language = "en", source = "snowball"),"botnet", "botnets")

#below changes by janne
#Need to remove stopwords from everywhere else so you only need to edit them here!
#remember to install install.packages("stopwords", dependencies = TRUE)
library("stopwords")
my_stopwords = c(stopwords::stopwords(language = "en", source = "snowball"),"botnet", "botnets")
