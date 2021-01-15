output "service_plan" {
  description = "Service plan output attributes."
  value = {
    id                        = azurerm_app_service_plan.plan.id
    maximum_number_of_workers = azurerm_app_service_plan.plan.maximum_number_of_workers
  }
}

output "function_app" {
  description = "Function app output attributes."
  value = {
    id       = azurerm_function_app.app.id
    identity = azurerm_function_app.app.identity
  }
}

output "storage_account" {
  description = "Storage account output attributes."
  value = {
    id = azurerm_storage_account.sa.id
  }
}

