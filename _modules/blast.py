localm2crypto = '/srv/virtualenv/local/lib/python2.7/site-packages/M2Crypto/__m2crypto.so'
distm2crypto = '/usr/lib/python2.7/dist-packages/M2Crypto/__m2crypto.so'

def update_salt():
    '''Updates salt in /srv/salt/salt-github/'''
    cmd = ' && '.join((
    '''. /srv/virtualenv/bin/activate''',
    '''cd /srv/salt/salt-github''',
    '''git pull''',
    '''pip install -r requirements.txt''',
    '''pip install --no-deps -U .''',
    '''rm -f /tmp/garbage''',
    '''mv %s /tmp/garbage''' % localm2crypto,
    '''cp -v %s %s''' % (distm2crypto, localm2crypto),
    '''echo "Update complete"''',
    '''echo "Restarting salt..."''',
    'pkill salt-minion',
    ))
    out = __salt__['cmd.run_stdout'](cmd)
    return out

def fixm2crypto():
    cmd = ' && '.join((
    '''rm -fv /tmp/garbage''',
    '''mv -v %s /tmp/garbage''' % localm2crypto,
    '''cp -v %s %s''' % (distm2crypto, localm2crypto),
    ))
    out = __salt__['cmd.run_stdout'](cmd)
    return out

def restart_salt():
    '''Kills salt-master and salt-minion processes'''
    __salt__['cmd.run']('sh -c "' + ' && '.join((
    'pkill salt-master',
    'pkill salt-minion',
    'pkill salt',
    ))
    + '" &')
    return True
