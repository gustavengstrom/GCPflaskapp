from flask import Flask
from google.cloud import secretmanager

app = Flask(__name__)


@app.route("/")
def get_secret():
    try:
        # Initialize the Secret Manager client
        client = secretmanager.SecretManagerServiceClient()

        # Replace 'your-secret-id' with the ID of your secret
        name = f"projects/317848048979/secrets/TEST_SECRET/versions/1"

        # Access the secret
        response = client.access_secret_version(request={"name": name})
        secret_payload = response.payload.data.decode("UTF-8")
    except Exception as e:
        secret_payload = f"Error: {e}"

    return f"The secret value is: {secret_payload}"


if __name__ == "__main__":
    # docker build -t flask-app .
    # docker run --name flask-app -p 8081:8081 -v ./credentials.json:/secrets/credentials.json -e GOOGLE_APPLICATION_CREDENTIALS=/secrets/credentials.json flask-app

    app.run(host="0.0.0.0", port=8081)
