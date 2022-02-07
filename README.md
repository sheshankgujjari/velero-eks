# velero-eks
Velero backup installation


### Prerequisites

1. Create S3 bucket by executing ./create-s3.sh file. It will ask you to enter the s3 bucket information (Versioning is not enabled it is plain vanilla s3 bucket)

2. Create IAM user, group and policy by executing create-iam-user.sh. For now hardcoded accountId and it will prompt for iam username.

3. The above script will output the credentials, add the IAM user credentials in the "velero-credentials" file of this repo on your local



### Installing Velero

1. Install Velero by executing ./install-velero.sh file


### Test Velero

1. Execute ./velero-backup-test.sh

2. Verify the same in S3 bucket


## Restore Test

1. Execute ./velero-restore-test.sh

2. Verify the same using kubectl commands


