ejabberd:
    pkg:
        - installed

/etc/ejabberd/ejabberd.cfg:
    file:
        - managed
        - source: salt://chat-server/etc/ejabberd/ejabberd.cfg
        - mode: 600
        - user: ejabberd
        - group: ejabberd
        - require:
            - pkg: ejabberd

/etc/ejabberd/inetrc:
    file:
        - managed
        - source: salt://chat-server/etc/ejabberd/inetrc
        - mode: 644
        - require:
            - pkg: ejabberd

