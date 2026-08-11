resource "azurerm_network_interface" "nicblock" {
  for_each            = var.nicvar
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnetblock[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.data_pipblock[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}