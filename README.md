
# Terraform "Hello Technet" Demo

This repo contains the code that deploys an AWS EC2 instance using Terraform with the following criteria:

1. Use a free AWS Account

2. Use terraform CLI to provision an AWS EC2 instance with httpd web services listening on port 8080. Use the following EC2 specification:

        ami = plain Ubuntu 18.04 AMI
        Instance type = “t2.micro”
        Instance name = “terraform-demo”

3. Create a sample html page with “Hello Technet”  header for the web services

4. Create a security group (firewall rules) to allow any source to the target web services on port 8080

<br />
<br />

## How to Run the Demo

1. Install [Terraform](https://www.terraform.io/) in any Linux enviornment such as Ubuntu 20.04

2. Set the following AWS credentials as the environment variables in the CLI with values provided by the candidate:

        AWS_ACCESS_KEY_ID
        AWS_SECRET_ACCESS_KEY

3. clone this repo into a local folder

4. `cd` into the demo folder

5. Run `terraform init`

6. Run `terraform apply`

7. After successful deployment, run `terraform show` to get the public IP address or URL.

8. Use the obtained URL or IP address to access the "Hello Technet" webpage in any browser or using `curl`

9. After testing, run `terraform destroy` to delete all resources. This may takes 2-3 minutes.

9. Notify the candidate so he can clean up the AWS account
