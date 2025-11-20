
nodejs(){

dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

cp ${Component}.service /etc/systemd/system/${Component}.service

useradd roboshop
mkdir /app
curl -L -o /tmp/${Component}.zip https://roboshop-artifacts.s3.amazonaws.com/${Component}-v3.zip
cd /app
unzip /tmp/${Component}.zip

cd /app
npm install

systemctl daemon-reload
systemctl enable ${Component}
systemctl restart ${Component}

}