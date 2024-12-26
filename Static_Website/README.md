# Static Website Hosting With Amazon S3

### Overview

Amazon S3 is an object storage service offered by Amazon Web Services. This services offer unlimited storage capacity, highly durable and available. Apart from that we can also host a static website using Amazon S3.

### Prerequisites

This project require an index file(index.html) and resources folder(assets) to be hosted in Amazon S3. I have uploaded the files in this repo too.

### 1. Setup Amazon S3 bucket

Creating an S3 bucket took me around 3 minutes including reading all the description. However, if we know what is the requirement, it might take less than that.

The Region I picked for my S3 bucket was ap-southeast-1 because Singapore is the closest to me.

S3 bucket names are globally unique! This means nobody else in the world can use our bucket name unless we delete it. So when creating it, we need to make it unique too. We can't use other people bucket name.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-website/createbucket-success.PNG?raw=true)

### 2. Upload Website Files to S3

index.html and assets folder

I have uploaded the files and folder to my S3 bucket - they were index.html and assets folder

Both are necessary for this project as the index.html will be displaying the page that interact with the user while the assets folder used by the page to display images, videos etc.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-website/uploaded-files.PNG?raw=true)

### 3. Enabled Static Website Hosting

Website hosting means that we store our website's files on a server, to make the site accessible to people on the internet.

To enable website hosting with my S3 bucket, go to the bucket Properties tab and scroll down until Static website hosting section and click edit. Choose option to Enable it then choose Host a static website and enter the index filename.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-website/static-site-hosting.PNG?raw=true)

### 4. Bucket Endpoints

Once static website is enabled, S3 produces a bucket endpoint URL, which is a regular website URL that allow people to visit S3 bucket as a website.

When I first visited the bucket endpoint URL, I saw the error 403 Forbidden and the error code was AccessDenied. The reason for this error was by default S3 will upload all the files into the bucket as private which denied people from viewing it.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-website/bucket-endpoint.PNG?raw=true)

### 5. Make the files go public

There are 2 ways to make the objects go public.

1. By using Make Public in Action. This is to set the permission in at the object level.

Go to the Object tab, Select both the index file and the resources folder, then click Action button and choose Make it Public using ACL option. Then click 'Make public'.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-website/make-public.PNG?raw=true)

2. By defining a bucket policy. This is to set the permission in at the bucket level. Bucket policy provides a more robust and scalable way to manage access permissions. I prefer this method because it is easy to manage especially if I have many objects to deal with.

Go to the Permission tab, Scroll down to bucket policy, then click Edit button and Generate the policy using the policy generator.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-website/bucket-policy.PNG?raw=true)


## Success!

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/static-website/success.PNG?raw=true)


