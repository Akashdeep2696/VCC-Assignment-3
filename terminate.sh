INSTANCE_NAME="Assignment-3-instance"
ZONE="us-central1-a"
PROJECT="VCC Assignment-3"

echo "Stopping and deleting GCP instance..."
gcloud compute instances delete $INSTANCE_NAME --zone $ZONE --project $PROJECT --quiet

echo "GCP instance $INSTANCE_NAME terminated."
