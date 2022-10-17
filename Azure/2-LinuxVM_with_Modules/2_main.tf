
data "azurerm_resource_group" "this" {
  name = "RG_Terraform_20221017"
}

###########################################
/* Network */

module "virtual_network" {
  source = "../modules/1_virtual_network"

  virtual_network_name = "ethantf_vnet"
  location             = data.azurerm_resource_group.this.location
  resource_group_name  = data.azurerm_resource_group.this.name
  address_space        = ["10.0.0.0/16"]
  dns_servers          = ["8.8.8.8", "1.1.1.1"]
  tags_virtual_network = { environment = "Testlab" }
}

module "subnet" {
  source = "../modules/2_subnet"

  subnet_name          = "ethantf_subnet_01"
  resource_group_name  = data.azurerm_resource_group.this.name
  virtual_network_name = module.virtual_network.output_virtual_network_name
  address_prefixes     = ["10.0.1.0/24"]
}

module "public_ip" {
  source = "../modules/3_public_ip"

  public_ip_name      = "ethantf_public_ip_01"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  allocation_method   = "Static"
}

module "network_security_group" {
  source = "../modules/4_0_network_security_group"

  network_security_group_name = "ethantf_network_security_group_01"
  resource_group_name         = data.azurerm_resource_group.this.name
  location                    = data.azurerm_resource_group.this.location
  tags_network_security_group = { environment = "Testlab" }
}

# rule
module "network_security_rule" {
  source = "../modules/4_1_network_security_rule"

  network_security_rule_name  = "ethantfnsr01"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.this.name
  network_security_group_name = module.network_security_group.output_network_security_group_name
}

module "network_interface" {
  source = "../modules/5_0_network_interface"

  network_interface_name        = "ethantf_network_interface_01"
  resource_group_name           = data.azurerm_resource_group.this.name
  location                      = data.azurerm_resource_group.this.location
  ip_configuration_name         = "internal"
  subnet_id                     = module.subnet.output_subnet_id
  private_ip_address_allocation = "Dynamic"
  public_ip_address_id          = module.public_ip.output_public_ip_id
}

# nic vs nsg
module "nic_vs_nsg" {
  source = "../modules/5_1_network_interface_association"

  network_interface_id      = module.network_interface_lin.output_network_interface_id
  network_security_group_id = module.network_security_group.output_network_security_group_id
}


/* System */

# linux
module "network_interface_lin" {
  source = "../modules/5_0_network_interface"

  network_interface_name        = "ethantf_network_interface_02"
  resource_group_name           = data.azurerm_resource_group.this.name
  location                      = data.azurerm_resource_group.this.location
  ip_configuration_name         = "internal"
  subnet_id                     = module.subnet.output_subnet_id
  private_ip_address_allocation = "Dynamic"
}
module "linux_virtual_machine" {
  source = "../modules/6_0_linux_virtual_machine"

  linux_virtual_machine_name      = "ethantflinvm01"
  resource_group_name             = data.azurerm_resource_group.this.name
  location                        = data.azurerm_resource_group.this.location
  size                            = "Standard_B2s"
  admin_username                  = "adminuser"
  admin_password                  = "Public@2022"
  disable_password_authentication = false

  network_interface_ids = [module.network_interface_lin.output_network_interface_id]

  os_disk_name         = "ethanlinvm01osdisk01"
  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"

  publisher                      = "Canonical"
  offer                          = "UbuntuServer"
  sku                            = "18.04-LTS"
  source_image_reference_version = "latest"

}

# windows
module "nic_vs_nsg_win" {
  source = "../modules/5_1_network_interface_association"

  network_interface_id      = module.network_interface.output_network_interface_id
  network_security_group_id = module.network_security_group.output_network_security_group_id
}
module "windows_virtual_machine" {
  source = "../modules/6_1_windows_virtual_machine"

  windows_virtual_machine_name      = "ethantfwinvm01"
  resource_group_name             = data.azurerm_resource_group.this.name
  location                        = data.azurerm_resource_group.this.location
  size                            = "Standard_B2s"
  admin_username                  = "adminuser"
  admin_password                  = "Public@2022"

  network_interface_ids = [module.network_interface.output_network_interface_id]

  os_disk_name         = "ethanwinvm01osdisk01"
  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"

  publisher                      = "MicrosoftWindowsServer"
  offer                          = "WindowsServer"
  sku                            = "2016-Datacenter"
  source_image_reference_version = "latest"
}

/* PAAS */

###########################################
/* Add yourcode here. */

module "network_security_rule_01" {
  source = "../modules/4_1_network_security_rule"

  network_security_rule_name  = "ethantfnsr02_SSH"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.this.name
  network_security_group_name = module.network_security_group.output_network_security_group_name
}

module "network_security_rule_02" {
  source = "../modules/4_1_network_security_rule"

  network_security_rule_name  = "ethantfnsr02_RDP"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.this.name
  network_security_group_name = module.network_security_group.output_network_security_group_name
}