resource "proxmox_vm_qemu" "testvm" {
  name        = var.name
  target_node = var.target_node
  clone = var.clone_source_name

  cpu  {
	cores = var.cpu_cores
	sockets = var.cpu_sockets
  }


  memory   = var.memory
  balloon  = var.balloon

  full_clone = var.full_clone
  scsihw   = "virtio-scsi-pci"
  boot                   = "order=scsi0"
  ipconfig0 = "ip=${var.ip},gw=${var.gw}"
  qemu_os = "l26"

  ciuser                 = var.ci_user
  sshkeys = var.ci_sshkeys
  nameserver   = var.ci_nameserver
  searchdomain = var.ci_searchdomain

  serial {
    id   = 0
    type = "socket"
  }

  network {
      id     = 0
      model  = "virtio"
      bridge = "vmbr0"
   }

  # Setup the disk
  disks {
    ide {
      ide2 {
        cloudinit {
            storage = "local-lvm"
          }
      }
    }
    scsi {
      scsi0 {
        disk {
          format    = "raw"
          storage   = "local-lvm"
          size      = var.size
        }
      }
    }
  }



}
