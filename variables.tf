variable "appId" {
  type        = string
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "appPassword" {
  type        = string
  description = "Azure Kubernetes Service Cluster password"
}

variable "resource_group_location" {
  type        = string
  default     = "East Us"
  description = "Main Resource Group location"
}

variable "resource_group_environment" {
  type        = string
  default     = "Demo"
  description = "Main Resource Group tag parameter"
}

variable "default_node_pool_params" {
  default = {
    aks_node_pool_name       = "default"
    aks_node_count           = 1
    aks_node_vm_size         = "Standard_D2as_v4"
    aks_node_os_disk_size_gb = 30
  }
  type = object(
    {
      aks_node_pool_name       = string
      aks_node_count           = number
      aks_node_vm_size         = string
      aks_node_os_disk_size_gb = number
    }
  )
}

variable "aks_role_based_access_control" {
  default = true
  type    = bool
}

variable "aks_environment" {
  default = "Demo"
  type    = string
}