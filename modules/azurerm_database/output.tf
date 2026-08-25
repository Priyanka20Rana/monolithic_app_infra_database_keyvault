output "sql_server_ids" {

  value = {
    for k, v in azurerm_mssql_server.sql :
    k => v.id
  }
}


output "database_ids" {

  value = {
    for k, v in azurerm_mssql_database.db :
    k => v.id
  }
}