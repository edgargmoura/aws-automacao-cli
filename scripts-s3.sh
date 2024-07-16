#Listar Buckets
aws s3 ls
#Listar conteúdos do Bucket
aws s3 ls s3://nome-do-bucket
#presign
#Defaul 3600 segundos
aws s3 presign s3://nome-do-bucket/nome-do-arquivo
aws s3 presign s3://nome-do-bucket/nome-do-arquivo --expires-in 10
#CP
aws s3 cp /tmp/backup/arquivo1.txt s3://lab-automacao-cli/ (copiando arquivo de uma pasta local para o bucket do s3)
aws s3 cp s3://lab-automacao-cli/arquivo1.txt /tmp/backup/ (copiando um arquivo do bucket do s3 para uma pasta local)
aws s3 cp /tmp/backup/arquivo1.txt s3://lab-automacao-cli/ --storage-class STANDARD_IA
#SYNC
aws s3 sync /tmp/backup/ s3://lab-automacao-cli/ --storage-class STANDARD_IA --delete --dryrun
aws s3 sync s3://lab-automacao-cli/ /tmp/backup/ --storage-class STANDARD_IA --delete --dryrun