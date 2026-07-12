data "azurerm_key_vault_secret" "eventhub_primary_connection_string" {
  for_each     = { for k, v in var.digital_twins_endpoint_eventhubs : k => v if v.eventhub_primary_connection_string_key_vault_id != null && v.eventhub_primary_connection_string_key_vault_secret_name != null }
  name         = each.value.eventhub_primary_connection_string_key_vault_secret_name
  key_vault_id = each.value.eventhub_primary_connection_string_key_vault_id
}
data "azurerm_key_vault_secret" "eventhub_secondary_connection_string" {
  for_each     = { for k, v in var.digital_twins_endpoint_eventhubs : k => v if v.eventhub_secondary_connection_string_key_vault_id != null && v.eventhub_secondary_connection_string_key_vault_secret_name != null }
  name         = each.value.eventhub_secondary_connection_string_key_vault_secret_name
  key_vault_id = each.value.eventhub_secondary_connection_string_key_vault_id
}
data "azurerm_key_vault_secret" "dead_letter_storage_secret" {
  for_each     = { for k, v in var.digital_twins_endpoint_eventhubs : k => v if v.dead_letter_storage_secret_key_vault_id != null && v.dead_letter_storage_secret_key_vault_secret_name != null }
  name         = each.value.dead_letter_storage_secret_key_vault_secret_name
  key_vault_id = each.value.dead_letter_storage_secret_key_vault_id
}
resource "azurerm_digital_twins_endpoint_eventhub" "digital_twins_endpoint_eventhubs" {
  for_each = var.digital_twins_endpoint_eventhubs

  digital_twins_id                     = each.value.digital_twins_id
  eventhub_primary_connection_string   = each.value.eventhub_primary_connection_string != null ? each.value.eventhub_primary_connection_string : try(data.azurerm_key_vault_secret.eventhub_primary_connection_string[each.key].value, null)
  eventhub_secondary_connection_string = each.value.eventhub_secondary_connection_string != null ? each.value.eventhub_secondary_connection_string : try(data.azurerm_key_vault_secret.eventhub_secondary_connection_string[each.key].value, null)
  name                                 = each.value.name
  dead_letter_storage_secret           = each.value.dead_letter_storage_secret != null ? each.value.dead_letter_storage_secret : try(data.azurerm_key_vault_secret.dead_letter_storage_secret[each.key].value, null)
}

