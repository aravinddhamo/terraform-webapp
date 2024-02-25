output "webapp_hostname" {
  value = azurerm_linux_web_app.my-web-app.default_hostname
}

output "webapp_domain_id" {
  value = nonsensitive(azurerm_linux_web_app.my-web-app.custom_domain_verification_id)
}

output "webapp_domain_virtual_ip" {
  value = azurerm_app_service_custom_hostname_binding.hostname-binding.virtual_ip
}