variable "digital_twins_endpoint_eventhubs" {
  description = <<EOT
Map of digital_twins_endpoint_eventhubs, attributes below
Required:
    - digital_twins_id
    - eventhub_primary_connection_string
    - eventhub_secondary_connection_string
    - name
Optional:
    - dead_letter_storage_secret
EOT

  type = map(object({
    digital_twins_id                     = string
    eventhub_primary_connection_string   = string
    eventhub_secondary_connection_string = string
    name                                 = string
    dead_letter_storage_secret           = optional(string)
  }))
}

