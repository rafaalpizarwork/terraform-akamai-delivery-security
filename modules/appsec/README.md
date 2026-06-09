<!-- BEGIN_TF_DOCS -->



# Usage
Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-location>"
  
	 # Required variables
  	 activation_note  = <string>
  	 contact_emails  = <list(string)>
  	 contract_id  = <string>
  	 description  = <string>
  	 group_id  = <string>
  	 name  = <string>
  	 new_hostnames  = <list(string)>
  
	 # Optional variables
  	 activate2production  = <bool> | default: false
  	 activate2staging  = <bool> | default: false
}
 ```

## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_akamai"></a> [akamai](#requirement\_akamai) | >= 10 |

## Resources

| Name | Type |
| ---- | ---- |
| [akamai_appsec_activations.appsec-activation-production](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_activations) | resource |
| [akamai_appsec_activations.appsec-activation-staging](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_activations) | resource |
| [akamai_appsec_configuration.config](https://registry.terraform.io/providers/akamai/akamai/latest/docs/resources/appsec_configuration) | resource |
| [akamai_appsec_configuration.config](https://registry.terraform.io/providers/akamai/akamai/latest/docs/data-sources/appsec_configuration) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_activation_note"></a> [activation\_note](#input\_activation\_note) | Property version notes | `string` | n/a | yes |
| <a name="input_contact_emails"></a> [contact\_emails](#input\_contact\_emails) | Email to be notified about property version push | `list(string)` | n/a | yes |
| <a name="input_contract_id"></a> [contract\_id](#input\_contract\_id) | Akamai contract ID | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Property version notes | `string` | n/a | yes |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | Akamai group Name | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Application Security Configuration Name | `string` | n/a | yes |
| <a name="input_new_hostnames"></a> [new\_hostnames](#input\_new\_hostnames) | Akamai property entry point hostnames, host part only | `list(string)` | n/a | yes |
| <a name="input_activate2production"></a> [activate2production](#input\_activate2production) | Activate the setup to production | `bool` | `false` | no |
| <a name="input_activate2staging"></a> [activate2staging](#input\_activate2staging) | Activate the setup to staging | `bool` | `false` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_appsec_hostnames"></a> [appsec\_hostnames](#output\_appsec\_hostnames) | n/a |

## Resources
- [Akamai API Credentials](https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials)
- [Akamai Terraform Provider](https://techdocs.akamai.com/terraform/docs)
- [Akamai CLI for Terraform](https://github.com/akamai/cli-terraform)
- [Linode Object Storage](https://www.linode.com/lp/object-storage/)
- [Akamai Developer Youtube Channel](https://www.youtube.com/c/AkamaiDeveloper)
- [Akamai Github](https://github.com/akamai)
<!-- END_TF_DOCS -->