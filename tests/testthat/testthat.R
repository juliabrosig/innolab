library(testthat)
library(innolab)

test_check("innolab")

# (3.2)
# (3.2.1)
students_subset1 = students[1,]
students_subset2 = students[1:5, ]
students_subset3 = students[-4, ]
test_that("Test that the output contains as many observations as the input", {
  expect_data_frame(checkHeight(students_subset1),
                    nrows = nrow(students_subset1))
  expect_data_frame(checkHeight(students_subset2),
                    nrows = nrow(students_subset2))
  expect_data_frame(checkHeight(students_subset3),
                    nrows = nrow(students_subset3))
})

# (3.2.2)
h = students
h$height = 2
test_that("Test if both options of sex.specific work equally", {
  expect_equal(checkHeight(h, sex.specific = TRUE),
               checkHeight(h, sex.specific = FALSE) )
})

# (3.2.3)
h2 = students
h2$height = NULL
n = students
n$name = NULL

test_that("if it cannot find all required variables in the input data frame.", {
  expect_error(checkHeight(h2), "error")
  expect_error(checkHeight(n), "error")
})

# (3.2.4)
hc = students
hc$height = as.character(students$height)
sc = students
sc$sex = as.character(sc$sex)
tt = students
tt[1,"height"] = 5
ts = students
ts[5,"height"] = 0

test_that("arg checks", {
  expect_error(checkHeight(students, sex.specific = "A"),
               "sex.specific - only logical allowed")
  expect_error(checkHeight(students, print.statement = "A"),
               "print.statement - only logical allowed")
  expect_error(checkHeight(hc), "only numeric allowed")
  expect_error(checkHeight(sc), "only factor allowed")
  expect_error(checkHeight(ts), "must be higher than 1.3")
  expect_error(checkHeight(tt), "must be lower than 2.4")
})


# (3.2.5)
test_that("print check", {
  expect_output(checkHeight(students, print.statement = TRUE),
                "Yippie, I calculated the mean differences!")
})
