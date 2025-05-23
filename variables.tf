variable "full_clone"{
  default=true
}
variable "memory"{
  default = "1024"
}
variable "balloon"{
  default = "1024"
}
variable "cpu_cores"{
	default = 1
}
variable "cpu_sockets"{
	default = 1
}
variable "name"{}
variable "target_node"{}
variable "ip"{}
variable "gw"{}
variable "ci_user"{}
variable "ci_sshkeys"{}
variable "ci_nameserver"{}
variable "ci_searchdomain"{}
variable "size"{}
variable "clone_source_name"{}
