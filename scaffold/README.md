bosh-lites
==========

This repository includes scripts to create [bosh-lite](https://github.com/cloudfoundry/bosh-lite/) to your AWS account, to reap unused bosh-lite VMs, and can also upgrade its own scripts as new versions are released.

This repository contains a `deployments` subfolder. Inside it is one subfolder for each [bosh-lite](https://github.com/cloudfoundry/bosh-lite/).

To create new bosh-lite or destroy a bosh-lite, see the [Usage instructions](https://github.com/cloudfoundry-community/boss-lite#usage) for [boss-lite](https://github.com/cloudfoundry-community/boss-lite).

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
