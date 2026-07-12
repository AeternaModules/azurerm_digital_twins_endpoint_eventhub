variable "digital_twins_endpoint_eventhubs" {
  description = <<EOT
Map of digital_twins_endpoint_eventhubs, attributes below
Required:
    - digital_twins_id
    - eventhub_primary_connection_string
    - eventhub_primary_connection_string_key_vault_id (alternative to eventhub_primary_connection_string - read from Key Vault instead)
    - eventhub_primary_connection_string_key_vault_secret_name (alternative to eventhub_primary_connection_string - read from Key Vault instead)
    - eventhub_secondary_connection_string
    - eventhub_secondary_connection_string_key_vault_id (alternative to eventhub_secondary_connection_string - read from Key Vault instead)
    - eventhub_secondary_connection_string_key_vault_secret_name (alternative to eventhub_secondary_connection_string - read from Key Vault instead)
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
  # --- Unconfirmed validation candidates, derived from azurerm_digital_twins_endpoint_eventhub's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.DigitalTwinsInstanceName] !ok
  # path: name
  #   condition: length(value) >= 3
  #   message:   [from validate.DigitalTwinsInstanceName: invalid when len(value) < 3]
  #   source:    [from validate.DigitalTwinsInstanceName: invalid when len(value) < 3]
  # path: name
  #   condition: length(value) <= 63
  #   message:   [from validate.DigitalTwinsInstanceName: invalid when len(value) > 63]
  #   source:    [from validate.DigitalTwinsInstanceName: invalid when len(value) > 63]
  # path: name
  #   source:    [from validate.DigitalTwinsInstanceName] !regexp.MustCompile(`^[A-Za-z0-9][A-Za-z0-9-]+[A-Za-z0-9]$`).MatchString(v)
  # path: digital_twins_id
  #   source:    [from digitaltwinsinstance.ValidateDigitalTwinsInstanceID] !ok
  # path: digital_twins_id
  #   source:    [from digitaltwinsinstance.ValidateDigitalTwinsInstanceID] err != nil
}

