variable "vms" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string
    size                = string
    nic_key             = string

  }))
}


variable "nic_ids" {

  type = map(string)
}


variable "vm_username" {

  type      = string
  sensitive = true
}


variable "vm_password" {

  type      = string
  sensitive = true
}