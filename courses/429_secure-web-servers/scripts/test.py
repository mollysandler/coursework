from flask import Flask, jsonify
import requests
import threading
import time

app = Flask(__name__)

server_status = 'OK'

submit_url = 'https://team8.csc429.io/submit.php'

def send_fake_order():
    global server_status
    while True:
        data = {
            'firstName': 'test',
            'lastName': 'test',
            'phoneNumber': 'test',
            'item': 'Owl'
        }
        try:
            response = requests.post(submit_url, data=data)
            if response.status_code == 200 and "Order Submitted Successfully" in response.text:
                server_status = 'OK'
            else:
                server_status = 'ERROR'
        except requests.RequestException:
            server_status = 'ERROR'

        time.sleep(60)

@app.route('/status')
def status():
    if server_status == 'OK':
        return jsonify({'status': 'All systems operational'}), 200
    else:
        return jsonify({'status': 'Server error detected'}), 500

if __name__ == '__main__':
    threading.Thread(target=send_fake_order, daemon=True).start()
    app.run(host='0.0.0.0', port=5000)