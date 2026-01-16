locals {
  default_ssh_key = file("/home/skk/.ssh/id_ed25519.pub")

  vm_names = {
    web = "${var.vpc_name}-${var.vm_web_name}"
    db  = "${var.vpc_name}-${var.vm_db_name}"
  }

  ssh_keys = "ubuntu:${
    var.metadata.ssh_keys_source == "var" 
      ? var.vms_ssh_root_key
      : local.default_ssh_key
  }"
}
