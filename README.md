# README.md

## Terraform AWS Infrastructure Setup

This Terraform configuration sets up an AWS infrastructure which includes:

1. A VPC with two subnets spanning two different availability zones.
2. An Internet Gateway attached to the VPC.
3. A default route table associated with the VPC.
4. Two security groups, one for allowing HTTPS traffic and another for ECS tasks.
5. An Application Load Balancer (ALB) configured for HTTPS requests.
6. An ECS cluster, task definition, and service running on Fargate.
7. CloudWatch alarm for monitoring high 4xx errors on the ALB.

### Prerequisites

- Terraform installed (version compatible with AWS provider ~> 5.0)
- AWS CLI configured with necessary access permissions.

### Usage

1. **Initialize the Terraform Directory**

   This will initialize the directory, download the AWS provider, and set up the necessary `.terraform` directory.

   ```bash
   terraform init
   ```

2. **Create an Execution Plan**

   Terraform creates an execution plan detailing what will happen when you apply this plan.

   ```bash
   terraform plan
   ```

3. **Apply the Changes**

   This will create the AWS resources as defined in the Terraform configuration files.

   ```bash
   terraform apply
   ```

   Note: Confirm with `yes` when prompted.

4. **Destroy the Infrastructure**

   If you ever need to take down all resources created by this configuration:

   ```bash
   terraform destroy
   ```

   Note: Confirm with `yes` when prompted.

### Important Notes:

- **Security Group for ECS tasks:** The ingress rule for the ECS tasks security group is set to allow traffic from all IP addresses (0.0.0.0/0) on port 80. Ensure this is suitable for your use-case and consider narrowing the scope if necessary.
  
- **SSL Certificate:** The `aws_lb_listener` for HTTPS has a hardcoded ACM certificate ARN. Make sure to replace it with your ACM certificate ARN.
  
- **CloudWatch Alarm:** The CloudWatch alarm is set to trigger if more than 50 4xx errors are detected on the ALB in a span of 5 minutes. Adjust the thresholds and metric settings according to your needs.
  
- **Environment Variables:** Ensure your AWS environment variables or AWS CLI profile is properly set up to deploy resources to `us-east-1`.

### Conclusion

By following this guide, you should be able to set up a basic AWS infrastructure using Terraform, including network resources, load balancing, ECS with Fargate, and monitoring using CloudWatch alarms.