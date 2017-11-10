checkHeight = function(students.input = students, sex.specific = TRUE) {
  setwd("innolab/R")
  source("utils.R")
  #' The checkHeight function calculates the difference between a given data set of persons with the mean height of that data set.
  #' You can choose between the overall mean and the sex specific mean by changing the sex.specific value
  #'

  # if sex.specific = T ----
  if (sex.specific == TRUE) {
    diff = apply(students.input, MARGIN = 1, FUN = function(s){
      if (s["sex"] == "M") {
        round(as.numeric(s["height"]) - myOwnMean(students.input$height[students.input$sex == "M"]), 2) * 100
      } else {
        round(as.numeric(s["height"]) - myOwnMean(students.input$height[students.input$sex == "F"]), 2) * 100
      }
    })

    students$diff = diff
    return(students)

  # if sex.specific = F ----
  } else {
    students.input$diff = round(students.input$height - myOwnMean(students.input$height), 2) * 100
    print(students.input)
  }
}
