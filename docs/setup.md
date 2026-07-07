- RHEL 9 (DevOps VM on VMware)

## Installed Tools

| Tool | Version |
|------|---------|
| Terraform | v1.15.7 |
| AWS CLI | v2.35.15 |
| Ansible | Core 2.14.18 |
| Python | 3.9.21 |
| Git | 2.47.1 |

## Verification Commands

```bash
terraform version
aws --version
ansible --version
python3 --version
git --version
```


## AWS Authentication

- Created IAM User: terraform
- Console Access: Disabled
- IAM Group: terraform-admins
- Attached Policy: AdministratorAccess
- Configured AWS CLI using `aws configure`
- Verified credentials using:

```bash
aws sts get-caller-identity
```


