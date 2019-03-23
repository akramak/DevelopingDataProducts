#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(pwr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  titlePanel("Sample Size Calculator"),
  sidebarLayout(
    sidebarPanel(
      
      selectInput(inputId="confidence", "Confidence Level:", c(".99", ".95", ".90", ".85"), selected = ".99", multiple = FALSE),
      selectInput(inputId="p", "Power Level:", c(".90",".85",".80"), selected = ".80", multiple = FALSE),
      br(),
      br(),
      radioButtons(inputId="type", "One or Two sided test:", c("two.sided", "greater", "less"), selected = "two.sided"),
      br(),
      numericInput(inputId="prop1", "Proportion 1", value=.00, min=0, max = 1, step=0.05),
      numericInput(inputId="prop2", "Proportion 2", value=.00, min=0, max = 1, step=0.05),
      br(),
      actionButton("button", "Calculate")
    ),
    mainPanel(
      tags$h2("Instructions and Example:"),
      tags$h4("This application calculates Sample Size for a two-sample proportion test. 
              Two proportion tests help determine whether two population proportions have a significant difference. 
              For example, whether the proportion of men, who get into car accidents, is different from the proportion of women, who get into car accidents.
              It uses the null hypothesis that the difference between two population proportions equals some hypothesized value (Ho: p1 - p2 = Po), and tests it against an alternative hypothesis, which can be either greater than, less than, or two-tailed.
              "),
      tags$h4("EXAMPLE:"),
      tags$h4("We want to randomly sample male and female college students and ask them if they consume wine at least once a month. Our null hypothesis(Ho) is no difference in the proportion that reply 'Yes'. Our alternative hypothesis(Ha) is that there is a difference. This is a two-sided alternative test; 
              one gender has a higher proportion but we do not know which. We would like to detect a difference as small as 5%. 
              How many students do we need to sample in each gender group, if we want 80% power and a confidence level of 95%?"),
      tags$h4("Note:Significance Level = 1 - Confidence Level"),       
         tags$h4("      If we think one group proportion is 55% and the other 50%:"),
      tags$h4("pwr.2p.test(h = ES.h(p1 = 0.55, p2 = 0.50), sig.level = 0.05, power = .80)"),
      tags$h4( " h = 0.1001674"),
      tags$h4( " n = 1564.529"),
      tags$h4( " sig.level = 0.05"),
      tags$h4( " power = 0.8"),
      tags$h4( "alternative = two.sided"),
      tags$h4( "Notice the sample size is per group. We need to sample 1,565 males and 1,565 females to detect the 5% difference with 80% power."),
      br(),
      tags$h2("Required Sample size:"),
      verbatimTextOutput("sampize",placeholder = TRUE),
      br(),
      tags$h4("Signifcance Level = "),
      textOutput("sig")
    )
  ))
)