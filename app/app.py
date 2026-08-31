import os
from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/")
def home():
    return jsonify({
        "message": "Hello from 8Byte",
        "status": "ok"
    })

@app.get("/healthz")
def healthz():
    return jsonify({
        "status": "ok"
    })

if __name__ == "__main__":
    port = int(os.getenv("PORT", "8000"))
    app.run(host="0.0.0.0", port=port)
