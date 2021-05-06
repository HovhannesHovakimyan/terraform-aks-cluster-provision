resource "random_pet" "prefix" {}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = "${random_pet.prefix.id}-rg"
  location = var.resource_group_location

  tags = {
    environment = var.resource_group_environment
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${random_pet.prefix.id}-k8s"

  default_node_pool {
    name            = var.default_node_pool_params.aks_node_pool_name
    node_count      = var.default_node_pool_params.aks_node_count
    vm_size         = var.default_node_pool_params.aks_node_vm_size
    os_disk_size_gb = var.default_node_pool_params.aks_node_os_disk_size_gb
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.appPassword
  }

  role_based_access_control {
    enabled = var.aks_role_based_access_control
  }

  tags = {
    environment = var.aks_environment
  }
}