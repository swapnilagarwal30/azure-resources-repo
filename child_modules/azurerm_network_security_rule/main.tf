resource "azurerm_network_security_rule" "netsecruleblock" {
  for_each                    = var.nsrvar
  name                        = each.value.nsr_name
  priority                    = each.value.nsr_p
  direction                   = each.value.nsr_dir
  access                      = each.value.nsr_access
  protocol                    = each.value.nsr_protocol
  source_port_range           = each.value.nsr_spr
  destination_port_range      = each.value.nsr_dpr
  source_address_prefix       = each.value.nsr_sap
  destination_address_prefix  = each.value.nsr_dap
  resource_group_name         = each.value.nsr_rgn
  network_security_group_name = each.value.nsr_nsg_name
}