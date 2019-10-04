provider "google" {
  credentials = "${file("${var.credentials}")}"
  project     = "${var.project}"
  region      = "${var.region}"
  zone        = "${var.zone}"
}

module "dev-vpc" {
    source      = "../../../tf-modules/gcp-vpc"
    
    name = "tf-vpc"
    auto_create_subnetworks = "false"
    vpc_cidr = "192.168.0.0/24"
    subnet_cidr = ["192.168.1.0/26", "192.168.1.64/26"]
    subnet_region = "us-east1"
}

module "dev-vm" {
    source      = "../../../tf-modules/gcp-vm"
    
    name              = "tf-vm"
    machine_type      = "f1-micro"
    image             = "debian-cloud/debian-9"
    ## Instance will be created in a custom subnet.
    ## If auto_create_subnetworks = True, then module.dev-vpc.vpc_self_links
    ## should be used instead. Logic for this is not present in gcp-vm
    # vpc             = "${module.dev-vpc.vpc_self_links}"
    subnet            = "${module.dev-vpc.subnets_self_links[0]}"
    ssh_user          = "fervartel"
    ssh_pub_key_file  = "~/.ssh/id_rsa.pub"
}