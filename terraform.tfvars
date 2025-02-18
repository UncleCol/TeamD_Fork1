# Vnets
network_address_space          = "192.168.0.0/16"

# Subnets
public_subnet_address_prefix  = "192.168.0.0/24"
private1_subnet_address_prefix = "192.168.1.0/24"
private2_subnet_address_prefix = "192.168.2.0/24"


# VMs
admin_username = "azureuser"
admin_password = "IrishLife1234!"
vm_size        = "Standard_B1s"
tags = {
  "DeployedBy"  = "Col+Brian"
  "Environment" = "production" # TODO Make this refernce dev.tfvars or prod.tfvars
  "Project"     = "forking-task"
}
