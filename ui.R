
if (!require(ggplot2)){ 
        install.packages('ggplot2') 
}
if (!require(e1071)){ 
        install.packages('e1071', dependencies=TRUE)
}
if (!require(magrittr)){ 
        install.packages('magrittr') 
}
if (!require(dplyr)){ 
        install.packages('dplyr') 
}

if (!require(RGtk2)){ 
        install.packages('RGtk2') 
}

if (!require(rattle)){ 
        install.packages('rattle') 
}

if (!require(rpart.plot)){ 
        install.packages('rpart.plot') 
}

if (!require(rpart)){ 
        install.packages('rpart') 
}

if (!require(party)){ 
        install.packages('party') 
}

if (!require(partykit)){ 
        install.packages('partykit') 
}

if (!require(ROSE)){ 
        install.packages('ROSE') 
}

if (!require(ROCR)){ 
        install.packages('ROCR') 
}

if (!require(caret)){ 
        install.packages('caret') 
}

if (!require(xgboost)){ 
        install.packages('xgboost') 
}

if (!require(nnet)){ 
        install.packages('nnet') 
}

if (!require(ineq)){ 
        install.packages('ineq') 
}

if (!require(neuralnet)){ 
        install.packages('neuralnet') 
}

if (!require(Rtsne)){ 
        install.packages('Rtsne') 
}

if (!require(rCharts)){ 
        install.packages('rCharts') 
}

if (!require(rsconnect)){ 
        install.packages('rsconnect') 
}

if (!require(shiny)){ 
        install.packages('shiny') 
}

if (!require(shinydashboard)){ 
        install.packages('shinydashboard') 
}


library(magrittr)
library(dplyr)

library(gridExtra)
library(ggplot2)

library(RGtk2)
library(rattle)
library(rpart.plot)
library(rpart)
library(e1071)
library(party)
library(partykit)
library(ROSE)

library(ROCR)

library(caret)
library(xgboost)
library(nnet)
library(ineq)
library(neuralnet)
library(Rtsne)
library(rCharts)
library(rsconnect)
library(shinydashboard)

shinyUI(dashboardPage( skin = "yellow",
     dashboardHeader(title = "Dobutamine Stress Echocardiogram", titleWidth = 350)
     ,
     dashboardSidebar(
          h5("For more information about Dobutamine, click below"), 
          menuItem("Dobutamine: wikipedia", href = "https://en.wikipedia.org/wiki/Dobutamine"),
          h5("For more information about Dobutamine Stress Echocardiogram, click below"),
          menuItem("Dobutamine Stress Echocardiogram", href = "http://www.hopkinsmedicine.org/healthlibrary/test_procedures/cardiovascular/dobutamine_stress_echocardiogram_92,P07968/"),
          h5("To see how the test is administered, click below"), 
          menuItem("Dobutamine: Youtube", href = "https://www.youtube.com/watch?v=y37K05RdTog"),
          h5("For my LinkedIn profile, click below"), 
          menuItem("Linkedin Profile", href = "https://www.linkedin.com/in/samuel-golomeke-67847822")
     ),

     dashboardBody(
         tabsetPanel(
              tabPanel("About dobutamine stress echocardiogram",
                      fluidRow(
                            box(title = "What is echocardiogram? What is dobutamine stress echocardiogram?", status = "primary", solidHeader = TRUE, htmlOutput("echocardiogram"), height=250, width=12),
                            box(title = "Dobutamine is used for:", status = "primary", solidHeader = TRUE, htmlOutput("uses"), height=120, width=12),
                            box(title = "Do NOT use dobutamine if:", status = "primary", solidHeader = TRUE, htmlOutput("notuse"), height=140, width=12),
                            box(title = "Before using dobutamine:", status = "primary", solidHeader = TRUE, htmlOutput("beforeuse"), height=280, width=12),
                            box(title = "How to use dobutamine:", status = "primary", solidHeader = TRUE, htmlOutput("howtouse"), height=210, width=12),
                            box(title = "Important safety information:", status = "primary", solidHeader = TRUE, htmlOutput("safety"), height=250, width=12),
                            box(title = "Possible side effects of dobutamine:", status = "primary", solidHeader = TRUE, htmlOutput("sideeffect"), height=350, width=12)
                            )
             ),
             tabPanel("Best Algorithm",
                      fluidRow(
                          box(status = "primary", showOutput("newMI_chart","highcharts"), height=480, width=12),
                          box(status = "primary", showOutput("newPTCA_chart","highcharts"), height=480, width=12),
                          box(status = "primary", showOutput("newCABG_chart","highcharts"), height=480, width=12),
                          box(status = "primary", showOutput("death_chart","highcharts"), height=480, width=12)
                      )
             ),
             tabPanel("tsne",
                      fluidRow(
                          box(title = "t-Distributed Stochastic Neighbor Embedding for newMI", status = "primary", solidHeader = TRUE, plotOutput("plotnewMI"), height=480, width=12),
                          box(title = "t-Distributed Stochastic Neighbor Embedding for newPTCA", status = "primary", solidHeader = TRUE, plotOutput("plotnewPTCA"), height=480, width=12),
                          box(title = "t-Distributed Stochastic Neighbor Embedding for newCABG", status = "primary", solidHeader = TRUE, plotOutput("plotnewCABG"), height=480, width=12),
                          box(title = "t-Distributed Stochastic Neighbor Embedding for death", status = "primary", solidHeader = TRUE, plotOutput("plotdeath"), height=480, width=12)
                      )
             ),
             tabPanel("tree Classification",
                      fluidRow(
                          box(title = "Tree Classification for newMI", status = "primary", solidHeader = TRUE, plotOutput("plottree_newMI"), height=480, width=12),
                          box(title = "Tree Classification for newPTCA", status = "primary", solidHeader = TRUE, plotOutput("plottree_newPTCA"), height=480, width=12),
                          box(title = "Tree Classification for newCABG", status = "primary", solidHeader = TRUE, plotOutput("plottree_newCABG"), height=480, width=12),
                          box(title = "Tree Classification for death", status = "primary", solidHeader = TRUE, plotOutput("plottree_death"), height=480, width=12)
                      )
             ),		
             tabPanel("AUC for newMI",
                      fluidRow(
                          box(title = "Area Under Curve Using Classification Tree", status = "primary", solidHeader = TRUE, plotOutput("plottreeauc_newMI"), height=480, width=12),
                          box(title = "Area Under Curve Using Support Vector Machine", status = "primary", solidHeader = TRUE, plotOutput("plotsvmauc_newMI"), height=480, width=12),
                          box(title = "Area Under Curve Using Single Hidden Layer Neural Network", status = "primary", solidHeader = TRUE, plotOutput("plotnnet_singHidauc_newMI"), height=480, width=12),
                          box(title = "Area Under Curve Using multinomial Log Linear neural network", status = "primary", solidHeader = TRUE, plotOutput("plotnnet_mulLogLinauc_newMI"), height=480, width=12),
                          box(title = "Area Under Curve Using Back Propagation Neural Network", status = "primary", solidHeader = TRUE, plotOutput("plotnnet_bpaauc_newMI"), height=480, width=12),
                          box(title = "Area Under Curve Using Extreme Gradient Boost", status = "primary", solidHeader = TRUE, plotOutput("plotxgbauc_newMI"), height=480, width=12),
                          box(title = "Area Under Curve Using Naive Bayes", status = "primary", solidHeader = TRUE, plotOutput("plotnaivebayesauc_newMI"), height=480, width=12)
                      )
             ),		
             tabPanel("AUC for newPTCA",
                      fluidRow(
                          box(title = "Area Under Curve Using Classification Tree", status = "primary", solidHeader = TRUE, plotOutput("plottreeauc_newPTCA"), height=480, width=12),
                          box(title = "Area Under Curve Using Support Vector Machine", status = "primary", solidHeader = TRUE, plotOutput("plotsvmauc_newPTCA"), height=480, width=12),
                          box(title = "Area Under Curve Using Single Hidden Layer Neural Network", status = "primary", solidHeader = TRUE, plotOutput("plotnnet_singHidauc_newPTCA"), height=480, width=12),
                          box(title = "Area Under Curve Using multinomial Log Linear neural network", status = "primary", solidHeader = TRUE, plotOutput("plotnnet_mulLogLinauc_newPTCA"), height=480, width=12),
                          box(title = "Area Under Curve Using Back Propagation Neural Network", status = "primary", solidHeader = TRUE, plotOutput("plotnnet_bpaauc_newPTCA"), height=480, width=12),
                          box(title = "Area Under Curve Using Extreme Gradient Boost", status = "primary", solidHeader = TRUE, plotOutput("plotxgbauc_newPTCA"), height=480, width=12),
                          box(title = "Area Under Curve Using Naive Bayes", status = "primary", solidHeader = TRUE, plotOutput("plotnaivebayesauc_newPTCA"), height=480, width=12)
                      )
             ),
             tabPanel("AUC for newCABG",
                      fluidRow(
                          box(title = "Area Under Curve Using Classification Tree", status = "primary", solidHeader = TRUE, plotOutput("plottreeauc_newCABG"), height=480, width=12),
                          box(title = "Area Under Curve Using Support Vector Machine", status = "primary", solidHeader = TRUE, plotOutput("plotsvmauc_newCABG"), height=480, width=12),
                          box(title = "Area Under Curve Using Single Hidden Layer Neural Network", status = "primary", solidHeader = TRUE, plotOutput("plotnnet_singHidauc_newCABG"), height=480, width=12),
                          box(title = "Area Under Curve Using multinomial Log Linear neural network", status = "primary", solidHeader = TRUE, plotOutput("plotnnet_mulLogLinauc_newCABG"), height=480, width=12),
                          box(title = "Area Under Curve Using Back Propagation Neural Network", status = "primary", solidHeader = TRUE, plotOutput("plotnnet_bpaauc_newCABG"), height=480, width=12),
                          box(title = "Area Under Curve Using Extreme Gradient Boost", status = "primary", solidHeader = TRUE, plotOutput("plotxgbauc_newCABG"), height=480, width=12),
                          box(title = "Area Under Curve Using Naive Bayes", status = "primary", solidHeader = TRUE, plotOutput("plotnaivebayesauc_newCABG"), height=480, width=12)
                      )
             ),
             tabPanel("AUC for death",
                      fluidRow(
                          box(title = "Area Under Curve Using Classification Tree", status = "primary", solidHeader = TRUE, plotOutput("plottreeauc_death"), height=480, width=12),
                          box(title = "Area Under Curve Using Support Vector Machine", status = "primary", solidHeader = TRUE, plotOutput("plotsvmauc_death"), height=480, width=12),
                          box(title = "Area Under Curve Using Single Hidden Layer Neural Network", status = "primary", solidHeader = TRUE, plotOutput("plotnnet_singHidauc_death"), height=480, width=12),
                          box(title = "Area Under Curve Using multinomial Log Linear neural network", status = "primary", solidHeader = TRUE, plotOutput("plotnnet_mulLogLinauc_death"), height=480, width=12),
                          box(title = "Area Under Curve Using Back Propagation Neural Network", status = "primary", solidHeader = TRUE, plotOutput("plotnnet_bpaauc_death"), height=480, width=12),
                          box(title = "Area Under Curve Using Extreme Gradient Boost", status = "primary", solidHeader = TRUE, plotOutput("plotxgbauc_death"), height=480, width=12),
                          box(title = "Area Under Curve Using Naive Bayes", status = "primary", solidHeader = TRUE, plotOutput("plotnaivebayesauc_death"), height=480, width=12)
                    )
                )
            )  						
         )
    )
)
 