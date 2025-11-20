
nodejs(){
  Color=\\e[31m
  CEnd=\\e[0m

echo -e ${Color} NodeJS installtion ${CEnd}
dnf module disable nodejs -y >> /var/tmp/roboshop.log
dnf module enable nodejs:20 -y >> /var/tmp/roboshop.log
dnf install nodejs -y >> /var/tmp/roboshop.log

cp ${Component}.service /etc/systemd/system/${Component}.service


echo -e ${Color} Curl Files download ${CEnd}
useradd roboshop >> /var/tmp/roboshop.log
mkdir /app >> /var/tmp/roboshop.log
curl -L -o /tmp/${Component}.zip https://roboshop-artifacts.s3.amazonaws.com/${Component}-v3.zip >> /var/tmp/roboshop.log
cd /app
unzip /tmp/${Component}.zip >> /var/tmp/roboshop.log

echo -e ${Color} npm install ${CEnd}
cd /app
npm install >> /var/tmp/roboshop.log

}

systemService(){
  echo -e ${Color} system service setup and restart  ${CEnd}

  systemctl daemon-reload >> /var/tmp/roboshop.log
  systemctl enable ${Component} >> /var/tmp/roboshop.log
  systemctl restart ${Component} >> /var/tmp/roboshop.log

}

JavaIns(){
   echo -e ${Color} maven installtion  ${CEnd}
  dnf install maven -y >> /var/tmp/roboshop.log
  useradd roboshop >> /var/tmp/roboshop.log

  cp ${Component}.service /etc/systemd/system/${Component}.service >> /var/tmp/roboshop.log

echo -e ${Color} package installtion  ${CEnd}
  mkdir /app >> /var/tmp/roboshop.log
  curl -L -o /tmp/${Component}.zip https://roboshop-artifacts.s3.amazonaws.com/${Component}-v3.zip >> /var/tmp/roboshop.log
  cd /app >> /var/tmp/roboshop.log
  unzip /tmp/${Component}.zip >> /var/tmp/roboshop.log
  cd /app >> /var/tmp/roboshop.log
  mvn clean package >> /var/tmp/roboshop.log
  mv target/${Component}-1.0.jar ${Component}.jar >> /var/tmp/roboshop.log
}