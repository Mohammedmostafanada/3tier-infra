[frontend]
frontend ansible_host=${frontend_public_ip}

[backend]
backend ansible_host=${backend_private_ip}

[database]
database ansible_host=${database_private_ip}
