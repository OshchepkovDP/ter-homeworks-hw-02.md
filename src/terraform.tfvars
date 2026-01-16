// terraform.tfvars
cloud_id   = "b1gg9s382j98g3e6pgkv"
folder_id = "b1g2426oq802iot2pt34"

vms_resources = {
  web = {
    cores        = 2
    memory       = 2
    core_fraction = 5
    hdd_size     = 10
    hdd_type     = "network-hdd"
  }
  db = {
    cores        = 2
    memory       = 4
    core_fraction = 20
    hdd_size     = 10
    hdd_type     = "network-ssd"
  }
}

metadata = {
  serial-port-enable = 1
  ssh_keys_source = "local"
}
