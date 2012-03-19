{% include "sensu/common.jinja" %}

include:
    - sensu.initscripts
    - sensu.services
    - sensu.config

sensu-packages:
    pkg:
        - installed
        - names:
            - ruby
            - rubygems
            - rake
            - rabbitmq-server
            - redis-server

sensu:
    gem:
        - installed

{% if pillar['sensu-dashboard'] %}
sensu-dashboard:
    gem:
        - installed
{% endif %}
