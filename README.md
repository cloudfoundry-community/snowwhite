boss-lite
=========

Manage multiple [bosh-lite](https://github.com/cloudfoundry/bosh-lite/) deployments (running on AWS, not just one on your laptop) for your entire organization. Who's the boss? You're the boss. And that person over there.

This project is two things:

1.	generator of a new scaffold for your bosh-lites
2.	set of scripts to create/update/cleanup bosh-lites

Requirements
------------

-	http://direnv.net/ to add the `boss-lite` helper CLI into the `$PATH`

Installation
------------

To get started, run the following command in your work folder to generate a new scaffold:

```
curl https://raw.githubusercontent.com/cloudfoundry-community/boss-lite/master/installer.sh | bash
```

Or clone this repo somewhere, then invoke the installer script from the folder where you want to create a new scaffold to store all your bosh-lite work folders:

```
cd /tmp
git clone https://github.com/cloudfoundry-community/boss-lite.git
cd ~/workspace
/tmp/boss-lite/installer.sh
```

You will be prompted for your organization's AWS credentials and the target `subnet_id` where each bosh-lite VM is deployed (press `Enter` to deploy into EC2 rather than a VPC subnet).
