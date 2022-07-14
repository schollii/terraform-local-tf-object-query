variable "paths" {
  type        = list(string)
  description = "list of dotted paths into the json"
}

variable "json_or_yaml_str" {
  type        = string
  description = "The json or yaml string to traverse"
  default     = null
}

variable "tf_object" {
  type        = any
  description = "The terraform object to query (used if json_or_yaml_str is null or does not parse)"
  default     = {}
}
