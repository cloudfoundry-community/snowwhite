boss-lite
=========

Manage multiple [bosh-lite](https://github.com/cloudfoundry/bosh-lite/) deployments (running on AWS, not just one on your laptop) for your entire organization. Who's the boss? You're the boss. And that person over there.

This project is two things:

1.	generator of a new scaffold for your bosh-lites
2.	set of scripts to create/update/cleanup bosh-lites

Requirements
------------

-	Ruby to run `bosh` CLI, and `bundler` rubygem
-	http://vagrantup.com/ to provision AWS bosh-lite
-	Vagrant AWS plugin

	```
	vagrant plugin install vagrant-aws
	```

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

All subsequent operations are performed within the generated project.

Usage
-----

### New bosh-lite

Run `boss-lite new <name>` to create a new bosh-lite VM.

```
boss-lite new drnic
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

### Destroy bosh-lite

```
boss-lite destroy drnic [-f]
```

### Upgrades

As new features/scripts/bug fixes are added to this `boss-lite` repository, your own `bosh-lites` project folder can easily update the scripts:

```
boss-lite update
```

This invokes the correct `git subtree pull` to update the `boss-lite` subfolder in your project.
