resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bastion_host
  name                = each.value.name
  location            = each.value.location
  //virtual_network_id  = data.azurerm_virtual_network.data_vnet[each.key].id
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                 = each.value.ip_configuration.name
    subnet_id            = data.azurerm_subnet.data_subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.data_publicip[each.key].id
  }
}
