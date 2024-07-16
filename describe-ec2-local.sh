FILTER_KEY="webserver"
FILTER_VALUE="production"
PROFILE_ID="automacao-cli"

aws ec2 describe-instances \
    --filters "Name=tag:$FILTER_KEY,Values=$FILTER_VALUE" \
    --query "Reservations[*].Instances[*].[InstanceId,ImageId,State.Name,Tags[?Key=='$FILTER_KEY'].Value | [0]]" --output table \
    --profile $PROFILE_ID
