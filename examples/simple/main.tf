module "func" {

  source = "../../"

  name                = "simple"
  resource_group_name = "simple-rg"
  location            = "westeurope"

  storage_account = {
    tier             = "Standard"
    replication_type = "LRS"
  }

  service_plan = {
    kind     = "linux"
    reserved = true
    sku = {
      tier = "Standard"
      size = "S1"
    }
  }

  function_app = {
    os_type = "linux"
  }

  tags = {
    tag1 = "value1"
  }

}