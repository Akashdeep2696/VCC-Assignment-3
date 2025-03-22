import psutil
import time

while True:
        cpu_usage = psutil.cpu_percent(interval=1)
        memory_usage = psutil.virtual_memory().percent
        disk_usage = psutil.disk_usage('/').percent

        print(f"CPU Usage: {cpu_usage}%")
        print(f"MEMORY Usage: {memory_usage}%")
        print(f"DISK Usage: {disk_usage}%")

        if cpu_usage > 75 or memory_usage > 75 or disk_usage > 75:

                print("Resource usage exceed 75%")

        time.sleep(10)
