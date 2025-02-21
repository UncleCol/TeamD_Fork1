terraform {
  required_version = ">= 1.9.6"
  backend "azurerm" {
    resource_group_name  = "teamd-sa-rg"
    storage_account_name = "teamdsa"
    container_name       = "teamdstoragecont"
    key                  = "acr-terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      # version = ">= 4.18.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}