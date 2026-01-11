resource "azurerm_digital_twins_endpoint_eventhub" "digital_twins_endpoint_eventhubs" {
  for_each = var.digital_twins_endpoint_eventhubs

  digital_twins_id                     = each.value.digital_twins_id
  eventhub_primary_connection_string   = each.value.eventhub_primary_connection_string
  eventhub_secondary_connection_string = each.value.eventhub_secondary_connection_string
  name                                 = each.value.name
  dead_letter_storage_secret           = each.value.dead_letter_storage_secret
}

