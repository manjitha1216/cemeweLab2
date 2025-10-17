###########################################
# Variables for Lab 2
###########################################

variable "shared_sg_id" {
  description = "Existing shared security group ID for Jenkins lab"
  type        = string
  default     = "sg-0840a6f154aa2bfe6"
}

variable "student_name" {
  description = "Unique student identifier"
  type        = string
  default     = "manjithatest6"  # <-- Each student updates this value
}
