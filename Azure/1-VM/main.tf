data "azurerm_resource_group" "example" {
  name = "RG_Terraform_20221017"
}

################

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}