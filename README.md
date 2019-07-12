# Assignment for Week 3: Puppet setup

## Execution after "Remove the sshd package"

I am assuming "sshd package" here means the "openssh-server" package.

```bash
root@ip-10-0-6-235:/etc/puppet# apt remove sshd
Reading package lists... Done
Building dependency tree
Reading state information... Done
E: Unable to locate package sshd
root@ip-10-0-6-235:/etc/puppet# apt remove openssh-server
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages will be REMOVED:
  openssh-server
0 upgraded, 0 newly installed, 1 to remove and 20 not upgraded.
After this operation, 898 kB disk space will be freed.
Do you want to continue? [Y/n] y
(Reading database ... 87555 files and directories currently installed.)
Removing openssh-server (1:7.6p1-4ubuntu0.3) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
root@ip-10-0-6-235:/etc/puppet# service sshd status
Unit sshd.service could not be found.
root@ip-10-0-6-235:/etc/puppet# puppet apply /etc/puppet/manifests/site.pp
Notice: Compiled catalog for ip-10-0-6-235.us-west-2.compute.internal in environment production in 0.46 seconds
Notice: /Stage[main]/Sshd::Prelude/Package[openssh-server]/ensure: created
Notice: Applied catalog in 5.21 seconds
root@ip-10-0-6-235:/etc/puppet# service sshd status
● ssh.service - OpenBSD Secure Shell server
   Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
   Active: active (running) since Fri 2019-07-12 00:18:42 UTC; 4s ago
 Main PID: 9070 (sshd)
    Tasks: 1 (limit: 547)
   CGroup: /system.slice/ssh.service
           └─9070 /usr/sbin/sshd -D

Jul 12 00:18:42 ip-10-0-6-235 systemd[1]: Starting OpenBSD Secure Shell server...
Jul 12 00:18:42 ip-10-0-6-235 sshd[9070]: Server listening on 0.0.0.0 port 22.
Jul 12 00:18:42 ip-10-0-6-235 sshd[9070]: Server listening on :: port 22.
Jul 12 00:18:42 ip-10-0-6-235 systemd[1]: Started OpenBSD Secure Shell server.
```

## Execution after "Stop sshd"

```bash
root@ip-10-0-6-235:/etc/puppet# service sshd stop
root@ip-10-0-6-235:/etc/puppet# service sshd status
● ssh.service - OpenBSD Secure Shell server
   Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
   Active: inactive (dead) since Fri 2019-07-12 00:20:07 UTC; 3s ago
  Process: 9070 ExecStart=/usr/sbin/sshd -D $SSHD_OPTS (code=exited, status=0/SUCCESS)
 Main PID: 9070 (code=exited, status=0/SUCCESS)

Jul 12 00:18:42 ip-10-0-6-235 systemd[1]: Starting OpenBSD Secure Shell server...
Jul 12 00:18:42 ip-10-0-6-235 sshd[9070]: Server listening on 0.0.0.0 port 22.
Jul 12 00:18:42 ip-10-0-6-235 sshd[9070]: Server listening on :: port 22.
Jul 12 00:18:42 ip-10-0-6-235 systemd[1]: Started OpenBSD Secure Shell server.
Jul 12 00:20:07 ip-10-0-6-235 systemd[1]: Stopping OpenBSD Secure Shell server...
Jul 12 00:20:07 ip-10-0-6-235 systemd[1]: Stopped OpenBSD Secure Shell server.
root@ip-10-0-6-235:/etc/puppet# puppet apply /etc/puppet/manifests/site.pp
Notice: Compiled catalog for ip-10-0-6-235.us-west-2.compute.internal in environment production in 0.47 seconds
Notice: /Stage[main]/Sshd::Prelude/Service[sshd]/ensure: ensure changed 'stopped' to 'running'
Notice: Applied catalog in 0.28 seconds
root@ip-10-0-6-235:/etc/puppet# service sshd status
● ssh.service - OpenBSD Secure Shell server
   Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
   Active: active (running) since Fri 2019-07-12 00:20:17 UTC; 1s ago
  Process: 9293 ExecStartPre=/usr/sbin/sshd -t (code=exited, status=0/SUCCESS)
 Main PID: 9300 (sshd)
    Tasks: 1 (limit: 547)
   CGroup: /system.slice/ssh.service
           └─9300 /usr/sbin/sshd -D

Jul 12 00:20:17 ip-10-0-6-235 systemd[1]: Starting OpenBSD Secure Shell server...
Jul 12 00:20:17 ip-10-0-6-235 sshd[9300]: Server listening on 0.0.0.0 port 22.
Jul 12 00:20:17 ip-10-0-6-235 sshd[9300]: Server listening on :: port 22.
Jul 12 00:20:17 ip-10-0-6-235 systemd[1]: Started OpenBSD Secure Shell server.
```



## 