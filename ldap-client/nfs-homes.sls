nfs-homes-packages:
    pkg:
        - installed
        - names:
            - nfs-common
            - autofs

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

nfs-homes-services:
    service:
        - names:
            - automount
            - nfs-common
        - running
        - require:
            - file: /etc/auto.home
            - file: /etc/auto.master
            - pkg: autofs
        - watch:
            - file: /etc/auto.home
            - file: /etc/auto.master
