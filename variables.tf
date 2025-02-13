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

variable "private4_subnet_address_prefix" {
  type        = string
  description = "Azure Private4 Subnet Address Space"
  
}

variable "private5_subnet_address_prefix" {
  type        = string
  description = "Azure Private5 Subnet Address Space"
  
}
variable "private6_subnet_address_prefix" {
  type        = string
  description = "Azure Private6 Subnet Address Space"
  
  
}