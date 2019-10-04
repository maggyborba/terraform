# Terraform template for Azure Virtual Machine

## Objectives
The objective of this project is to demostrate how to use Terraform modules with Azure for creating:

- Virtual Network
- Public IP
- Virtual NIC
- SSH Security Group
- Single Virtual Machine

## Requirements

- [Terraform](https://www.terraform.io/)
- [tf-modules](https://github.com/fervartel/tf-modules)
- terraform.tfvars with Azure credentials ([Authenticating Terraform using a Service Principal](https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html)):
``` bash
azure_subscription_id = "xxxx"
azure_client_id = "xxxx"
azure_client_secret = "xxxx"
azure_tenant_id = "xxxx"
```

## Advantages
The main advantage of using Terraform as IaC provider is the fact of being Cloud agnostic with support for multiple Cloud (as other services) providers.