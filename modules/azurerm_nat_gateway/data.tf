data "azurerm_subnet" "data_subnet1" {
  for_each             = var.nat_gateway
  name                 = each.value.subnet_name.subnet1
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_subnet" "data_subnet2" {
  for_each             = var.nat_gateway
  name                 = each.value.subnet_name.subnet2
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "data_pip" {
  for_each            = var.nat_gateway
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}
