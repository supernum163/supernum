library(shiny)
library(shinydashboard)


ui <- dashboardPage(
  dashboardHeader(title = "Dynamic sidebar"),
  dashboardSidebar(
    actionButton("userModify", '注册&该密'),
    actionButton("userAuth", '登陆'),
    uiOutput("userManage"),
    sidebarMenuOutput("menu")
  ),
  dashboardBody(
    fluidPage(
      verbatimTextOutput("test")
    )
  )
)

server <- function(input, output, session) {
  
  # 返回用户登陆UI
  observeEvent(input$userAuth, {
    output$userManage <- renderUI({
      tagList(
        verbatimTextOutput("v1", placeholder = T),
        textInput("t1", label = NULL),
        passwordInput("p1", label = NULL),
        actionButton("a1", '登陆')
      )
    })
  })
  
  # 登陆成功，返回用户头像
  output$userManage <- renderUI({
    sidebarUserPanel(name = "网路杨",
                     # subtitle = actionLink("offline", "点此下线", icon("circle", class = "text-success")),
                     subtitle = a(href = "#", icon("circle", class = "text-success"), "Online"),
                     image = "user02.jpeg"
    )
  })
  
  # 返回可用报表列表
  output$menu <- renderMenu({
    sidebarMenu(id = "tabName",
      menuItem(text = "可用报表", tabName = "可用报表", icon = icon("table")),
      menuItem(text ="menu0",
               menuSubItem(text ="menu01", tabName = "menu2"),
               menuSubItem(text ="menu02", tabName = "menu3")
      )
    )
  })

  output$test <- renderText(input$tabName)
  
}

shinyApp(ui, server)