resource "azurerm_network_security_group" "nsgblock" {
  for_each            = var.nsgvar
  name                = each.value.nsg_name
  location            = each.value.nsg_loc
  resource_group_name = each.value.nsg_rgn
}