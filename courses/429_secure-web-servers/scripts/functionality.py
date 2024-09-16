#this file is located in the Guacamole instance
import requests

url = "https://team8.csc429.io/submit.php"
headers = {"Content-Type" : "application/x-www-form-urlencoded"}
data = {"firstName": "test",
        "lastName": "test",
        "phoneNumber": "1231231234",
        "item": "Owl"}
response = requests.post(url, headers=headers, data=data)
expected1 = "Order Submitted Successfully. Your transaction ID is: fde88-6c0fa\n"
#Webhook of my channel. Click on edit channel --> Webhooks --> Creates webhook
mUrl = "https://discord.com/api/webhooks/1232436485899161614/3u31gLZ975QZe3EuIEYPDgrbyDpOklHBH_Up5PG5ZJzR72WdmjkN7dJzP8PKnIqn9lfa"
if response.status_code != 200 or expected1 != response.text:
    data = {"content": 'submission failed with number 1231231234! Someone needs to check the host'}
    response = requests.post(mUrl, json=data)

