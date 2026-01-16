# user data to deploy app
#!/bin/bash

sleep 15 

cd /home/ubuntu

cd nodejs2-sparta-test-app-2025

cd app

sudo npm install

pm2 start app.js