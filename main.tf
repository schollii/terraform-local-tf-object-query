locals {
  json = var.json_str != null ? jsondecode(var.json_str) : var.json
}

module "json_path" {
  for_each = toset(var.paths)
  source   = "./json_path"

  path = each.value
  json = local.json
}

