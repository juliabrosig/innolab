#' The checkHeight function calculates the difference between a given data set of persons with the mean height of that data set.
#' You can choose between the overall mean and the sex specific mean by changing the sex.specific value
#'
#' @export
#' @import dplyr
#' @import checkmate

checkHeight = function(students.input = students, sex.specific = TRUE,
                       print.statement = FALSE) {
  load("./R/data/students.rda")
  a = getwd()
  print(a)
  assertLogical(sex.specific)
  assertDataFrame(students.input,
                  types = c("numeric", "numeric", "numeric", "factor", "character"),
                  min.rows = 4,
                  ncols = 5)
  assertNumeric(students.input[, 3], lower = 1.3, upper = 2.4)
  assertFactor(students.input[, 4], n.levels = 2)
  # if sex.specific = T
  if (sex.specific == TRUE) {
    diff = apply(students.input, MARGIN = 1, FUN = function(s){
      if (s["sex"] == "M") {
        round(as.numeric(s["height"]) -
                myOwnMean(students.input$height[students.input$sex == "M"]),
              2) * 100
      } else {
        round(as.numeric(s["height"]) -
                myOwnMean(students.input$height[students.input$sex == "F"]),
              2) * 100
      }
    })
    students.input$diff = diff
    print("Yippie, I calculated the mean differences!")
    return(students.input)

    # if sex.specific = F
  } else {
    students.input$diff = round(students.input$height -
                                  myOwnMean(students.input$height), 2) * 100
    print("Yippie, I calculated the mean differences!")
    return(students.input)
  }
}
