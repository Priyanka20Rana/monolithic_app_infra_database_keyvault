data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {

  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  purge_protection_enabled = false

  soft_delete_retention_days = 7

  rbac_authorization_enabled = false

  access_policy {

    tenant_id = data.azurerm_client_config.current.tenant_id

    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Purge"
    ]
  }
}


resource "azurerm_key_vault_secret" "vm_username" {

  name         = "vm-username"
  value        = var.vm_username
  key_vault_id = azurerm_key_vault.kv.id
}


resource "azurerm_key_vault_secret" "vm_password" {

  name         = "vm-password"
  value        = var.vm_password
  key_vault_id = azurerm_key_vault.kv.id
}


resource "azurerm_key_vault_secret" "db_username" {

  name         = "db-admin-username"
  value        = var.db_username
  key_vault_id = azurerm_key_vault.kv.id
}


resource "azurerm_key_vault_secret" "db_password" {

  name         = "db-admin-password"
  value        = var.db_password
  key_vault_id = azurerm_key_vault.kv.id
}