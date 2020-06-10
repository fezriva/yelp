install.packages("geosphere")
library("geosphere")

df = read.csv("C:/Users/georg/Desktop/yelp.csv")
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
df$city <- trim(df$city)
df$density = 0

cities <- split.data.frame(df,df$city)


func2 <- function(x){
  x$density <- nrow(x)
  return(x)
}

func <- function(x){
  print(x$city)
  categories <- split.data.frame(x,x$categories,drop = TRUE)
  categories[] <- lapply(categories, func2)
  x <- dplyr::bind_rows(categories)
  return (x)
}

cities[] <- lapply(cities,func)

