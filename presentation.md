Course Project: Shiny Application and Reproducible Pitch.
========================================================
author: Eduardo Avaria
date: 06-20-2015

Summary
========================================================

The sample application built is a simple calculator that takes a date as user input with the date picker widget, and performs some calculations on it.

This was built in the context of the course ***Developing Data Products*** od the Coursera Data Science Specialization.

Please have in mind that the application is simple as hell on purpose given the short time frame.  

Instructions on how to use the application can be found in the lower left bottom of the main screen.

Functionality
========================================================

Specifically, once a date of birth is set on the system, it can:

- Calculate the exact age of the person born that day, including years, months and days.
- Tell the person what his Zodiac sign is.
- Tell the person on which day of the week he was born.

To get any of the above information, the user needs to mark the checkbox corresponding to each data.

Technical Details
========================================================

The application is fully contained in the files ***server.R*** and ***ui.R***, and the user input widgets are monitored for changes.

Once a change is detected, a segment of code is executed, making the calculations requested, and the screen is updated.

To show information to the user there's two sections available. The first one will always show the date the user has inserted, and the second one will show the results of the calculations made, including an error message if the supplied date is in the future.

How it Works
========================================================

The starting point of the application is the ***dateInput()*** widget. It is a simple text field, that will show a date picker when clicked, allowing the user to select a date, or manually input it by text.

Once a date is registered, it is assigned to a variable, and another variable keeps the current system date, allowing us to make calculations.

```r
userDate <- as.Date("1990-01-30")
systemDate <- Sys.Date()
c(userDate,systemDate)
```

```
[1] "1990-01-30" "2015-06-20"
```

