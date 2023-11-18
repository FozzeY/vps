terraform {
  cloud {
    organization = "imel"
    workspaces {
      name = "vps"
    }
  }
  required_providers {
    vultr = {
      source = "vultr/vultr"
    }
  }
}

resource "vultr_ssh_key" "ansible" {
  name    = "Ansible"
  ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJWRMiE+JFu2WAP2uOeaOoy11kdBz/7NWCdYow2mS5qA ansible@fozzey.ru"
}

resource "vultr_ssh_key" "personal" {
  name    = "Personal"
  ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK0c3l5L+HP1YKTfR7q0SG1lPLTon6PfFZHrjpplTbll admin@fozzey.ru"
}

data "vultr_os" "openbsd-74" {
  filter {
    name   = "name"
    values = ["OpenBSD 7.4 x64"]
  }
}

resource "vultr_instance" "this" {
  region      = "waw"
  plan        = "vhp-1c-1gb-amd"
  os_id       = data.vultr_os.openbsd-74.id
  label       = "fozzey.ru"
  hostname    = "fozzey.ru"
  enable_ipv6 = true
  ssh_key_ids = [vultr_ssh_key.ansible.id, vultr_ssh_key.personal.id]
}
