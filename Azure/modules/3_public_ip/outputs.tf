output "output_public_ip_name" {
  value       = azurerm_public_ip.this.name
  description = ""
}

output "output_public_ip_id" {
  value       = azurerm_public_ip.this.id
  description = ""
}

output "output_ip_address" {
  value       = azurerm_public_ip.this.ip_address
  description = ""
}
