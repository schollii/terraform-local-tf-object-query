variable "path" {
  type        = string
  description = "dotted path of json key value to get"
}

variable "json" {
  type        = map(any)
  description = "The json map to traverse"
  default     = null
}

locals {
  json      = var.json
  path_list = split(".", var.path)

  level1 = try(local.json[local.path_list[0]], null)
  // if we fail because the item does not exist in json, return null;
  // but if we fail because we're past the end of path_list, return the previous level
  level2 = try(local.level1[local.path_list[1]], length(local.path_list) >= 2 ? null : local.level1)
  level3 = try(local.level2[local.path_list[2]], length(local.path_list) >= 3 ? null : local.level2)
  level4 = try(local.level3[local.path_list[3]], length(local.path_list) >= 4 ? null : local.level3)
  level5 = try(local.level4[local.path_list[4]], length(local.path_list) >= 5 ? null : local.level4)
  result = try(local.level5[local.path_list[5]], length(local.path_list) >= 6 ? null : local.level5)
}

output "result" {
  value = local.result
}