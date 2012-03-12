include:
    - salt

/etc/supervisor/conf.d/salt-minion.conf:
    file:
        - managed
        - source: salt://salt/etc/supervisor/conf.d/salt-minion.conf
        - user: root
        - group: root
        - require:
            - pkg: supervisor
