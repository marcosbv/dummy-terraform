variable "number_of_instances" {
  type = "string"
}

variable "min_of_instances" {
  type = "string"
}

variable "max_of_instances" {
  type = "string"
}

resource "null_resource" "dummy" {
  triggers {
    max_of_instances    = "${var.max_of_instances}"
    min_of_instances    = "${var.min_of_instances}"
    number_of_instances = "${var.number_of_instances}"
  }

  provisioner "local-exec" {
    command = "echo Instances=${var.number_of_instances}"
  }
}

output "ip_address" {
  value = "${var.max_of_instances}"
}
