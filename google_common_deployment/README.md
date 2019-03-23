# fscoding deployment with terraform 

Please run following command before you run terraform scripts 
```
kubectl create secret generic fscoding-secret  --from-literal=secret='mysecret' -n prod

kubectl create secret docker-registry nexus-creds --docker-server="35.225.18.116:8085"   --docker-username="admin" --docker-password="MYPASSWORD" --docker-email=myemail@gmail.com -n prod

 kubectl create secret generic mysql-pass --from-literal=MYSQL_PASSWORD='MYPASSWORD' -n prod
```

## Deploy the fscoding to cluster 
```
terraform init
terraform apply -var-file=fscoding.tfvars
```


## To destroy the fscoding
```
terraform destroy -var-file=fscoding.tfvars
```