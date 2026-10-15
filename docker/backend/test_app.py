
from app import app


def test_health_endpoint():
    with app.test_client() as client:
        response = client.get("/health")

        assert response.status_code == 200
        assert response.get_json()["status"] == "healthy"


def test_environment_endpoint():
    with app.test_client() as client:
        response = client.get("/api/environment")

        assert response.status_code == 200

        data = response.get_json()
        assert data["message"] == "Backend is running successfully"
        assert "environment" in data


def test_metrics_endpoint():
    with app.test_client() as client:
        client.get("/health")
        response = client.get("/metrics")

        assert response.status_code == 200
        assert b"api_requests_total" in response.data
