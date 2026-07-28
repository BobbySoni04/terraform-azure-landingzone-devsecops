
resource "azurerm_nat_gateway" "nat" {
  for_each            = var.nat_gateway
  name                = each.value.nat_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_subnet_nat_gateway_association" "subnet_nat_association1" {
     for_each            = var.nat_gateway
  subnet_id      = data.azurerm_subnet.data_subnet1[each.key].id
  nat_gateway_id = azurerm_nat_gateway.nat[each.key].id
}
resource "azurerm_subnet_nat_gateway_association" "subnet_nat_association2" {
     for_each            = var.nat_gateway
  subnet_id      = data.azurerm_subnet.data_subnet2[each.key].id
  nat_gateway_id = azurerm_nat_gateway.nat[each.key].id
}




resource "azurerm_nat_gateway_public_ip_association" "nat_pip_assiciation" {
     for_each            = var.nat_gateway
  nat_gateway_id       = azurerm_nat_gateway.nat[each.key].id
  public_ip_address_id = data.azurerm_public_ip.data_pip[each.key].id
}
