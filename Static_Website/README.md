# Static Website Hosting With Amazon S3

### Overview

Amazon S3 is an object storage services offered by Amozon Web Services. This services offer unlimited storage capacity, highly durable and available. Apart from that we can host a static website using Amazon S3.

### Prerequisites

This project require an index file(index.html) and resources folder(assets) to be hosted in Amazon S3. I have uploaded the files in this repo too.

### 1. Setup Amazon S3 bucket

Creating an S3 bucket took me around 3 minutes including reading all the
description. However, if we know what is the requirement, it might take less
than that.

The Region I picked for my S3 bucket was ap-southeast-1 because Singapore
is the closest to me.

S3 bucket names are globally unique! This means nobody else in the world can
use our bucket name unless we delete it. So when creating it, we need to make
it unique too. We can't use other people bucket name. Just can't

### 2. Upload Website Files to S3

index.html and assets folder

I uploaded the files and folder to my S3 bucket - they were index.html and assets folder

Both are necessary for this project as the index.html will be displaying the
page that interact with the user while the assets folder used by the
page to display images, videos etc.

### 3. Static Website Hosting on S3

Website hosting means that we store our website's files on a server, to make
the site accessible to people on the internet.

To enable website hosting with my S3 bucket, I go to the bucket Properties tab
and scroll down until Static website hosting section and click edit. Choose
option to Enable it then choose Host a static website and enter the index
filename.

An ACL is meant for giving an access to resources. In this project I am going to
enable it so I can control who can have access my bucket.

### 4. Bucket Endpoints

Once static website is enabled, S3 produces a bucket endpoint URL, which is a
regular website URL that allow people to visit S3 bucket as a website.

When I first visited the bucket endpoint URL, I saw the error 403 Forbidden and
the code was AccessDenied. The reason for this error was by default S3 will
upload all the files into the bucket as private which denied people from viewing
it

### 5. Success!

To resolve this connection error, I go to the Object tab, Select both the index file
and the resources folder, the click Action button and choose Make it Public
using ACL option. Then click 'Make public'

