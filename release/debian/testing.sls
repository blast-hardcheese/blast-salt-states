/etc/apt/sources.list.d/testing.list:
    file:
        - managed
        - source: salt://release/etc/apt/sources.list.d/testing.list
        - mode: 644

/etc/apt/sources.list:
    file:
        - comment
        - regex: ^[^#]
