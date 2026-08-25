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


variable "subnet_ids" {

  type = map(string)
}


variable "public_ip_ids" {

  type = map(string)
}


variable "nsg_ids" {

  type = map(string)
}