# Cloud9 and VSCode Instance Setup via CloudFormation

This repository contains CloudFormation templates to quickly set up Cloud9 and VSCode instances in your AWS environment. These instances are pre-configured with necessary permissions and are ready to be used for EKS-related workshops or development.

---

## Quick-Launch Links for Cloud9 and VSCode

> [eksworkshop reference](https://www.eksworkshop.com/docs/introduction/setup/your-account/)
> 
Use the AWS CloudFormation quick-create links below to launch the desired environment in your preferred AWS region.

| Region         | Cloud9 Link                         | VSCode            |
|----------------|-------------------------------------|---------------------------------------|
| **us-east-1**  | [Launch](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/quickcreate?stackName=securitydojo-eks-workshop&templateURL=https://cf-templates-p4sqzd2p5kud-us-east-1.s3.amazonaws.com/cloud9.yaml)  | XX  |
| **us-west-2**  | XX | [Launch](https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/quickcreate?stackName=securitydojo-eks-workshop&templateURL=https://cf-templates-p4sqzd2p5kud-us-east-1.s3.amazonaws.com/eks-workshop-vscode.yaml) |


---

## Setup Instructions

1. **Choose your Region**: Use the table above to pick your region (e.g., **us-east-1** or **us-west-2**) and launch the CloudFormation stack for Cloud9 or VSCode.
   
2. **Monitor the Stack Creation**: The stack will take about 5 minutes to complete.

3. **Accessing the Environment**: Once the stack creation is complete, you can retrieve the Cloud9 or VSCode URL using the following command.
   
   > Replace `Cloud9Url` with `VSCodeUrl` for VSCode instance.
   
   - For cloud9

    ```bash
    aws cloudformation describe-stacks --stack-name securitydojo-eks-workshop --query 'Stacks[0].Outputs[?OutputKey==`Cloud9Url`].OutputValue' --output text
    ```
   - For VSCodeUrl

    ```bash
    aws cloudformation describe-stacks --stack-name securitydojo-eks-workshop --query 'Stacks[0].Outputs[?OutputKey==`Cloud9Url`].OutputValue' --output text
    ```
     
    
4. Open the URL & follow next steps from [terraform-eks](https://github.com/kubernetesvillage/terraform-eks).
---

## Cleanup

To avoid unnecessary costs, be sure to delete the CloudFormation stacks and any created AWS resources once you're finished.

- To delete the Cloud9 or VSCode instance, run the following command:

    ```bash
    aws cloudformation delete-stack --stack-name securitydojo-eks-workshop
    ```

- Follow the cleanup instructions for the EKS resources, either through `eksctl` or Terraform.

---

## License

- This repository uses code from the [AWS EKS Workshop](https://github.com/aws-samples/eks-workshop-v2/), licensed under the Apache-2.0 License.
- The CloudFormation templates have been adapted for use in the **peachycloudsecurity** EKS workshop.
- Credits: [AWS-Samples](https://github.com/aws-samples/eks-workshop-v2/) under the [Apache-2.0 license](https://github.com/aws-samples/eks-workshop-v2/?tab=Apache-2.0-1-ov-file#readme)

