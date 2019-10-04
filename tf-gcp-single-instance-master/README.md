# Terraform template for Google Cloud Platform (GCP) Virtual Machine

## Objectives
The objective of this project is to demostrate how to use Terraform modules with GCP for creating:

- Virtual Network
- Single Virtual Machine

## Requirements

- [Terraform](https://www.terraform.io/)
- [tf-modules](https://github.com/fervartel/tf-modules)
- Key ID (JSON file in your home directory) for the Service Account corresponding to the GCP project you are working with.

## Advantages
The main advantage of using Terraform as IaC provider is the fact of being Cloud agnostic with support for multiple Cloud (as other services) providers.