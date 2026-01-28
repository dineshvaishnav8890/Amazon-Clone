🚀 TASK 8 (Extended): CI/CD Deployment to AWS S3 using GitHub Actions
🎯 Goal

Store code on GitHub

Automatically deploy to AWS S3

Use GitHub Actions CI/CD

No paid tools ❌


🧩 ARCHITECTURE (Simple Flow)
Developer Push Code
        ↓
 GitHub Repository
        ↓
 GitHub Actions (CI/CD)
        ↓
 AWS S3 Bucket (Static Website Hosting)




 🔹 STEP 1: Create S3 Bucket (Static Website)
1️⃣ AWS Console → S3 → Create bucket
Setting	Value
Bucket name	task-8-github-actions-s3
Region	Any (ex: ap-south-1)
Block Public Access	❌ Disable
Acknowledge warning	✅ Yes

👉 Create bucket

2️⃣ Enable Static Website Hosting

S3 → Bucket → Properties

Scroll → Static website hosting

Enable

Index document:

index.html


Save changes

3️⃣ Bucket Policy (Public Access)

Go to Permissions → Bucket Policy

Replace BUCKET_NAME with your bucket name:

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::BUCKET_NAME/*"
    }
  ]
}


✅ Your website is now publicly accessible.





3️⃣ Save Credentials

You’ll get:

Access Key ID

Secret Access Key

⚠️ Save safely (we’ll use them as GitHub Secrets)




🔹 STEP 4: Add GitHub Secrets

GitHub Repo → Settings → Secrets and variables → Actions

Add these:

Secret Name	Value
AWS_ACCESS_KEY_ID	(from IAM)
AWS_SECRET_ACCESS_KEY	(from IAM)



🔹 STEP 5: GitHub Actions Workflow (Deployment)
📄 .github/workflows/deploy.yml




name: Deploy to S3 Bucket

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v3

    - name: Configure AWS Credentials
      uses: aws-actions/configure-aws-credentials@v2
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: us-east-1  # Or your region

    - name: Deploy to S3
      run: aws s3 sync . s3://blog.dinesh.icu --delete




      ✅ Result

GitHub Actions → Green ✔

Files uploaded to S3 automatically

Website LIVE 🎉

📸 Take deployment success screenshot

🔹 STEP 7: Access Your Website

S3 → Bucket → Properties → Static Website Hosting

Website URL:

http://task-8-github-actions-s3.s3-website-ap-south-1.amazonaws.com


