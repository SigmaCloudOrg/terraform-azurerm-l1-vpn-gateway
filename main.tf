locals {
    prefix_input = var.name_prefix != "" ? var.name_prefix : var.deployment_name
    name_prefix = "pubip-${local.prefix_input}"
}

resource "azurerm_public_ip" "generic" {
  name                      = "${local.name_prefix}-${var.name}"
  resource_group_name       = var.resource_group_name
  location                  = var.location
  allocation_method         = var.allocation_method
  zones                     = var.zones
  domain_name_label         = var.domain_name_label
  edge_zone                 = var.edge_zone
  idle_timeout_in_minutes   = var.idle_timeout_in_minutes
  ip_tags                   = var.ip_tags
  ip_version                = var.ip_version
  public_ip_prefix_id       = var.public_ip_prefix_id
  reverse_fqdn              = var.reverse_fqdn
  sku                       = var.sku
  sku_tier                  = var.sku_tier
  tags                      = merge(
                                var.tags,
                                    tomap({
                                        "name" = "${local.name_prefix}-${var.name}",
                                        "resource" = "azurerm_public_ip",
                                        "service" = "network",
                                        "dataclass" = "public"
                                    })
                                )
}