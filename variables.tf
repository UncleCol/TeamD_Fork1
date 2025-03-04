variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  default     = "168b5162-e625-42f1-994a-dfcfff0433bb"
}

variable "name" {
  type        = string
  default     = "teamD"
  description = "Name for resources"
}

variable "location" {
  type        = string
  description = "Azure Location of resources"
}

variable "environment" {
  type        = string
  description = "Environment of resources"
}

variable "tags" {
  type = map(string)
}

variable "network_address_space" {
  type        = string
  description = "Azure VNET Address Space"
}

variable "private1_subnet_address_prefix" {
  type        = string
  description = "Azure Private1 Subnet Address Space"
}

variable "private2_subnet_address_prefix" {
  type        = string
  description = "Azure Private2 Subnet Address Space"
}

variable "public_subnet_address_prefix" {
  type        = string
  description = "Azure Public Subnet Address Space"  
}

variable "ag_subnet_address_prefix" {
  type        = string
  description = "Azure AG Subnet Address Space"  
}

variable "admin_username" {
  type        = string
  description = "Admin Username for VMs"
}

variable "admin_password" {
  type        = string
  description = "Admin Password for VMs"
}

variable "vm_size" {
  type        = string
  description = "Size of VMs"
  default     = "Standard_B1s"
}

variable "sql_admin_username" {
  description = "The administrator username for the SQL server."
  type        = string
}

variable "sql_admin_password" {
  description = "The administrator password for the SQL server."
  type        = string
  sensitive   = true
}

variable "availability_zones" {
  description = "List of availability zones to deploy the SQL databases."
  type        = list(string)
  default     = ["2"] #TODO - Use 2 for second machine
}