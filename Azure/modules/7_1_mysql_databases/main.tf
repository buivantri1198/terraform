resource "azurerm_mysql_database" "this" {
  name                = var.mysql_database_name
  resource_group_name = var.resource_group_name
  server_name         = var.server_name
  charset             = var.charset
  collation           = var.collation
}