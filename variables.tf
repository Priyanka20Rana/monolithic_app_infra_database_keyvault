variable "resource_groups" {

  type = map(object({

    name     = string
    location = string

  }))
}


variable "virtual_networks" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)

  }))
}


variable "subnets" {

  type = map(object({

    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)

  }))
}


variable "nsgs" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string

  }))
}


variable "public_ips" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string

  }))
}


variable "nics" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string

    subnet_key    = string
    public_ip_key = string
    nsg_key       = string

  }))
}


variable "vms" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string
    size                = string
    nic_key             = string

  }))
}


variable "databases" {

  type = map(object({

    server_name         = string
    database_name       = string
    resource_group_name = string
    location            = string
    sku_name            = string

  }))
}


variable "key_vault_name" {
  type = string
}


variable "key_vault_resource_group_name" {
  type = string
}


variable "location" {
  type = string
}


variable "vm_username" {

  type      = string
  sensitive = true
}


variable "vm_password" {

  type      = string
  sensitive = true
}


variable "db_username" {

  type      = string
  sensitive = true
}


variable "db_password" {

  type      = string
  sensitive = true
}