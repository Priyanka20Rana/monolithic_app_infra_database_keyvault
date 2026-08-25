variable "databases" {

  type = map(object({

    server_name        = string
    database_name      = string
    resource_group_name = string
    location            = string
    sku_name            = string

  }))
}


variable "db_username" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}