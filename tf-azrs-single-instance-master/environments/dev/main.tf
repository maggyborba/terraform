provider "azurerm" {
  # Whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  # https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG.md
  version = "=1.25.0"
  subscription_id = "${var.azure_subscription_id}"
  client_id = "${var.azure_client_id}"
  client_secret = "${var.azure_client_secret}"
  tenant_id ="${var.azure_tenant_id}"
}
# Create a resource group
resource "azurerm_resource_group" "tf-res-grp" {
  name     = "tf-rg-dev"
  location = "East US"
}
module "dev-vn" {
    source      = "../../../tf-modules/azure-virtual-network"
    
    resource_group_name = "${azurerm_resource_group.tf-res-grp.name}"
    vn_name = "tf-vn-dev"
    location = "${azurerm_resource_group.tf-res-grp.location}"
    address_space    = "192.168.1.0/24"
    subnet_cidr = ["192.168.1.0/26", "192.168.1.64/26"]
}

module "dev-vm" {
    source      = "../../../tf-modules/azure-vm"
    
    resource_group_name = "${azurerm_resource_group.tf-res-grp.name}"
    location = "${azurerm_resource_group.tf-res-grp.location}"
    subnet    = "${module.dev-vn.subnets[0]}"
}