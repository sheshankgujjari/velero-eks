
#!/bin/bash
 
accountId=157557265942
# To check if access key is setup in your system 

if ! grep -q aws_access_key_id ~/.aws/config; then      # grep -q  Turns off Writing to standard output
   if ! grep -q aws_access_key_id ~/.aws/credentials; then 
      echo "AWS config not found or CLI is not installed"
      exit 1
    fi 
fi


# read command will prompt you to enter the name of IAM user you wish to create 

read -r -p "Enter the username to create": username


# Using AWS CLI Command create IAM user 

aws iam create-user --user-name "${username}" --output json

# Here we are creating access and secret keys and then using query and storing the values in credentials

credentials=$(aws iam create-access-key --user-name "${username}" --query 'AccessKey.[AccessKeyId,SecretAccessKey]'  --output text)


aws iam create-group --group-name Velero-Admin

aws iam add-user-to-group --user-name "${username}" --group-name Velero-Admin

aws iam create-policy -policy-name velero-iam-policy -policy-document /tmp/velero-eks/velero-iam-policy.json

aws iam attach-group-policy --group-name Velero-Admin --policy-arn arn:aws:iam::${accountId}:policy/velero-backup



# cut command formats the output with correct coloumn.
access_key_id=$(echo ${credentials} | cut -d " " -f 1)
secret_access_key=$(echo ${credentials} | cut --complement -d " " -f 1)

# echo command will print on the screen 

echo "The Username "${username}" has been created"
echo "The access key ID  of "${username}" is $access_key_id "
echo "The Secret access key of "${username}" is $secret_access_key "

