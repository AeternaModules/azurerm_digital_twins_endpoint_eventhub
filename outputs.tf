output "digital_twins_endpoint_eventhubs" {
  description = "All digital_twins_endpoint_eventhub resources"
  value       = azurerm_digital_twins_endpoint_eventhub.digital_twins_endpoint_eventhubs
  sensitive   = true
}
output "digital_twins_endpoint_eventhubs_dead_letter_storage_secret" {
  description = "List of dead_letter_storage_secret values across all digital_twins_endpoint_eventhubs"
  value       = [for k, v in azurerm_digital_twins_endpoint_eventhub.digital_twins_endpoint_eventhubs : v.dead_letter_storage_secret]
  sensitive   = true
}
output "digital_twins_endpoint_eventhubs_digital_twins_id" {
  description = "List of digital_twins_id values across all digital_twins_endpoint_eventhubs"
  value       = [for k, v in azurerm_digital_twins_endpoint_eventhub.digital_twins_endpoint_eventhubs : v.digital_twins_id]
}
output "digital_twins_endpoint_eventhubs_eventhub_primary_connection_string" {
  description = "List of eventhub_primary_connection_string values across all digital_twins_endpoint_eventhubs"
  value       = [for k, v in azurerm_digital_twins_endpoint_eventhub.digital_twins_endpoint_eventhubs : v.eventhub_primary_connection_string]
  sensitive   = true
}
output "digital_twins_endpoint_eventhubs_eventhub_secondary_connection_string" {
  description = "List of eventhub_secondary_connection_string values across all digital_twins_endpoint_eventhubs"
  value       = [for k, v in azurerm_digital_twins_endpoint_eventhub.digital_twins_endpoint_eventhubs : v.eventhub_secondary_connection_string]
  sensitive   = true
}
output "digital_twins_endpoint_eventhubs_name" {
  description = "List of name values across all digital_twins_endpoint_eventhubs"
  value       = [for k, v in azurerm_digital_twins_endpoint_eventhub.digital_twins_endpoint_eventhubs : v.name]
}

