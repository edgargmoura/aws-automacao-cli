FILTER_KEY="grupo"
FILTER_VALUE="automacao-cli"
PROFILE_ID="automacao-cli"

# Capturar os IDs das instâncias em uma variável
INSTANCE_IDS=$(aws ec2 describe-instances \
    --profile $PROFILE_ID \
    --filters "Name=tag:$FILTER_KEY,Values=$FILTER_VALUE" "Name=instance-state-name,Values=running" \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text)

# Verificar se a variável INSTANCE_IDS está vazia
if [ -z "$INSTANCE_IDS" ]; then
    echo "Não existem instâncias rodando com a tag $FILTER_KEY=$FILTER_VALUE"
else
    echo "Parando instância: $INSTANCE_IDS"
    aws ec2 stop-instances --instance-ids $INSTANCE_IDS --output table --profile $PROFILE_ID
fi

