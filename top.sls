base:
    '*':
        - basic
        - basic.scm
        - ldap-client
        - ldap-client.nfs-homes
        - networking
        - salt.minion

    'salt01':
        - release.debian.testing

    'sensu01':
        - release.debian.testing
        - development.ruby

    'sensu02':
        - release.debian.stable-bpo
        - development.ruby
        - sensu.gem

    'pokecenter':
        - release.debian.testing
        - salt.master

    'scyther':
        - release.debian.testing
        - webserver
        - chat
        - shell
        - development
        - admin

    'clefairy':
        - release.debian.testing
        - apt-proxy

    'meowth':
        - release.debian.testing
        - chat-server.jabber

    'mankey':
        - release.debian.testing

    'psyduck':
        - release.debian.testing
        - development.haskell

    'sandslash':
        - release.debian.testing
        - database.mysql
        - database.postgresql
