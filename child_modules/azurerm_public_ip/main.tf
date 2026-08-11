resource "azurerm_public_ip" "pipblock" {
  for_each            = var.pipvar
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = each.value.pip_alloc
}