module "resource_module" {
  source         = "../../modules/azurerm_resource_group/"
  resource_group = var.resource_group
}

module "virtual_network_module" {
  depends_on      = [module.resource_module]
  source          = "../../modules/azurerm_virtual_network"
  virtual_network = var.virtual_network
}

module "subnet_module" {
  depends_on = [module.virtual_network_module]
  source     = "../../modules/azurerm_subnet"
  subnet     = var.subnet
}

module "publicip_module" {
  depends_on = [module.resource_module]
  source     = "../../modules/azurerm_public_ip"
  pip        = var.pip
}
module "nic_module" {
  depends_on = [module.resource_module, module.virtual_network_module, module.subnet_module]
  source     = "../../modules/azurerm_virtual_machine"
  virtual_machine        = var.virtual_machine
}

module "bastionhost_module" {
  depends_on   = [module.resource_module, module.virtual_network_module, module.subnet_module]
  source       = "../../modules/azurerm_bastion_host"
  bastion_host = var.bastion_host
}

module "nat_gateway_module" {
  depends_on  = [module.subnet_module, module.publicip_module]
  source      = "../../modules/azurerm_nat_gateway"
  nat_gateway = var.nat_gateway
}