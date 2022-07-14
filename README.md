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
  source = "schollii/tf-object-query/local"
  
  paths = [local.root_query_path]
  tf_object = local.root
}

locals {
  c_value = module.your_obj_paths.result[local.root_query_path]
}
```

You can specify multiple query paths. The result is a map of the query paths to the element at
the path. Each element can be an arbtrarily complex terraform object. 

This module should only be used when the path you want to query is not hardcoded. 

**_Current limitation_**: only 6 levels are supported. Eg `a.b.c.d.e.f` is the deepest, but extra level 
will not be queried. More levels could be added easily but there is a performance cost. 
Also, there will not be error, tf apply will (incorrectly) succeed. 

TODO: add code to fail if more than 6 levels. 

TODO: add code to only do the try blocks if level exists
