library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("All about your birthdate - Shiny sample app"),
  sidebarPanel(
    dateInput("birthdate", "Select your date of birth"),
    checkboxGroupInput("display", "Select the information you want to know:",
                       c("Display Age" = "1",
                         "Display Zodiac Sign" = "2",
                         "Weekday of Birth" = "3")),
    h3("Instructions:"),
    h5("To use this application, simply click on the textbox above to activate the date picker and use the widget to select your date of birth."),
    h5("You can also type your date of birth manually in the following format YYYY-MM-DD, like 2015-06-20 for June 20 of 2015."),
    h6("Below the date of birth box, there's 3 checkboxes, each one of them will make the server calculate the shown information and present it on the main window at your left.")
  ),
  mainPanel(
    h4('Supplied Birthdate:'),
    verbatimTextOutput("oid1"),
    verbatimTextOutput("oid2")
  )
))