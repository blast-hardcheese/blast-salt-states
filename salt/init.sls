/srv/runinenv:
    file:
        - managed
        - source: salt://salt/srv/runinenv
        - user: root
        - group: root
        - mode: 755

supervisor:
    pkg:
        - installed

/etc/init.d/supervisor:
    file:
        - managed
        - source: salt://salt/etc/init.d/supervisor
        - user: root
        - group: root
        - mode: 755
