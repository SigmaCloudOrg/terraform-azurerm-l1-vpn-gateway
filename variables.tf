# Environment Variables
variable "deployment_name" {
  type        = string
  description = "The name of the current Terraform deployment."
}

variable "name_prefix" {
  type        = string
  description = "The current built up naming convention used to start new resource names."
  default     = ""
}
# End Environment Variables
# Generic Resource Variables
variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Public IP resource . Changing this forces a new resource to be created."
}
  
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the public ip."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "allocation_method" {
  type        = string
  description = "(Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  default     = "Static"
}

variable "zones" {
  type        = list(string)
  description = "(Optional) A collection containing the availability zone to allocate the Public IP in."
  default     = ["1", "2", "3"]
}

variable "domain_name_label" {
  type        = string
  description = "(Optional) Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system."
  default     = null
}

variable "edge_zone" {
  type        = string
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Public IP should exist. Changing this forces a new Public IP to be created."
  default     = null
}

variable "idle_timeout_in_minutes" {
  type        = number
  description = "(Optional) Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes."
  default     = null
}

variable "ip_tags" {
  type        = map(string)
  description = "(Optional) A mapping of IP tags to assign to the public IP."
  default     = null
}

variable "ip_version" {
  type        = string
  description = "(Optional) The IP Version to use, IPv6 or IPv4."
  default     = "IPv4"
}

variable "public_ip_prefix_id" {
  type        = string
  description = "(Optional) If specified then public IP address allocated will be provided from the public IP prefix resource."
  default     = null
}

variable "reverse_fqdn" {
  type        = string
  description = "(Optional) A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN."
  default     = null
}

variable "sku" {
  type        = string
  description = "(Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
  default     = "Standard"
}

variable "sku_tier" {
  type        = string
  description = "(Optional) The SKU Tier that should be used for the Public IP. Possible values are Regional and Global. Defaults to Regional."
  default     = "Regional"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
}
# End Generic Resource Variables