resource "azurerm_subnet_network_security_group_association" "subansgblock" {
  for_each = var.subansgvar
  subnet_id                 = data.azurerm_subnet.data_subnetblock[each.key].id
  network_security_group_id = data.azurerm_network_security_group.data_nsgblock[each.key].id
}