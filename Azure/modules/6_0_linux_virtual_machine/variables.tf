variable "linux_virtual_machine_name" {
  default     = ""
  description = ""
}

variable "location" {
  default     = ""
  description = "(Required) The location/region where the virtual network is created."
}

variable "resource_group_name" {
  default     = ""
  description = "(Required) The name of the resource group in which to create the virtual network."
}

variable "size" {
  default     = ""
  description = ""
}

variable "admin_username" {
  default     = ""
  description = ""
}

variable "admin_password" {
  default     = ""
  description = ""
}

variable "disable_password_authentication" {
  default     = ""
  description = ""
}

variable "network_interface_ids" {
  type        = list(string)
  description = ""
}

variable "os_disk_name" {
  default     = ""
  description = ""
}


variable "caching" {
  default     = ""
  description = ""
}

variable "storage_account_type" {
  default     = ""
  description = ""
}

variable "publisher" {
  default     = ""
  description = ""
}

variable "offer" {
  default     = ""
  description = ""
}

variable "sku" {
  default     = ""
  description = ""
}

variable "source_image_reference_version" {
  default     = ""
  description = ""
}