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

resource "azurerm_kubernetes_cluster" "aks_learning" {
  name                = "aks-learning"
  location            = azurerm_resource_group.aks_learning.location
  resource_group_name = azurerm_resource_group.aks_learning.name
  dns_prefix          = "aks-learning"

  sku_tier = "Free"

  default_node_pool {
    name       = "system"
    node_count = 1
    vm_size    = "Standard_D4s_v6"
  }

  identity {
    type = "SystemAssigned"
  }
}
