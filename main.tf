
locals {
  aze1 = "${var.region}a"
}

locals {
  aze2 = "${var.region}b"
}

output "aze1" {
  value = local.aze1
}

output "aze2" {
  value = local.aze2
}

