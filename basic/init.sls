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

            - bc
            - screen

            - curl
            - cronolog
            - netcat
            - dnsutils
            - debian-goodies
            - moreutils

            - mg
            - vim

/etc/sudoers.d/local:
    file:
        - managed
        - source: salt://basic/etc/sudoers.d/local
        - mode: 440
        - require:
            - pkg: sudo
