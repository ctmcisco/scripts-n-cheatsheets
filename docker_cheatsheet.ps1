docker search {{image_name}}
docker logs {{container_name_or_id}} 
docker exec -it {{container_name_or_id}} PowerShell 
docker cp {{local_source_file}} {{container_name_or_id}}:{{destination_path_in_container}}

docker stop $(docker ps -a -q)

#windows container
docker inspect --format "{{ .ID }} - {{ .Name }} - {{ .NetworkSettings.Networks.nat.IPAddress }}" {{container_name_or_id}}
docker inspect {{container_name_or_id}} | ConvertFrom-Json | select -ExpandProperty SyncRoot | select -expand netWorkSettings | select -ExpandProperty Networks | Select -ExpandProperty nat | Select IPAddress 


#linux container on windows
docker inspect --format "{{ .ID }} - {{ .Name }} - {{ .NetworkSettings.Networks.bridge.IPAddress }}" {{container_name_or_id}}
docker inspect {{container_name_or_id}} | ConvertFrom-Json | select -ExpandProperty SyncRoot | select -expand netWorkSettings | select -ExpandProperty Networks | Select -ExpandProperty bridge | Select IPAddress

#up and down creates/removes the containers / network / etc
docker-compose [up|down] [start|stop]


#building containers
docker build . -t {{image_name}}

#--------------------------------------------------------------------------------------------
#aks

az aks get-credentials --resource-group {{rg-name}} --name {{aks-name}}

#--------------------------------------------------------------------------------------------
#kubernetes

kubectl get {{object_type}} | all

kubectl describe {{object}}
kubectl logs {{pod_name}}