locals {
    prefix_input = var.name_prefix != "" ? var.name_prefix : var.deployment_name
    name_prefix = "vpngw-${local.prefix_input}"
    bgp_settings_block = {
        asn             = var.bgp_settings_asn
        peer_weight     = var.bgp_settings_peer_weight
        custom_ips      = var.bgp_settings_custom_ips
    }
}

resource "azurerm_vpn_gateway" "generic" {
  name                      = "${local.name_prefix}-${var.name}"
  resource_group_name       = var.resource_group_name
  location                  = var.location
  virtual_hub_id            = var.virtual_hub_id
  routing_preference        = var.routing_preference
  scale_unit                = var.scale_unit
  
  dynamic "bgp_settings" {
      for_each = var.bgp_settings_enabled ? local.bgp_settings_block : []
      content {
        asn                 = bgp_settings.value.asn
        peer_weight         = bgp_settings.value.peer_weight
        instance_bgp_peering_address {
            custom_ips      = bgp_settings.value.custom_ips
        }
      }
  }
  tags                      = merge(
                                var.tags,
                                    tomap({
                                        "name" = "${local.name_prefix}-${var.name}",
                                        "resource" = "azurerm_vpn_gateway",
                                        "service" = "network",
                                        "dataclass" = "public"
                                    })
                                )
}