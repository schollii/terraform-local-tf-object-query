output "from_yaml_str" {
  value = module.yaml_str.result
}

output "from_json_str" {
  value = module.json_str.result
}

output "from_json" {
  value = module.json_decoded.result
}

output "from_tf_obj" {
  value = module.tf_obj.result
}