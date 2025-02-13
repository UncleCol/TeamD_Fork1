variable "name" {
  type        = string
  default     = "teamD"
  description = "Name for resources"
}
 
variable "location" {
  type        = string
  default     = "westeurope"
  description = "Azure Location of resources"
}

variable "tags" {
  type = map(string)
}

variable "network_address_space" {
  type        = string
  description = "Azure VNET Address Space"
}

variable "public1_subnet_address_prefix" {
  type        = string
  description = "Azure Public1 Subnet Address Space"
}

variable "public2_subnet_address_prefix" {
  type        = string
  description = "Azure Public2 Subnet Address Space"  
}

variable "public3_subnet_address_prefix" {
  type        = string
  description = "Azure Public3 Subnet Address Space"  
}

variable "private1_subnet_address_prefix" {
  type        = string
  description = "Azure Private4 Subnet Address Space"  
}

variable "private2_subnet_address_prefix" {
  type        = string
  description = "Azure Private5 Subnet Address Space"  
}
variable "private3_subnet_address_prefix" {
  type        = string
  description = "Azure Private6 Subnet Address Space"
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