INSTANCE_NAME="dev-production"
INSTANCE_TYPE="t3.micro"
SUBNET_ID="subnet-050d251685f8d9e31"
COUNT_INSTANCES="3"
IMAGE_ID="ami-0b72821e2f351e396"
AWS_REGION="us-east-1"
SECURITY_GROUP_ID="sg-0c8187936c0f2de45"
KEY_NAME="cursoautomacaokey"
FILTER_KEY="webserver"
FILTER_VALUE="production"
PROFILE_ID="automacao-cli"

aws ec2 run-instances --instance-type $INSTANCE_TYPE \
    --subnet-id $SUBNET_ID \
    --count $COUNT_INSTANCES \
    --image-id $IMAGE_ID \
    --region $AWS_REGION \
    --security-group-ids $SECURITY_GROUP_ID \
    --key-name $KEY_NAME \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='$INSTANCE_NAME'},{Key='$FILTER_KEY',Value='$FILTER_VALUE'}]' \
    --output json --profile $PROFILE_ID