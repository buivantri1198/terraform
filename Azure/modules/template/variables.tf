variable "virtual_network_name" {
  default     = ""
  description = "(Required) The name of the virtual network."
}

variable "location" {
  default     = ""
  description = "(Required) The location/region where the virtual network is created."
}

variable "resource_group_name" {
  default     = ""
  description = "(Required) The name of the resource group in which to create the virtual network."
}

variable "address_space" {
  default     = ""
  description = ""
}

variable "dns_servers" {
  default     = ""
  description = ""
}

variable "tags_virtual_network" {
  default     = ""
  description = ""
}