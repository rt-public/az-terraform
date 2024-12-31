terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "rt-tfstate"
    storage_account_name  = "rttfstatestoragesuc7q"
    container_name        = "rttfstate"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b10f47ae-997f-4975-b94e-5088411bb460"
}