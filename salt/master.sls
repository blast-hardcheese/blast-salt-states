include:
    - salt

/srv/runinenv:
    file:
        - managed
        - source: salt://salt/srv/runinenv
        - user: root
        - group: root
        - mode: 755

/etc/salt/master:
    file:
        - managed
        - source: salt://salt/etc/salt/master
        - user: root
        - group: root
        - require:
            - pkg: supervisor

/etc/supervisor/conf.d/salt-master.conf:
    file:
        - managed
        - source: salt://salt/etc/supervisor/conf.d/salt-master.conf
        - user: root
        - group: root
        - require:
            - pkg: supervisor
