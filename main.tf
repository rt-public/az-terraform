resource "azurerm_resource_group" "rt_tf_rg" {
  name = "rt-tf-dev-rg"
  location = "Central India"
  tags = {
    environment = "Development"
  }
}

resource "random_string" "resource_code" {
  length = 5
  special = false
  upper = false
}

resource "azurerm_resource_group" "rt-tfstate" {
  location = "Central India"
  name = "rt-tfstate"
  tags = {
    message = "do-not-delete"
    environment = "shared"
  }
}

resource "azurerm_storage_account" "rt-tfstate" {
   name = "rttfstatestorage${random_string.resource_code.result}"
   resource_group_name = azurerm_resource_group.rt-tfstate.name
   location = azurerm_resource_group.rt-tfstate.location
   account_tier = "Standard"
   access_tier = "Hot"
   account_replication_type = "LRS"
   allow_nested_items_to_be_public = false
}

resource "azurerm_storage_container" "rt-tfstate" {
  name = "rttfstate"
  storage_account_name = azurerm_storage_account.rt-tfstate.name
  container_access_type = "private"
}