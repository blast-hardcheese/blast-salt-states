include:
    - salt

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

salt-processes-master:
    service:
        - names:
            - supervisor
        - running
        - require:
            - pkg: supervisor
        - watch:
            - file: /etc/supervisor/conf.d/salt-master.conf
