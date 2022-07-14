# terraform-local-tf-object-query

Dynamically / programmatically get one or more elements from a terraform object() 
(typically loaded from a json or yaml file).

Eg given the following terraform object 
```terraform
locals {
    root = {
      a = {
        b = {
          c = 123
        }
      }
    }
    root_query_path = "a.b.c"
}
```
you CANNOT get the value of `root.a.b.c` via the programmatically defined `local.root_query_path`: 
```terraform
locals {
  c_value = local.root[local.root_query_path]  // ERROR terraform does not support this
}
```
BUT you CAN write 
```terraform
module "your_obj_paths" {
  source = <path-to-tf-object-query-module>
  
  paths = [local.root_query_path]
  tf_object = local.root
}

locals {
  c_value = module.your_obj_paths.result[local.root_query_path]
}
```

This module should only be used when the path you want to query is not hardcoded. 
