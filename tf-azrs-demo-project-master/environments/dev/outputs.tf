output "vmss_fqdn" {
  value = "${module.dev-vmss.vmss_fqdn}"
}

output "jumpbox_fqdn" {
  value = "${module.dev-vmss.jumpbox_fqdn}"
}