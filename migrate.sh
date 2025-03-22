INSTANCE_NAME="Assignment-3-instance"
ZONE="us-central1-a"
PROJECT="VCC Assignment-3"

echo "Checking if instance already exists..."
if gcloud compute instances describe $INSTANCE_NAME --zone $ZONE --project $PRO>
    echo "Instance already running, skipping creation."
else
    echo "Creating a new GCP instance..."
    gcloud compute instances create $INSTANCE_NAME \
        --machine-type e2-micro \
        --image-family debian-11 \
        --image-project debian-cloud \
        --tags http-server \
        --zone $ZONE \
        --project $PROJECT
fi

echo "Transferring Flask app to GCP instance..."
gcloud compute scp app.py $INSTANCE_NAME:/home/ubuntu/ --zone $ZONE --project $>
