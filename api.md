## CPU

* os.cpus()

> Returns: <Array>
> The os.cpus() method returns an array of objects containing information about each CPU/core installed.

> The properties included on each object include:

>> model <String>
>> speed <number> (in MHz)
>> times <Object>
>> user <number> The number of milliseconds the CPU has spent in user mode.
>> nice <number> The number of milliseconds the CPU has spent in nice mode.
>> sys <number> The number of milliseconds the CPU has spent in sys mode.
>> idle <number> The number of milliseconds the CPU has spent in idle mode.
>> irq <number> The number of milliseconds the CPU has spent in irq mode.

## Memory

* os.freemem()
> Returns: <Integer>
>> The os.freemem() method returns the amount of free system memory in bytes as an integer.

* os.loadavg()
 > Returns: <Array>
 >> The os.loadavg() method returns an array containing the 1, 5, and 15 minute load averages.
>> The load average is a measure of system activity, calculated by the operating system and expressed as a fractional number. As a rule of thumb, the load average should ideally be less than the number of logical CPUs in the system.

>> The load average is a UNIX-specific concept with no real equivalent on Windows platforms. On Windows, the return value is always [0, 0, 0].

## DNS

* dns.getServers()
> Returns an array of IP address strings that are being used for name resolution.