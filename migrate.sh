INSTANCE_NAME="assignment-3-instance"
ZONE="us-central1-a"
PROJECT="vcc-assignment-3-454116"

echo "Checking if instance already exists..."
if gcloud compute instances describe $INSTANCE_NAME --zone $ZONE --project $PROJECT --quiet; then
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

echo "Transferring app to GCP instance..."
gcloud compute scp app.py $INSTANCE_NAME:/home/ubuntu/ --zone $ZONE --project $PROJECT

echo "SSH into GCP instance and set up the app..."
gcloud compute ssh $INSTANCE_NAME --zone $ZONE --project $PROJECT --command "
    sudo apt update &&
    sudo apt install -y python3-pip &&
    pip3 install flask &&
    nohup python3 /home/ubuntu/app.py > /dev/null 2>&1 &
"

echo "Your app is now running on GCP!"
