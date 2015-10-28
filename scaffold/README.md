bosh-lites
==========

This repository includes scripts to create [bosh-lite](https://github.com/cloudfoundry/bosh-lite/) to your AWS account, to reap unused bosh-lite VMs, and can also upgrade its own scripts as new versions are released.

This repository contains a `deployments` subfolder. Inside it is one subfolder for each [bosh-lite](https://github.com/cloudfoundry/bosh-lite/).

To create new bosh-lite or destroy a bosh-lite, see the [Usage instructions](https://github.com/cloudfoundry-community/#usage) for [snowwhite](https://github.com/cloudfoundry-community/snowwhite).

Example commands are:

```
snowwhite new drnic
snowwhite target drnic
snowwhite dir drnic
snowwhite ip drnic
snowwhite list
snowwhite ssh drnic
snowwhite destroy drnic [-f]
snowwhite update
```

Read the [Usage instructions](https://github.com/cloudfoundry-community/#usage) for more information; especially after updating.

Global CLI
----------

You can use the `` CLI from anywhere if you add this project's `bin` into your `$PATH`.

Add the following into your `~/.bashrc` or `~/.zshrc`, etc:

```
export PATH="$PATH:/path/to/bosh-lites/bin"
```

And restart your session.
