packer {
  required_plugins {
    qemu = {
      source  = "github.com/hashicorp/qemu"
      version = "~> 1"
    }
    vagrant = {
      source  = "github.com/hashicorp/vagrant"
      version = "~> 1"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
  }
}

variable "headless" {
  type = bool
  default = true
}
variable "iso_url" {
  type = string
}
variable "iso_checksum" {
  type = string
}
variable "http_dir" {
  type = string
}
variable "vm_name" {
  type = string
}
variable "boot_command" {
  type = list(string)
}
variable "setup_script" {
  type = string
}

source "qemu" "alt-linux" {
  headless = "${var.headless}"

  # Путь и контрольная сумма исходного ISO-образа
  iso_url = "${var.iso_url}"
  iso_checksum = "${var.iso_checksum}"

  http_directory = "${var.http_dir}"

  vm_name = "${var.vm_name}"

  boot_wait = "15s"
  boot_command = "${var.boot_command}"

  accelerator = "kvm"
  disk_size   = 4096
  format      = "qcow2"
  net_device  = "virtio-net"
  output_directory = "output-vagrant"
  qemuargs = [
    [ "-m", "1024" ],
    [ "-smp", "1" ]
  ]
  ssh_username = "vagrant"
  ssh_password = "vagrant"
  ssh_port     = 22
  ssh_wait_timeout = "10000s"
  ssh_pty = true
}

build {
  sources = [
    "source.qemu.alt-linux"
  ]

  post-processor "vagrant" {
    keep_input_artifact = false
    output              = "package.box"
  }
}
