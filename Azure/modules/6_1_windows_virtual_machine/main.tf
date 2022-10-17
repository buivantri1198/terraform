resource "azurerm_windows_virtual_machine" "this" {
  name                = var.windows_virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = var.network_interface_ids

  os_disk {
    name = var.os_disk_name
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.source_image_reference_version
  }
}