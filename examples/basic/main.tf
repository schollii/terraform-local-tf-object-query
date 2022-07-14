locals {
  from_yaml_str = file("${path.root}/example.yaml")
  from_json_str = file("${path.root}/example.json")
  from_json_decode = jsondecode(local.from_json_str)
  from_obj  = {
    a = {
      b = {
        c1 = 123
        c2 = {
          d = "d"
          e = "e"
        }
      }
    }
  }

  paths = ["a.b.c1", "a.b.c2", "unknown", "a.b.unknown"]
}

module "yaml_str" {
  source = "../"

  paths = local.paths
  json_or_yaml_str = local.from_yaml_str
}

module "json_str" {
  source = "../"

  paths = local.paths
  json_or_yaml_str = local.from_json_str
}

module "json_decoded" {
  source = "../"

  paths = local.paths
  tf_object = local.from_json_decode
}

module "tf_obj" {
  source = "../"

  paths = local.paths
  tf_object = local.from_obj
}
