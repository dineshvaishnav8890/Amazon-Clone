🔹 DEVOPS INTERNSHIP – TASK 9
Docker Basics – Containerizing an Application



🟢 STEP 1: Install Docker



Start & Enable Docker





🟢 STEP 2: Create Project Structure



🟢 STEP 3: Create Simple Application



🟢 STEP 4: Write Dockerfile


🟢 STEP 5: Build Docker Image
docker build -t docker-task-9-app .



🟢 STEP 6: Run Docker Container
docker run -d -p 5000:5000 --name task9-container docker-task-9-app




🟢 STEP 7: Inspect Containers & Logs
Running containers
docker ps



🟢 STEP 8: Stop & Cleanup
docker stop task9-container
docker rm task9-container
docker rmi docker-task-9-app




