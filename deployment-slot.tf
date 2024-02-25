resource "azurerm_windows_web_app_slot" "prod" {
  name           = "prod"
  app_service_id = azurerm_linux_web_app.my-web-app.id

  site_config {
    application_stack {
      docker_image_name     = "aravinddhamo/flask_app:${var.image_tag}"
      docker_registry_url   = "https://index.docker.io"
      #docker_image_name    = "${data.azurerm_container_registry.my-container-registry.login_server}/my-container-name"
    }
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