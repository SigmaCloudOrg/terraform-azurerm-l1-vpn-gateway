output "id" {
   value       = azurerm_vpn_gateway.generic.id
   description = "The ID of the VPN Gateway."
}

output "bgp_settings" {
   value       = azurerm_vpn_gateway.generic.bgp_settings
   description = "A bgp_settings block as defined below."
}