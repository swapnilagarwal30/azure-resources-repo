data "azurerm_subnet" "data_subnetblock" {
  for_each             = var.nicvar
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "data_pipblock" {
  for_each = {
    for k, v in var.nicvar : k => v
    if lookup(v, "pip_name", null) != null && lookup(v, "pip_name", "") != ""
  }
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}