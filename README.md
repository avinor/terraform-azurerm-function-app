# Terraform Azurerm Function App

Terraform module to create function app

## Usage

TODO:
Example showing deployment of a Azure Function app.

```terraform
module "app" {
  source = "github.com/avinor/terraform-azurerm-function-app"

  name                = "myapp"
  resource_group_name = "myapp-rg"
  location            = "westeurope"

}
```
