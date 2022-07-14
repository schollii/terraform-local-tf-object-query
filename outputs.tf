output "result" {
  value = { for x in var.paths : x => module.json_path[x].result }
}

