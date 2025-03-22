import psutil
import time
import os

THRESHOLD = 75
def monitor_resources():
        while True:
                cpu_usage = psutil.cpu_percent(interval=1)
                memory_usage = psutil.virtual_memory().percent
                disk_usage = psutil.disk_usage('/').percent

                print(f"CPU Usage: {cpu_usage}%")
                print(f"MEMORY Usage: {memory_usage}%")
                print(f"DISK Usage: {disk_usage}%")

                if cpu_usage > THRESHOLD or memory_usage > THRESHOLD or disk_usage > THRESHOLD:

                        print("Resource usage exceeds the threshold. Triggering scale-up process.")
                        os.system("gcloud compute instance-groups managed resize cloud-instance-group --size=2 --zone=us-central1-a")

                time.sleep(5)
                
monitor_resources()
