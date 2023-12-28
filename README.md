Brew Notify
===========
Putting your Mac's Caps Lock LED to good use

> *NOTE:* This repository is no longer maintained!

What is it?
-----------

I neither use nor like Caps Lock. In fact, I disable it in OS X and use
[PCKeyboardHack][pckeyboardhack] so that it functions as an Escape key (for Vim purposes). That's
great and all, but it leaves the Caps Lock on/off LED to disuse.

_Brew Notify_ is a simple utility that uses the Caps Lock LED to indicate whether there are any
outdated [Homebrew][homebrew] packages.

Dependencies
------------

While the _Brew Notify_ scripts can be adjusted to account for an alternative setup, they were
written to accomodate the following environment.

* BASH-like `/bin/sh` (provided with OS X)
* Homebrew installed to the default `/usr/local` location
* Homebrew-installed Ruby
* [MacLight][maclight] Ruby gem (`maclight`)

Installing
----------

### Cloning

This repository must first be cloned to your machine. These instructions assume that the repository
will be cloned into a subdirectory of `~/apps`:

```shell
mkdir ~/apps && cd ~/apps
git clone https://github.com/cfree3/brew-notify.git ~/apps
```

### Setup

`launchd` should load the job automatically upon your next login if the `plist` is in your
`LaunchAgents`:

```shell
cd ${HOME}/Library/LaunchAgents
ln -s ~/apps/brew-notify/com.curtisfree.brew-notify.plist .
```

When complete, if you would like to load the job in your current session, simply ask `launchd` to do
so:

```shell
launchctl load com.curtisfree.brew-notify.plist
```

Running
-------

By default, _Brew Notify_ is configured to run once every 12 hours. To run the job on demand:

```shell
launchctl start com.curtisfree.brew-notify
```

Notes and resources
-------------------

* It's easy to [create a `launchd` job][launchd_job].
* The `brew_notify.sh` script uses some tricks to determine where executables are. This is because
  [`launchd`'s path might not be as thorough as your own][launchd_path].
* The Caps Lock LED does not turn off automatically after packages have been updated. Such a feature
  could be implemented as a shell function that wraps `brew`, or it can be turned off manually
  via `maclight keyboard toggle --capslock 0`.

License
-------
_Brew Notify_ is released under the MIT license (see `LICENSE.md`).

DISCLAIMER
----------
I give no assurance of this utility's security, and I do not guarantee that it will not zap your
computer and fry your homedir. _Use at your own risk._

[homebrew]:       http://brew.sh
[maclight]:       https://github.com/busyloop/maclight
[pckeyboardhack]: https://pqrs.org/macosx/keyremap4macbook/pckeyboardhack.html.en
[launchd_job]:    https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html
[launchd_path]:   http://forums.macrumors.com/showthread.php?t=1207405
