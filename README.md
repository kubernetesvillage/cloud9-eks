# Cloud9 Instance via Cloudformation

> Cloudformation customised to setup cloud9 instance along with installed script.

## Setup 

- [Create AWS CloudFormation Stack](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/quickcreate?stackName=securitydojo-eks-workshop&templateURL=https://cf-templates-p4sqzd2p5kud-us-east-1.s3.amazonaws.com/cloud9.yaml) (Right-click and select "Open in new tab")

- This CloudFormation stack will take roughly 5 minutes to deploy, and once completed it will create a cloud9 instance with relevant permissions. Thus retrieve the URL for the Cloud9 IDE using below command.
  
```
aws cloudformation describe-stacks --stack-name securitydojo-eks-workshop --query 'Stacks[0].Outputs[?OutputKey==`Cloud9Url`].OutputValue' --output text
```

## Cleaning up


> Make sure to run the respective clean up instructions to de-provision the lab EKS cluster before proceeding.
> eksctl
> Terraform

- Open CloudShell via [AWS Console](https://console.aws.amazon.com/cloudshell/home).

- Run the command to delete the CloudFormation Stack for cloud9 instance.

------

- Reference: https://www.eksworkshop.com
- Credits to [AWS-Samples](https://github.com/aws-samples/eks-workshop-v2/) via [Apache-2.0 license](https://github.com/aws-samples/eks-workshop-v2/?tab=Apache-2.0-1-ov-file#readme)

```
aws cloudformation delete-stack --stack-name securitydojo-eks-workshop
```
