#!/bin/bash

echo 'Input project name'

read PROJECT_NAME

sleep 1

echo 'Input the instance name'

read INSTANCE_NAME

sleep 1

echo 'Input machine type'

read INSTANCE_TYPE

sleep 1

echo 'Input machine zone'

read INSTANCE_ZONE

sleep 1

echo "REVIEW YOUR CODE: gcloud compute instances create $INSTANCE_NAME \
 --machine-type=$INSTANCE_TYPE \
  --project=$PROJECT_NAME \
  --zone=$INSTANCE_ZONE \ 
  --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/debian-cloud/global/images/debian-11-bullseye-v20230411,mode=rw,size=10,type=projects/$PROJECT_NAME/zones/$INSTANCE_ZONE/diskTypes/pd-balanced"


sleep 1

echo "Your code is ok? \
      [1] yes \
      [2] no
"

read CHECK

if [ $CHECK -eq 1 ]; 
then
  gcloud compute instances create $INSTANCE_NAME --machine-type=$INSTANCE_TYPE --project=$PROJECT_NAME --zone=$INSTANCE_ZONE --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/debian-cloud/global/images/debian-11-bullseye-v20230411,mode=rw,size=10,type=projects/$PROJECT_NAME/zones/$INSTANCE_ZONE/diskTypes/pd-balanced

else 
  ./provide-vm.sh
fi