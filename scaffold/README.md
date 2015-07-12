bosh-lites
==========

This repository includes scripts to create [bosh-lite](https://github.com/cloudfoundry/bosh-lite/) to your AWS account, to reap unused bosh-lite VMs, and can also upgrade its own scripts as new versions are released.

This repository contains a `deployments` subfolder. Inside it is one subfolder for each [bosh-lite](https://github.com/cloudfoundry/bosh-lite/).

To create new bosh-lite or destroy a bosh-lite, see the [Usage instructions](https://github.com/cloudfoundry-community/boss-lite#usage) for [boss-lite](https://github.com/cloudfoundry-community/boss-lite).

Example commands are:

```
boss-lite new drnic
boss-lite ssh drnic
boss-lite destroy drnic [-f]
boss-lite update
```

Read the [Usage instructions](https://github.com/cloudfoundry-community/boss-lite#usage) for more information; especially after updating.
