Cgroups Educational Class Commands
What are control groups?

lscgroup
An example: the pids controller

```bash
mkdir /sys/fs/cgroup/pids/my_cgroup
echo 20 > /sys/fs/cgroup/pids/my_cgroup/pids.max
Creating and destroying cgroups

```bash
mkdir /sys/fs/cgroup/cpu/my_cgroup
rmdir /sys/fs/cgroup/cpu/my_cgroup
Populating a cgroup

```bash
echo $$ > /sys/fs/cgroup/pids/my_cgroup/cgroup.procs
Enabling and disabling controllers

```bash
echo '+cpu' > /sys/fs/cgroup/cgroup.subtree_control
echo '-cpu' > /sys/fs/cgroup/cgroup.subtree_control

Module 3: Cgroups: A Survey of the Controllers
For different controllers (cpu, memory, freezer, pids), the commands are generally similar but use specific attributes. Example for CPU:

```bash
echo 100000 > /sys/fs/cgroup/cpu/my_cgroup/cpu.cfs_quota_us

Module 4: Cgroups: Advanced Features
Cgroup namespaces

```bash
unshare -C

Release notification

```bash
cat /sys/fs/cgroup/cpu/my_cgroup/cgroup.events

Delegation

```bash
chown -R user /sys/fs/cgroup/cpu/my_cgroup/

Module 5: Cgroups: Thread Mode (*)
Commands similar to Module 2 and 3 but with thread-specific attributes.
Module 6: Cgroups Version 1
Populating a cgroup

```bash
echo $$ > /sys/fs/cgroup/cpu,cpuacct/my_cgroup/tasks
Release notification

```bash
cat /sys/fs/cgroup/cpu,cpuacct/my_cgroup/cgroup.events

Note: Many commands require root permission. Make sure to exercise caution and understanding before executing them on a live system.
