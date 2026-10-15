
from flask import Flask, jsonify, Response, request
from prometheus_client import Counter, generate_latest
import os

app = Flask(__name__)

# Prometheus metric to count API requests
REQUEST_COUNT = Counter(
    "api_requests_total",
    "Total number of API requests",
    ["method", "endpoint", "status"]
)


@app.after_request
def record_request(response):
    # Do not count requests to the metrics endpoint itself
    if request.path != "/metrics":
        REQUEST_COUNT.labels(
            method=request.method,
            endpoint=request.path,
            status=str(response.status_code)
        ).inc()

    return response


@app.route("/api/environment")
def environment():
    return jsonify({
        "message": "Backend is running successfully",
        "environment": os.getenv("ENVIRONMENT", "unknown")
    })


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy"
    })


@app.route("/metrics")
def metrics():
    return Response(
        generate_latest(),
        mimetype="text/plain"
    )


if __name__ == "__main__":
    from flask import request
    app.run(host="0.0.0.0", port=5000)
