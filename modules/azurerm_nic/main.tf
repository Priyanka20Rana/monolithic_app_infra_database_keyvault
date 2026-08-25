resource "azurerm_network_interface" "nic" {

  for_each = var.nics

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {

    name                          = "internal"
    subnet_id                     = var.subnet_ids[each.value.subnet_key]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_ids[each.value.public_ip_key]
  }
}


resource "azurerm_network_interface_security_group_association" "nsg_assoc" {

  for_each = var.nics

  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = var.nsg_ids[each.value.nsg_key]
}