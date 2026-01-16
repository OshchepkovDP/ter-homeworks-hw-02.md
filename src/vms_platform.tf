/*
// Переменные для образа ВМ (web)
variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Family of the OS image for the web VM"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name of the web VM instance"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID for the web VM"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores for the web VM"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "Amount of memory (RAM) in GB for the web VM"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 5
  description = "Core fraction percentage for the web VM"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Whether the web VM should be preemptible"
}

// Переменные для БД-ВМ
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name of the DB VM instance"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID for the DB VM"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores for the DB VM"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "Amount of memory (RAM) in GB for the DB VM"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "Core fraction percentage for the DB VM"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = false  
  description = "Whether the DB VM should be preemptible"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Zone for the DB VM (ru-central1-b)"
}
*/

