packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}

source "virtualbox-iso" "baseimage" {
  guest_os_type  = "Ubuntu_64"
  headless       = false
  http_directory = "http"

  boot_command = ["<wait>c<wait>set gfxpayload=keep<enter><wait>linux /casper/vmlinuz quiet autoinstall ds=nocloud-net\\;s=http://{{.HTTPIP}}:{{.HTTPPort}}/ ---<enter><wait>initrd /casper/initrd<wait><enter><wait>boot<enter><wait>"]

  vm_name = "lab-vm-rechnernetze2023_2024"

  disk_size = 15000

  gfx_controller = "vmsvga"
  gfx_vram_size  = 128

  iso_url                = "https://ftp.halifax.rwth-aachen.de/ubuntu-releases/jammy/ubuntu-22.04.3-live-server-amd64.iso"
  #iso_checksum           = "file:https://ftp.halifax.rwth-aachen.de/ubuntu-releases/jammy/SHA256SUMS"
  iso_checksum           = "sha256:a4acfda10b18da50e2ec50ccaf860d7f20b389df8765611142305c0e911d16fd"
  ssh_username           = "networks"
  ssh_password           = "rn2023"
  ssh_timeout            = "10m"
  ssh_handshake_attempts = 1000
  shutdown_command       = "echo 'packer' | sudo -S shutdown -P now"

  hard_drive_interface = "sata"

  rtc_time_base        = "UTC"
  guest_additions_mode = "disable"
  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--memory", "2048"],
    ["modifyvm", "{{.Name}}", "--cpus", "4"],
    ["modifyvm", "{{.Name}}", "--natpf1", "guestssh,tcp,,2222,,22"],
    ["modifyvm", "{{.Name}}", "--nat-localhostreachable1", "on"], # Uncomment if you are using VirtualBox 7.0.0 or newer
  ]
}

source "virtualbox-ovf" "rechnernetze" {

  source_path            = "output-baseimage/lab-vm-rechnernetze2023_2024.ovf"
  ssh_username           = "networks"
  ssh_password           = "rn2023"
  ssh_timeout            = "10m"
  ssh_handshake_attempts = 1000
  shutdown_command       = "echo 'packer' | sudo -S shutdown -P now"

  vm_name = "goSDN VM"

  guest_additions_mode = "disable"

  export_opts = [
    "--manifest",
    "--vsys", "0",
    "--description", "VM fuer Rechnernetze Wintersemester 2023/2024",
    "--version", "0.1"
  ]
  format           = "ova"
  output_directory = "VM"
}

build {
  sources = ["sources.virtualbox-iso.baseimage"]
  provisioner "shell" {
    script = "scripts/setup.sh"
  }
}

build {
  sources = ["sources.virtualbox-ovf.rechnernetze"]
  provisioner "shell" {
    script = "scripts/rn_clone.sh"
  }
}


