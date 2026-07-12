output "digital_twins_endpoint_eventhubs_dead_letter_storage_secret" {
  description = "Map of dead_letter_storage_secret values across all digital_twins_endpoint_eventhubs, keyed the same as var.digital_twins_endpoint_eventhubs"
  value       = { for k, v in azurerm_digital_twins_endpoint_eventhub.digital_twins_endpoint_eventhubs : k => v.dead_letter_storage_secret }
  sensitive   = true
}
output "digital_twins_endpoint_eventhubs_digital_twins_id" {
  description = "Map of digital_twins_id values across all digital_twins_endpoint_eventhubs, keyed the same as var.digital_twins_endpoint_eventhubs"
  value       = { for k, v in azurerm_digital_twins_endpoint_eventhub.digital_twins_endpoint_eventhubs : k => v.digital_twins_id }
}
output "digital_twins_endpoint_eventhubs_eventhub_primary_connection_string" {
  description = "Map of eventhub_primary_connection_string values across all digital_twins_endpoint_eventhubs, keyed the same as var.digital_twins_endpoint_eventhubs"
  value       = { for k, v in azurerm_digital_twins_endpoint_eventhub.digital_twins_endpoint_eventhubs : k => v.eventhub_primary_connection_string }
  sensitive   = true
}
output "digital_twins_endpoint_eventhubs_eventhub_secondary_connection_string" {
  description = "Map of eventhub_secondary_connection_string values across all digital_twins_endpoint_eventhubs, keyed the same as var.digital_twins_endpoint_eventhubs"
  value       = { for k, v in azurerm_digital_twins_endpoint_eventhub.digital_twins_endpoint_eventhubs : k => v.eventhub_secondary_connection_string }
  sensitive   = true
}
output "digital_twins_endpoint_eventhubs_name" {
  description = "Map of name values across all digital_twins_endpoint_eventhubs, keyed the same as var.digital_twins_endpoint_eventhubs"
  value       = { for k, v in azurerm_digital_twins_endpoint_eventhub.digital_twins_endpoint_eventhubs : k => v.name }
}

