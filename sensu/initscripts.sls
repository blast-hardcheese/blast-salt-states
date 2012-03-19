{% set init_prefix = "/etc/init.d" %}
{% set sensu_parts = ["server", "dashboard", "api", "client"] %}

{%- for part in sensu_parts %}
    {%- if pillar['sensu-' + part ] %}

{{ init_prefix}}/sensu-{{ part }}:
    file:
        - managed
        - source: salt://sensu/etc/init.d/init-template
        - template: jinja
        - mode: 755
        - defaults:
            daemon_path: {{ salt['cmd.run'](
                "gem contents sensu"
                + (" sensu-dashboard" if part == "dashboard" else "")
                + " | grep bin/sensu-"
                + part
            ) }}
            part: "{{ part }}"

        - require:
            - gem: sensu
        {%- if part == "dashboard" %}
            - gem: sensu-dashboard
        {%- endif %}

    {%- endif %}

{%- endfor %}
