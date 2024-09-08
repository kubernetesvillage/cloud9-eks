# Cloud9 Instance via Cloudformation

> Cloudformation customised to setup cloud9 instance along with installed script.

## Setup 

- [Create AWS CloudFormation Stack](https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/quickcreate?stackName=securitydojo-eks-workshop&templateURL=https://cf-templates-p4sqzd2p5kud-us-east-1.s3.amazonaws.com/eks-workshop-vscode.yaml) (Right-click and select "Open in new tab")

- This CloudFormation stack will take roughly 5 minutes to deploy, and once completed it will create a instance with relevant permissions. Thus retrieve the URL for the IDE using below command.
  
```
aws cloudformation describe-stacks --stack-name securitydojo-eks-workshop --query 'Stacks[0].Outputs[?OutputKey==`Cloud9Url`].OutputValue' --output text
```

## Cleaning up


> Make sure to run the respective clean up instructions to de-provision the lab EKS cluster before proceeding.
> eksctl
> Terraform

- Open CloudShell via [AWS Console](https://console.aws.amazon.com/cloudshell/home).

- Run the command to delete the CloudFormation Stack for cloud9 instance.

## License

- This repository includes code from the [AWS EKS Workshop](https://github.com/aws-samples/eks-workshop-v2/), which is licensed under the Apache-2.0 License.
- All original authors are credited, and modifications made here are documented in accordance with the Apache-2.0 License. This customized CloudFormation template has been adapted for use in the peachycloudsecurity EKS workshop.
- Reference: https://www.eksworkshop.com
    Credits: [AWS-Samples](https://github.com/aws-samples/eks-workshop-v2/) under the [Apache-2.0 license](https://github.com/aws-samples/eks-workshop-v2/?tab=Apache-2.0-1-ov-file#readme)

```
aws cloudformation delete-stack --stack-name securitydojo-eks-workshop
```
