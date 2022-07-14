variable "paths" {
  type        = list(string)
  description = "list of dotted paths into the json"
}

variable "json_str" {
  type        = string
  description = "The json string to traverse"
  default     = null
}

variable "json" {
  type        = any
  description = "The json map to traverse (used if json_str is null)"
  default     = {}
}
