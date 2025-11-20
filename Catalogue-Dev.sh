Source Common.sh
Component=catalogue

nodejs

cp mongo.repo /etc/yum.repos.d/mongo.repo

dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.harshitsompura.online </app/db/master-data.js

