[frontend]
frontend-01 ansible_host=${frontend_public_ip}

[backend]
backend-01 ansible_host=${backend_private_ip}

[backend:vars]
ansible_ssh_common_args='-o ProxyJump=ubuntu@${frontend_public_ip}'

[database]
database-01 ansible_host=${database_private_ip}

[database:vars]
ansible_ssh_common_args='-o ProxyJump=ubuntu@${frontend_public_ip}'
