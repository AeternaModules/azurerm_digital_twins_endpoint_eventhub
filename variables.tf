variable "digital_twins_endpoint_eventhubs" {
  description = <<EOT
Map of digital_twins_endpoint_eventhubs, attributes below
Required:
    - digital_twins_id
    - eventhub_primary_connection_string
    - eventhub_primary_connection_string_key_vault_id (optional, alternative to eventhub_primary_connection_string)
    - eventhub_primary_connection_string_key_vault_secret_name (optional, alternative to eventhub_primary_connection_string)
    - eventhub_secondary_connection_string
    - eventhub_secondary_connection_string_key_vault_id (optional, alternative to eventhub_secondary_connection_string)
    - eventhub_secondary_connection_string_key_vault_secret_name (optional, alternative to eventhub_secondary_connection_string)
    - name
Optional:
    - dead_letter_storage_secret
    - dead_letter_storage_secret_key_vault_id (alternative to dead_letter_storage_secret - read from Key Vault instead)
    - dead_letter_storage_secret_key_vault_secret_name (alternative to dead_letter_storage_secret - read from Key Vault instead)
EOT

  type = map(object({
    digital_twins_id                                           = string
    eventhub_primary_connection_string                         = string
    eventhub_primary_connection_string_key_vault_id            = optional(string)
    eventhub_primary_connection_string_key_vault_secret_name   = optional(string)
    eventhub_secondary_connection_string                       = string
    eventhub_secondary_connection_string_key_vault_id          = optional(string)
    eventhub_secondary_connection_string_key_vault_secret_name = optional(string)
    name                                                       = string
    dead_letter_storage_secret                                 = optional(string)
    dead_letter_storage_secret_key_vault_id                    = optional(string)
    dead_letter_storage_secret_key_vault_secret_name           = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.digital_twins_endpoint_eventhubs : (
        length(v.name) >= 3
      )
    ])
    error_message = "[from validate.DigitalTwinsInstanceName: invalid when len(value) < 3]"
  }
  validation {
    condition = alltrue([
      for k, v in var.digital_twins_endpoint_eventhubs : (
        length(v.name) <= 63
      )
    ])
    error_message = "[from validate.DigitalTwinsInstanceName: invalid when len(value) > 63]"
  }
  validation {
    condition = alltrue([
      for k, v in var.digital_twins_endpoint_eventhubs : (
        length(v.eventhub_primary_connection_string) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.digital_twins_endpoint_eventhubs : (
        length(v.eventhub_secondary_connection_string) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.digital_twins_endpoint_eventhubs : (
        v.dead_letter_storage_secret == null || (length(v.dead_letter_storage_secret) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

