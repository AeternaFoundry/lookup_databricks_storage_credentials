data "databricks_storage_credentials" "storage_credentials_lookup" {
  for_each = var.storage_credentials_lookup

  names = each.value.names

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }
}

