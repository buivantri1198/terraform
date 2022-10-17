variable "mysql_server_name" {
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

variable "administrator_login" {
  default     = ""
  description = ""
}

variable "administrator_login_password" {
  default     = ""
  description = ""
}

variable "sku_name" {
  default     = ""
  description = ""
}

variable "storage_mb" {
  default     = ""
  description = ""
}

variable "version" {
  default     = ""
  description = ""
}

variable "auto_grow_enabled" {
  default     = ""
  description = ""
}

variable "backup_retention_days" {
  default     = ""
  description = ""
}

variable "geo_redundant_backup_enabled" {
  default     = ""
  description = ""
}

variable "infrastructure_encryption_enabled" {
  default     = ""
  description = ""
}

variable "public_network_access_enabled" {
  default     = ""
  description = ""
}

variable "ssl_enforcement_enabled" {
  default     = ""
  description = ""
}

variable "ssl_minimal_tls_version_enforced" {
  default     = ""
  description = ""
}

