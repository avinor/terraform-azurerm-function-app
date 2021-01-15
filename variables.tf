variable "name" {
  description = "Name of the CosmosDB Account."
}

variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
}

variable "location" {
  description = "The Azure Region in which to create resource."
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}

variable "storage_account" {
  description = "Storage accounts"
  type = object({
    tier             = string
    replication_type = string
  })
  default = null
}

variable "service_plan" {
  description = "Service plan "
  type = object({
    kind     = string
    reserved = bool
    sku = object({
      tier = string
      size = string
    })
  })
  default = null
}

variable "function_app" {
  description = "Function app"
  type = object({
    os_type = string
  })
  default = null
}

variable "diagnostics" {
  description = "Diagnostic settings for those resources that support it. See README.md for details on configuration."
  type = object({
    destination   = string
    eventhub_name = string
    logs          = list(string)
    metrics       = list(string)
  })
  default = null
}
