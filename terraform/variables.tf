variable "ctfd_url" {
  description = "Base URL of the CTFd instance"
  type        = string
}

variable "ctfd_token" {
  description = "Admin API token for CTFd"
  type        = string
  sensitive   = true
}
