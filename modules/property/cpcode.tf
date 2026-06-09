locals {
  # Clean property name to be used as cp code name
  # The cpcode name contains one or more of these special characters ^ _ , # % ' \" ",
  cp_code_name = replace(var.name, "/[ ^_,#%'\"]/", "-")
}

resource "akamai_cp_code" "delivery_cp_code" {
  name        = local.cp_code_name
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = var.product_id
  timeouts {
    update = "1h"
  }
}

output "cp_code_id" {
  value = akamai_cp_code.delivery_cp_code.id
}

output "cp_code_name" {
  value = akamai_cp_code.delivery_cp_code.name
}
