As you might have noticed, this repo hasn't been updated in two years
=====================================================================

There's still plenty of (dated) information in here, but if you're interested in seeing what I've been working on recently, please check out blast-hardcheese/salty-baseline.


Salt states for home server administration

Interesting states:

    ldap-client
    ldap-client.nfs-homes
    # LDAP user/groups, NFSv4 home directories

    salt.minion
    salt.master
    # mainly supervisord configs to manage salt processes

    networking
    # There was a bug on my network (running Debian testing)
    # where the salt-minions weren't able to make a solid
    # connection to the master past the initial key exchange.
    # Turns out it was IPv6 related. This could also do other
    # network related things in the future, but right now it's
    # just that.

    release
    # Keep track of which release each server pulls from.
    # Need a good way to do upgrades, but for now cssh will
    # work.

Interesting modules:

    blast.py
    # Testing and salt management module. Basically:
    ## mkdir /srv/salt/
    ## Set up virtualenv into .../virtualenv
    ## Clone from github into .../salt-github
    ## pip install -U --no-deps . # It's assumed we already have deps
    # This is really helpful for rapid development and testing of modules
    # and states

Other interesting things:

    utils/initial-install-salt.sh
    # Get salt installed, configured, and ready for use.
