resource "azurerm_mssql_server" "sql" {

  for_each = var.databases

  name                = each.value.server_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  version = "12.0"

  administrator_login    = var.db_username
  administrator_login_password = var.db_password

  minimum_tls_version = "1.2"
}


resource "azurerm_mssql_database" "db" {

  for_each = var.databases

  name      = each.value.database_name
  server_id = azurerm_mssql_server.sql[each.key].id

  sku_name = each.value.sku_name
}