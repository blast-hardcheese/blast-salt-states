{% include "sensu/common.jinja" %}

{%- for part in sensu_parts %}
    {%- if pillar["sensu-" + part] %}
sensu-{{ part }}:
    service:
        - running
        - require:
            - file: {{ init_prefix }}/sensu-{{ part }}
        - watch:
            - file: /etc/sensu/config.json
    {%- endif %}
{%- endfor %}
