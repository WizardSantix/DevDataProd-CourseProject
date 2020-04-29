## SARS-COV2-LATAM Instruction manual

## Access
To acces the app please click the following link: https://wizardsantix.shinyapps.io/SARS-COV2-LATAM/

The SARS-COV2 folder in this repository contains the code for the shiny app https://github.com/WizardSantix/DevDataProd-CourseProject/tree/master/SARS-COV2-LATAM

## Internal function
The app automatically gets a database for the COVID19 information from the COVID19 Data Hub (https://covid19datahub.io) using the package COVID19, then displays a graph of the number of cases for different selectable variables in time. And a graphic for the information on the current date.

## User functions

- The user can select a range of dates in the Date Range field, just select the start date and end date from the calendars shown when clicking on each field. **Selecting a start date higher than the end date will cause the system to display an error, please select a non-negative interval timeframe** 

- Click on the select boxes to choose which countries you want to display in the graph, this can help you compare between different countries.

- Select the variable that you want to analyze from the radio buttons (Confirmed Cases, Tested Cases, Death Cases, and Recovered Cases)

- Both of the plots can be zoomed in and they display the value for each point by mousing over them.

The graphs will show information according to the selected inputs.

![Image](/AppCOVID.PNG)

