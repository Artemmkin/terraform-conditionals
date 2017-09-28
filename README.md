### Example of IF-ELSE conditional in Terraform

1. Use statis IP for your instance:
```bash
terraform apply -var 'use_static_ip=1' -auto-approve=false
```

2. Use ephemeral IP for your instance:
```bash
terraform apply -var 'use_static_ip=0' -auto-approve=false
```
