resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory/inventory.ini"

  content = templatefile(
    "${path.module}/../ansible/inventory/inventory.tpl",
    {
      frontend_public_ip  = module.compute.frontend_public_ip
      backend_private_ip  = module.compute.backend_private_ip
      database_private_ip = module.compute.database_private_ip
    }
  )
}
