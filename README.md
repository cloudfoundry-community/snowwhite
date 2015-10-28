snowwhite
=========

Snow White loves to manage your seven (or more!) little [bosh-lite](https://github.com/cloudfoundry/bosh-lite/) deployments (running on AWS, not just one on your laptop) for your entire organization. 

This project is very handy when you:

-	Have multiple team mates sharing one or more bosh-lite running on AWS
-	Have a need to easily spin up (and destroy) bosh-lite on AWS

This project is two things:

1.	generator of a new scaffold for your bosh-lites
2.	set of scripts to create/update/cleanup bosh-lites

Requirements
------------

-	AWS account and API credentials
-	Ruby, in order to use the `bosh` CLI, and `bundler` rubygem commands.
-	[Vagrant](http://vagrantup.com/) to provision an AWS bosh-lite
-	Vagrant AWS plugin (installed by the installer script below)

	```
	vagrant plugin install vagrant-aws
	```

-	http://direnv.net/ to add the `snowwhite` helper CLI into the `$PATH` upon 
  entry into the directory.

Installation
------------

To get started, run the following command in your work folder to generate a new scaffold:

```
curl https://raw.githubusercontent.com/cloudfoundry-community/snowwhite/master/installer.sh | bash
```

Or clone this repo somewhere, then invoke the installer script from the folder where you want to create a new scaffold to store all your bosh-lite work folders:

```
git clone https://github.com/cloudfoundry-community/snowwhite.git /tmp/snowwhite
cd ~/workspace
/tmp/snowwhite/installer.sh
```

All subsequent operations are performed within the generated project.

Usage
-----

### New bosh-lite

Run `snowwhite new <name>` to create a new bosh-lite VM.

```
snowwhite new drnic
```

Once the bosh-lite is deployed, an Ubuntu stemcell is uploaded for you.

Finally, the `drnic` bosh-lite will be in the `bosh targets` listing:

```
$ bosh targets
+--------------------------------------+------------------------------+
| drnic                                | https://54.147.193.212:25555 |
| 0777c24d-2ce6-470b-8128-05e99aa4dcc0 | https://54.147.193.212:25555 |
+--------------------------------------+------------------------------+
```

### Target a bosh-lite

```
snowwhite target drnic
```

The output might look like:

```
+ bosh target 54.147.193.212 drnic
Target set to `Bosh Lite Director'
```

### Directory of a bosh-lite

```
snowwhite dir drnic
cd $(snowwhite dir drnic)
```

The latter will change the terminal path into the path of the bosh-lite's `Vagrantfile` and other files.

### IP of a bosh-lite

```
snowwhite ip drnic
```

Would return the current IP.

### List bosh-lites

To get a list of available bosh-lites including their IP:

```
snowwhite list
```

Would return something like:

```
drnic 54.147.193.212
other 54.147.192.100
```

### SSH into bosh-lite and into deployment vms

In order to SSH into your BOSH deployment VMs, you first need to SSH into the bosh-lite VM itself on AWS.

Why? If you are used to using bosh-lite on your laptop then you will be familiar with `bin/add-routes` which let you `bosh ssh` into the bosh-lite warden containers from your laptop. Unfortunately this trick doesn't work if the bosh-lite VM is remote - such as AWS - such as we are doing.

So to SSH into containers:

1.	`snowwhite ssh <name>`; and then inside the bosh-lite host VM:
2.	`bosh download manifest <deployment> <deployment>.yml`
3.	`bosh deployment <deployment>.yml`
4.	`bosh ssh`

### Destroy bosh-lite

```
snowwhite destroy drnic [-f]
```

### Upgrades

As new features/scripts/bug fixes are added to this `snowwhite` repository, your own `bosh-lites` project folder can easily update the scripts:

```
snowwhite update
```

This invokes the correct `git subtree pull` to update the `snowwhite` subfolder in your project.

