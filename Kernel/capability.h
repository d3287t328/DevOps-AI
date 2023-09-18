#define CAP_CHOWN            0  // Make arbitrary changes to file UIDs and GIDs
#define CAP_DAC_OVERRIDE     1  // Bypass file read, write, and execute permission checks
#define CAP_DAC_READ_SEARCH  2  // Bypass file read permission checks and directory read and execute permission checks
#define CAP_FOWNER           3  // Bypass permission checks on operations
#define CAP_FSETID           4  // Don't clear set-user-ID and set-group-ID bits when a file is modified
#define CAP_KILL             5  // Bypass permission checks for sending signals
#define CAP_SETGID           6  // Make arbitrary manipulations of process GIDs and supplementary GID list
#define CAP_SETUID           7  // Make arbitrary manipulations of process UIDs
#define CAP_SETPCAP          8  // Transfer any capability in your permitted set to any other process
#define CAP_LINUX_IMMUTABLE  9  // Modify immutable and append-only flags
#define CAP_NET_BIND_SERVICE 10 // Bind a socket to internet domain privileged ports
#define CAP_NET_BROADCAST    11 // Broadcast, listen to multicast
#define CAP_NET_ADMIN        12 // Perform various network-related operations
#define CAP_NET_RAW          13 // Use RAW and PACKET sockets
#define CAP_IPC_LOCK         14 // Lock memory
#define CAP_IPC_OWNER        15 // Bypass permission checks for operations on System V IPC objects
#define CAP_SYS_MODULE       16 // Load and unload kernel modules
#define CAP_SYS_RAWIO        17 // Perform I/O port operations
#define CAP_SYS_CHROOT       18 // Use chroot()
#define CAP_SYS_PTRACE       19 // Trace arbitrary processes
#define CAP_SYS_PACCT        20 // Use acct()
#define CAP_SYS_ADMIN        21 // Perform a range of system administration operations
#define CAP_SYS_BOOT         22 // Use reboot() and kexec_load()
#define CAP_SYS_NICE         23 // Raise process nice value, change the nice value for arbitrary processes
#define CAP_SYS_RESOURCE     24 // Override RLIMIT_* resource limits
#define CAP_SYS_TIME         25 // Set system clock
#define CAP_SYS_TTY_CONFIG   26 // Use vhangup(), employ various privileged terminal ioctls
#define CAP_MKNOD            27 // Create special files using mknod()
#define CAP_LEASE            28 // Establish leases on arbitrary files
#define CAP_AUDIT_WRITE      29 // Write records to kernel auditing log
#define CAP_AUDIT_CONTROL    30 // Enable and disable kernel auditing
#define CAP_SETFCAP          31 // Set file capabilities
#define CAP_MAC_OVERRIDE     32 // Override Mandatory Access Control
#define CAP_MAC_ADMIN        33 // Allow MAC configuration or state changes
#define CAP_SYSLOG           34 // Perform privileged syslog(2) operations
#define CAP_WAKE_ALARM       35 // Trigger something that will wake up the system
#define CAP_BLOCK_SUSPEND    36 // Block system suspend
#define CAP_AUDIT_READ       37 // Read audit log via multicast netlink socket
#define CAP_PERFMON          38 // Allow controlling the kernel performance monitoring
#define CAP_BPF              39 // Allow various BPF operations
#define CAP_CHECKPOINT_RESTORE 40 // Checkpoint/restore
#define CAP_PERSONALITY      41 // Set the process's Linux personality
#define CAP_REBOOT           42 // Reboot
#define CAP_USER_TIME        43 // Override the CLOCK_REALTIME timer

