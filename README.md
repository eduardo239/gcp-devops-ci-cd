# GCP VPC

This project provides infrastructure as code (IaC) for deploying a Google Cloud Platform (GCP) Virtual Private Cloud (VPC) network and associated resources using Terraform.

## Configuration

The project uses variables for customization, including:

- `region` (default: us-central1)
- `zone` (default: us-central1-a)
- `vpc_name` (default: tf-vpc-network)
- `services` to enable (compute, storage, resource manager)
- Subnet configurations (name, CIDR ranges)

## Security Scanning

### Checkov scan

Run security scans on your Terraform code using Checkov:

```bash
checkov -d .
```
