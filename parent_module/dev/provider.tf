terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.1"
    }
  }
  # backend "azurerm" {
  #   resource_group_name = "rg-dev"
  #   storage_account_name = "storageaccountdev123"
  #   container_name = "statefilecontainer"
  #   key = "devenvrsf.terraform.tfstate"
  # }
}
provider "azurerm" {
  features {}
}