# Amazon S3 Static Website Hosting With Terraform

### Overview

Amazon S3 is an object storage service offered by Amazon Web Services. This services offer unlimited storage capacity, highly durable and available. Apart from that we can also host a static website using Amazon S3. In this project I will be using Terraform to deploy a static website in Amazon S3.

### Prerequisites

1. This project require an index file(index.html) and resources folder(assets) to be hosted in Amazon S3. I have uploaded the files in this repository too.

2. Terraform need to be install on local machine

3. AWS CLI need to be install to setup AWS access key


### 1. Define a provider

I created a separate file to define my provider. In this project it's AWS.

```
provider "aws" {
  region = "ap-southeast-1"
}
```
Refer below link for the latest Terraform documentation

https://registry.terraform.io/providers/hashicorp/aws/latest

Once the file created and saved, run below command from the command prompt. This grabs the plugins and sets things up so Terraform can hook into AWS (or any other provider you defined in the code) and handle your infrastructure.

```
terraform init
```
### 2. Setup Amazon S3 bucket

To specifically configure my S3 bucket for static website hosting, I've created a main.tf file and defined the necessary attributes.

### 3. Creating a bucket;

```
resource "aws_s3_bucket" "hanif_webbucket" {
    bucket = "hanif-static-web"
  
}

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-web-wterraform/bucket-created.PNG?raw=true)

```
### 4. Setting up bucket block policy;

```
resource "aws_s3_bucket_public_access_block" "hanif_webbucket" {
  bucket = aws_s3_bucket.hanif_webbucket.id

  block_public_acls = false
  ignore_public_acls = false
  block_public_policy = false
  restrict_public_buckets = false
}
```

The configuration will take effect on below section in bucket Permissions tab.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-web-wterraform/block-public-access.PNG?raw=true)


### 5. Upload my index.html file and my assets folder;

```
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.hanif_webbucket.id
  key = "index.html"
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "index_image" {
  bucket = aws_s3_bucket.hanif_webbucket.id
  key = "assets/giphy.webp"
  source = "assets/giphy.webp"
  content_type = "image/webp"
}
```
The configuration above will upload my files to my bucket.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-web-wterraform/uploaded-files.PNG?raw=true)


### 6. Name of the index document for the website;

```
resource "aws_s3_bucket_website_configuration" "hanif_webbucket" {
  bucket = aws_s3_bucket.hanif_webbucket.id

  index_document {
    suffix = "index.html"
  }

}
```
The configuration above will define the index document fro the static website. The config can be found at the bottom under Properties tab.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-web-wterraform/index-document.PNG?raw=true)

### 7. Below is the bucket policy to allow public access;

```
resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.hanif_webbucket.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
	    "Principal": "*",
      "Action": [ "s3:GetObject" ],
      "Resource": ["${aws_s3_bucket.hanif_webbucket.arn}/*"]
    }
  ]
}
EOF

depends_on = [aws_s3_bucket_public_access_block.hanif_webbucket]
}
```
Above configuration will add a bucket policy under Permissions tab.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-web-wterraform/bucketpolicy.PNG?raw=true)

Initally I don't include depends_on attribute, but I'm keep getting the error. However once I perform terraform apply again. The policy attached just fine. So I'm thinking maybe the first attribute does not finish completely and Terraform try to attached the policy. Adding depends_on works for me.

### 8. Bucket Endpoints

Finally, I have created the output file to display the bucket endpoint. This will ensure that I get the endpoint url right after the process is completed without loging in to the Management console.

```
output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.hanif_webbucket.website_endpoint
}
```

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-web-wterraform/output-endpoint.PNG?raw=true)

## Success!

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-web-wterraform/success.PNG?raw=true)
