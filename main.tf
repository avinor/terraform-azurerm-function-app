terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 2.42.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 2.2"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
}

resource "random_string" "unique" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_storage_account" "sa" {
  name                = format("%s%ssa", lower(replace(var.name, "/[[:^alnum:]]/", "")), random_string.unique.result)
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  account_replication_type  = var.storage_account.replication_type
  account_tier              = var.storage_account.tier
  enable_https_traffic_only = true

  tags = var.tags
}

resource "azurerm_app_service_plan" "plan" {
  name                = "${var.name}-plan"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  sku {
    size = var.service_plan.sku.size
    tier = var.service_plan.sku.tier
  }

  tags = var.tags
}

resource "azurerm_function_app" "app" {
  name                = "${var.name}-func"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  app_service_plan_id        = azurerm_app_service_plan.plan.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  os_type                    = var.function_app.os_type

  tags = var.tags
}

