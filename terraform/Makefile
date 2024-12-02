.PHONY: plan apply destroy proxy

# Default target
default: plan

# Initialize Terraform
init:
	terraform init

# Plan the infrastructure changes
plan: init
	terraform plan -var-file="terraform.tfvars"

# Apply the infrastructure changes
apply: init
	terraform apply -var-file="terraform.tfvars"

# Destroy the infrastructure and cleanup
destroy: init
	terraform destroy -var-file="terraform.tfvars"
	@chmod +x scripts/cleanup.sh
	@./scripts/cleanup.sh

# Create SOCKS5 proxy using the droplet's IP
proxy:
	@echo "Starting SOCKS5 proxy on localhost:12345..."
	@IP_ADDRESS=$$(terraform output -raw ip_address) && \
	ssh -D 12345 -N -C root@$$IP_ADDRESS
