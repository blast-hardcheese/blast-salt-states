nfs-common:
    pkg:
        - installed

autofs:
    pkg:
        - installed

/etc/auto.home:
    file:
        - managed
        - source: salt://ldap-client/etc/auto.home
        - require:
            - pkg: autofs

/etc/auto.master:
    file:
        - managed
        - source: salt://ldap-client/etc/auto.master
        - require:
            - pkg: autofs
