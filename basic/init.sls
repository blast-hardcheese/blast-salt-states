basic-packages:
    pkg:
        - installed
        - names:
            - ntp
            - sudo

            - ssh
            - openssh-client
            - openssh-server
            - avahi-daemon
            - avahi-utils

            - curl
            - cronolog
            - netcat
            - dnsutils
            - debian-goodies
            - moreutils

/etc/sudoers.d/local:
    file:
        - managed
        - source: salt://basic/etc/sudoers.d/local
        - mode: 440
        - require:
            - pkg: sudo
