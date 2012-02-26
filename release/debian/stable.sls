/etc/apt/sources.list.d/stable.list:
    file:
        - managed
        - source: salt://release/etc/apt/sources.list.d/stable.list
        - mode: 0644
