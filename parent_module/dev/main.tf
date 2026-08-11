module "azurerm_resource_group" {
  source = "../../child_modules/azurerm_resource_group"
  rgvar  = var.rgvar
}
module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../child_modules/azurerm_virtual_network"
  vnetvar    = var.vnetvar
}
module "azurerm_subnet" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../child_modules/azurerm_subnet"
  subnetvar  = var.subnetvar
}
# module "azurerm_public_ip" {
#   depends_on = [module.azurerm_subnet]
#   source     = "../../child_modules/azurerm_public_ip"
#   pipvar     = var.pipvar
# }
module "azurerm_network_interface" {
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
  source     = "../../child_modules/azurerm_network_interface"
  nicvar     = var.nicvar
}
module "azurerm_linux_virtual_machine" {
  depends_on  = [module.azurerm_network_interface]
  source      = "../../child_modules/azurerm_linux_virtual_machine"
  linuxvm_var = var.linuxvm_var
}
module "azurerm_network_security_group" {
  depends_on = [module.azurerm_subnet]
  source     = "../../child_modules/azurerm_network_security_group"
  nsgvar     = var.nsgvar
}
module "azurerm_network_security_rule" {
  depends_on = [module.azurerm_network_security_group]
  source     = "../../child_modules/azurerm_network_security_rule"
  nsrvar     = var.nsrvar
}
# module "azurerm_subnet_network_security_group_association" {
#   depends_on = [module.azurerm_subnet, module.azurerm_network_security_group]
#   source     = "../../child_modules/azurerm_subnet_network_security_group_association"
#   subansgvar = var.subansgvar
# }
# module "azurerm_bastion_host" {
#   depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
#   source     = "../../child_modules/azurerm_bastion_host"
#   bastionvar = var.bastionvar
# }