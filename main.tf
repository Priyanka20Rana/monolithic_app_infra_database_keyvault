module "resource_group" {

  source = "./modules/azurerm_resource_group"

  resource_groups = var.resource_groups
}


module "vnet" {

  source = "./modules/azurerm_vnet"

  virtual_networks = var.virtual_networks

  depends_on = [
    module.resource_group
  ]
}


module "subnet" {

  source = "./modules/azurerm_subnet"

  subnets = var.subnets

  depends_on = [
    module.vnet
  ]
}


module "nsg" {

  source = "./modules/azurerm_nsg"

  nsgs = var.nsgs

  depends_on = [
    module.resource_group
  ]
}


module "public_ip" {

  source = "./modules/azurerm_pip"

  public_ips = var.public_ips

  depends_on = [
    module.resource_group
  ]
}


module "keyvault" {

  source = "./modules/azurerm_keyvault"

  key_vault_name           = var.key_vault_name
  resource_group_name      = var.key_vault_resource_group_name
  location                 = var.location

  vm_username = var.vm_username
  vm_password = var.vm_password

  db_username = var.db_username
  db_password = var.db_password

  depends_on = [
    module.resource_group
  ]
}


module "nic" {

  source = "./modules/azurerm_nic"

  nics = var.nics

  subnet_ids = module.subnet.subnet_ids

  public_ip_ids = module.public_ip.public_ip_ids

  nsg_ids = module.nsg.nsg_ids

  depends_on = [
    module.subnet,
    module.nsg,
    module.public_ip
  ]
}


module "vm" {

  source = "./modules/azurerm_vm"

  vms = var.vms

  nic_ids = module.nic.nic_ids

  vm_username = var.vm_username
  vm_password = var.vm_password

  depends_on = [
    module.nic,
    module.keyvault
  ]
}


module "database" {

  source = "./modules/azurerm_database"

  databases = var.databases

  db_username = var.db_username
  db_password = var.db_password

  depends_on = [
    module.keyvault,
    module.resource_group
  ]
}