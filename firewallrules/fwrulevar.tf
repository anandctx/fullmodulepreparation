variable "isglobalpolicy" {
  type        = bool
  description = "(optional) describe your variable"
  default     = true
}


variable "policylocation" {
    default = ""
}
variable "fwpolicylocation" {}
variable "childpolicy" {}

variable "rulecollections" {}