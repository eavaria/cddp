library(shiny)
shinyServer(
  function(input, output) {
    output$oid1 <- renderPrint({format(input$birthdate,"%A %d %B %Y")})
    output$oid2 <- renderPrint(ProcessOptions({input$display}))
    ProcessOptions <- function(x){
      baseText <- "Requested Data:"
      if (length(x)==0){
        return(cat(paste(baseText,"Nothing has been requested yet.",sep="")))
      }
      else if (length(x)>0){
        for (i in 1:length(x)){
          baseText <- paste(baseText,showOption(x[i]),sep="\n")
        }
        return(cat(baseText))
      }   
      }
      showOption <- function(i){
        if (i==1){
          date1 <- strptime(input$birthdate, format="%d.%m.%Y")
          date2 <- strptime(date(), format="%d.%m.%Y")
          ageDays <- difftime(Sys.Date(),input$birthdate,units="days")
          ageDays <- as.numeric(ageDays)
          remDays <- floor((ageDays %% 365.25) %% 30.4)
          baseAge <- paste(remDays, "days old",sep=" ")
          ageDays <- ageDays - remDays
          remMonths <- floor((ageDays %% 365.25) / 30.4)
          baseAge <- paste(paste(remMonths, "months and",sep=" "),baseAge,sep=" ")
          ageDays <- ageDays - (remMonths*30.4)
          remYears <- floor(ageDays / 365.25)
          baseAge <- paste(paste(remYears, "years and",sep=" "),baseAge,sep=" ")
          finalAge <- paste("You are now",baseAge, sep=" ")
          if (ageDays<0){return(paste(x1,"Cannot calculate age for future dates.",sep="\n"))}
          return(finalAge)
        }
        else if (i==2){
          x <- as.numeric(paste0(format(input$birthdate,"%m"),format(input$birthdate,"%d")))
          hor <- function(x){if (x>=320 && x<420) return('Aries') 
                            else if (x>=420 && x<521) return('Taurus')
                            else if (x>=521 && x<621) return('Gemini')
                            else if (x>=621 && x<723) return('Cancer')
                            else if (x>=723 && x<823) return('Leo')
                            else if (x>=823 && x<923) return('Virgo')
                            else if (x>=923 && x<1023) return('Libra')
                            else if (x>=1023 && x<1122) return('Scorpio')
                            else if (x>=1122 && x<1222) return('Sagittarius')
                            else if (x>=1222 || x<120) return('Capricorn')
                            else if (x>=120 && x<218) return('Aquarius')
                            else if (x>=218 && x<320) return('Pisces')
          }
          finalMsg <- paste("Your zodiac sign is ",hor(x),sep="")
          return(finalMsg)
        }
        else if (i==3){
          x <- weekdays(as.Date(input$birthdate,format="%d.%m.%Y"))
          finalMsg <- paste("Your birth was on a ", x,sep="")
          return(finalMsg)
        }
      }
    }
)