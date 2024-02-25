resource "azurerm_service_plan" "web_app_service" {
  name                = "appservice86397"
  resource_group_name = azurerm_resource_group.webapp_rg.name
  location            = azurerm_resource_group.webapp_rg.location
  os_type             = "Linux"
  sku_name            = "P0v3"  
}


resource "azurerm_linux_web_app" "my-web-app" {
  name                = "webapp98344943721"
  resource_group_name = azurerm_resource_group.webapp_rg.name
  location            = azurerm_resource_group.webapp_rg.location
  service_plan_id     = azurerm_service_plan.web_app_service.id

  site_config {
    container_registry_use_managed_identity = true
    application_stack {
      #docker_image_name     = "aravinddhamo/flask_app:${var.image_tag}"
      docker_registry_url   = "https://acrtest24.azurecr.io"
      docker_image_name    = "flask_app:${var.image_tag}"
    }
}
  identity {
       type = "SystemAssigned"

  }
#Passing the env variable here
  app_settings = {
    WEBSITES_PORT = "5000"
    ENV = "prod"
    #DOCKER_REGISTRY_SERVER_URL      = data.azurerm_container_registry.my-container-registry.login_server
    #DOCKER_REGISTRY_SERVER_USERNAME = data.azurerm_container_registry.my-container-registry.admin_username
    #DOCKER_REGISTRY_SERVER_PASSWORD = data.azurerm_container_registry.my-container-registry.admin_password
  }
}