#edge://flags/#edge-automatic-https    to stop directing from http to https in edge browser

#This will create binding in the app service.
#The ip address and the TXT record will be available in the portal and needs to be added to the Domain registarar manually
resource "azurerm_app_service_custom_hostname_binding" "hostname-binding" {
  hostname            = "fladockkube.xyz"
  app_service_name    = azurerm_linux_web_app.my-web-app.name
  resource_group_name = azurerm_resource_group.webapp_rg.name
  #ssl_state           = "IpBasedEnabled"  #this is to use ssl certificate
}

##https://stackoverflow.com/questions/71695811/terraform-bind-ssl-certificate-to-azure-webapp
#refer this link for ssl certificate attachment in the hosted domain

