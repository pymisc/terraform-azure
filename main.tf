terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "azurerm" {
  features {}

  resource_provider_registrations = "none"

}

resource "azurerm_resource_group" "aks_learning" {
  name     = "rg-aks-learning"
  location = "West US 2"
}