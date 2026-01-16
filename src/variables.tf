### Cloud vars
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

### SSH vars
variable "vms_ssh_root_key" {
  type        = string
  description = "Override default SSH key (if not set, uses local file from locals.tf)"
  default     = null
}

### VM resources (unified)
variable "vms_resources" {
  type = map(object({
    cores        = number
    memory       = number
    core_fraction = number
    hdd_size     = number
    hdd_type     = string
  }))
  description = "Ресурсы для ВМ: ядра, память, доля CPU, диск"
}

variable "metadata" {
  type = object({
    serial-port-enable = number
    ssh_keys_source    = string
  })
  description = "Общие metadata для всех ВМ"
  default = {
    serial-port-enable = 1
    ssh_keys_source    = "local"
  }
}

### Image & VM settings
variable "vm_web_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
  description = "Image family for web VM"
}

variable "vm_web_name" {
  type    = string
  default = "netology-develop-platform-web"
  description = "Name of the web VM instance"
}

variable "vm_web_platform_id" {
  type    = string
  default = "standard-v1"
  description = "Platform ID for the web VM"
}

variable "vm_web_preemptible" {
  type    = bool
  default = true
  description = "Whether the web VM should be preemptible"
}

variable "vm_db_name" {
  type    = string
  default = "netology-develop-platform-db"
  description = "Name of the DB VM instance"
}

variable "vm_db_platform_id" {
  type    = string
  default = "standard-v1"
  description = "Platform ID for the DB VM"
}

variable "vm_db_zone" {
  type    = string
  default = "ru-central1-b"
  description = "Zone for the DB VM"
}

variable "vm_db_preemptible" {
  type    = bool
  default = false
  description = "Whether the DB VM should be preemptible"
}

### DEPRECATED variables (commented out - do not use)
/*
variable "vm_web_cores" {
  type        = number
  description = "Deprecated: use vms_resources.web.cores instead"
}

variable "vm_web_memory" {
  type        = number
  description = "Deprecated: use vms_resources.web.memory instead"
}

variable "vm_web_core_fraction" {
  type        = number
  description = "Deprecated: use vms_resources.web.core_fraction instead"
}

variable "vm_db_cores" {
  type        = number
  description = "Deprecated: use vms_resources.db.cores instead"
}

variable "vm_db_memory" {
  type        = number
  description = "Deprecated: use vms_resources.db.memory instead"
}

variable "vm_db_core_fraction" {
  type        = number
  description = "Deprecated: use vms_resources.db.core_fraction instead"
}

variable "vm_web_hdd_size" {
  type        = number
  description = "Deprecated: use vms_resources.web.hdd_size instead"
}

variable "vm_web_hdd_type" {
  type        = string
  description = "Deprecated: use vms_resources.web.hdd_type instead"
}

variable "vm_db_hdd_size" {
  type        = number
  description = "Deprecated: use vms_resources.db.hdd_size instead"
}

variable "vm_db_hdd_type" {
  type        = string
  description = "Deprecated: use vms_resources.db.hdd_type instead"
}
*/
