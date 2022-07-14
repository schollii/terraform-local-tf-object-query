locals {
  json = try(jsondecode(var.json_or_yaml_str), yamldecode(var.json_or_yaml_str), var.tf_object)
}

module "json_path" {
  for_each = toset(var.paths)
  source   = "./tf_object_path"

  path = each.value
  json = local.json
}

