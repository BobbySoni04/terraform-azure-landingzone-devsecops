data "azurerm_virtual_network" "data_vnet" {
  for_each            = var.bastion_host
  name                = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_public_ip" "data_publicip" {
  for_each            = var.bastion_host
  name                = each.value.publicip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "data_subnet" {
  for_each             = var.bastion_host
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}
