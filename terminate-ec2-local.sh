FILTER_KEY="grupo"
FILTER_VALUE="automacao-cli"
PROFILE_ID="automacao-cli"

INSTANCE_IDS=$(aws ec2 describe-instances \
    --profile $PROFILE_ID \
    --filters "Name=tag:$FILTER_KEY,Values=$FILTER_VALUE" \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text)

if [ -z "$INSTANCE_IDS" ]; then
    echo "Não existem instâncias com a tag $FILTER_KEY=$FILTER_VALUE"
else
    echo "Terminando instância: $INSTANCE_IDS"
    aws ec2 terminate-instances --instance-ids $INSTANCE_IDS --output table --profile $PROFILE_ID
fi