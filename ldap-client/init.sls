ldap-client-packages:
    pkg:
        - debconf: salt://debconf/ldap-client.ans
        - installed
        - names:
            - nslcd
            - libpam-ldapd
            - libnss-ldapd

/etc/nslcd.conf:
    file:
        - managed
        - source: salt://ldap-client/etc/nslcd.conf
        - mode: 640
        - user: root
        - group: nslcd
        - require:
            - pkg: nslcd

/etc/nsswitch.conf:
    file:
        - managed
        - source: salt://ldap-client/etc/nsswitch.conf
        - mode: 644
        - user: root
        - group: root
        - require:
            - pkg: nslcd

/etc/ldap/ldap.conf:
    file:
        - managed
        - source: salt://ldap-client/etc/ldap/ldap.conf
        - mode: 644
        - user: root
        - group: root
        - require:
            - pkg: nslcd

ldap-client-services:
    service:
        - names:
            - nslcd
            - nscd
        - running
        - require:
            - file: /etc/ldap/ldap.conf
            - file: /etc/nsswitch.conf
            - file: /etc/nslcd.conf
            - pkg: nslcd
        - watch:
            - file: /etc/ldap/ldap.conf
            - file: /etc/nsswitch.conf
            - file: /etc/nslcd.conf
