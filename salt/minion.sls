include:
    - salt

/etc/salt/minion:
    file:
        - managed
        - source: salt://salt/etc/salt/minion
        - user: root
        - group: root
        - require:
            - pkg: supervisor

/etc/supervisor/conf.d/salt-minion.conf:
    file:
        - managed
        - source: salt://salt/etc/supervisor/conf.d/salt-minion.conf
        - user: root
        - group: root
        - require:
            - pkg: supervisor

salt-processes-minion:
    service:
        - names:
            - supervisor
        - running
        - require:
            - pkg: supervisor
        - watch:
            - file: /etc/supervisor/conf.d/salt-minion.conf
