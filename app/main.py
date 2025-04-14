from http.server import BaseHTTPRequestHandler, HTTPServer
from datetime import datetime
import zoneinfo
import json

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            india = zoneinfo.ZoneInfo("Asia/Kolkata")
            timestamp = datetime.now(india).strftime("%Y-%m-%d %H:%M:%S %Z")
            ip = self.client_address[0]
            response = {
                "timestamp": timestamp,
                "ip": ip
            }
            response_bytes = json.dumps(response).encode('utf-8')

            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Content-Length', str(len(response_bytes)))
            self.end_headers()
            self.wfile.write(response_bytes)
        else:
            self.send_response(404)
            self.end_headers()

if __name__ == '__main__':
    server = HTTPServer(('0.0.0.0', 8080), SimpleHandler)
    print("Serving on port 8080...")
    server.serve_forever()
