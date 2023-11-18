terraform {
  cloud {
    organization = "imel"

    workspaces {
      name = "vps"
    }
  }
}

resource "vultr_ssh_key" "ansible" {
  name    = "Ansible"
  ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJWRMiE+JFu2WAP2uOeaOoy11kdBz/7NWCdYow2mS5qA ansible@fozzey.ru"
}
