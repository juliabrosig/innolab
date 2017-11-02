name = "Hans"
eyecolor = "brown"
meal = "Pizza"
print(paste0(name, " has ", eyecolor, " eyes and enjoys eating ", meal, " the most!"))


printer = function(name, eyecolor, meal){
  print(paste0(name, " has ", eyecolor, " eyes and enjoys eating ", meal, " the most!"))
}

printer("Julia", "brown", "Pizza")
