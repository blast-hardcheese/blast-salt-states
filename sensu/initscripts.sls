{% import "sensu/common.jinja" as common %}

{%- for part in common.sensu_parts %}
    {%- if pillar[part] %}

{{ common.init_script_path(part) }}:
    file:
        - managed
        - source: salt://sensu/etc/init.d/init-template
        - template: jinja
        - mode: 755
        - defaults:
            daemon_path: {{ salt['cmd.run'](
                "gem contents sensu"
                + (" sensu-dashboard" if part == "sensu-dashboard" else "")
                + " | grep bin/" + part
            ) }}
            part: "{{ part }}"

        - require:
            - gem: sensu
        {%- if part == "sensu-dashboard" %}
            - gem: sensu-dashboard
        {%- endif %}

    {%- endif %}

{%- endfor %}
