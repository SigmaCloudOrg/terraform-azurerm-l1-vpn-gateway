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
  description = "(Required) The Name which should be used for this VPN Gateway. Changing this forces a new resource to be created."
}
  
variable "resource_group_name" {
  type        = string
  description = "(Required) The Name of the Resource Group in which this VPN Gateway should be created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) The Azure location where this VPN Gateway should be created. Changing this forces a new resource to be created."
}

variable "virtual_hub_id" {
  type        = string
  description = "(Required) The ID of the Virtual Hub within which this VPN Gateway should be created. Changing this forces a new resource to be created."
  default     = null
}

variable "routing_preference" {
  type        = string
  description = "(Optional) Azure routing preference lets you to choose how your traffic routes between Azure and the internet. You can choose to route traffic either via the Microsoft network (default value, Microsoft Network), or via the ISP network (public internet, set to Internet). More context of the configuration can be found in the Microsoft Docs to create a VPN Gateway. Changing this forces a new resource to be created."
  default     = null
}

variable "scale_unit" {
  type        = number
  description = "(Optional) The Scale Unit for this VPN Gateway. Defaults to 1."
  default     = 1
}

variable "bgp_settings_enabled" {
  type        = bool
  description = "to enable the block"
  default     = false
}

variable "bgp_settings_asn" {
  type        = string
  description = "(Required) The ASN of the BGP Speaker. Changing this forces a new resource to be created."
  default     = null
}

variable "bgp_settings_peer_weight" {
  type        = string
  description = "(Required) The weight added to Routes learned from this BGP Speaker. Changing this forces a new resource to be created."
  default     = null
}

variable "bgp_settings_custom_ips" {
  type        = list(string)
  description = "(Required) A list of custom BGP peering addresses to assign to this instance."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
}
# End Generic Resource Variables