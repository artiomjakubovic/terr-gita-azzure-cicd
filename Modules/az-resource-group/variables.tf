variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "rg_location" {
  description = "Resource Group Location"
  type        = string
  default     = "West Europe"
}


variable "rg_tags" {
  description = "Tags to set on the resource group."
  type        = map(string)
}
