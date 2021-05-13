variable "rg_name" {
  description = "resource group name"
  type        = string

}

variable "rg_location" {
  description = "resource location"
  type        = string
}


variable "tags" {
  description = "Tags to set on the resource group."
  type        = map(string)
}