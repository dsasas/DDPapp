
# This is the server logic for a Shiny web application.


shinyServer(function(input, output, session) {
  # Return the requested dataset

  output$distPlot <- renderPlot({
    library(ggplot2)
    temp =  subset(morticd10, Country == input$country  & Cause == input$cause)

    qplot(Year, Deaths, data = temp, color=Country, geom = "line", 
    main = paste0("Cause of Deaths: ", temp$Cause[1])[1])
  })

  datos=reactive({
    temp =  subset(morticd10, Country == input$country  & Cause == input$cause)
    temp1 = arrange(temp,Country, Year)
    select(temp1, Cause, Country, Year, Deaths)
})
  output$view <- renderTable({
    datos()
})
  output$distBoxplot <- renderPlot({
  library(ggplot2)
  temp2 =  subset(morticd10, Country == input$country  & Cause == input$cause)
  
  ggplot(temp2, aes(x = Country, y = Deaths)) + geom_boxplot()
})


})
