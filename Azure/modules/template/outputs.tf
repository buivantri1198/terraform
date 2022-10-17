output "virtual_network_name" {
  value       = azurerm_virtual_network.this.name
  description = "The name of the virtual network."
}

output "virtual_network_id" {
  value       = azurerm_virtual_network.this.id
  description = "The virtual NetworkConfiguration ID."
}