# Malicious Macro Generator Utility

Simple utility design to generate obfuscated macro that also include a AV / Sandboxes escape mechanism.

# Requirement
```
Python 2.7
```

# Usage
```
MMG.Malicious Macro Generator v2.0 - RingZer0 Team
Author: Mr.Un1k0d3r

Usage: MMG.py [config] [output] (optional -list)

        config  Config file that contain generator information
        output  Output filename for the macro
        -list   List all available payloads and evasion techniques

python MMG.py configs/generic-cmd.json malicious.vba
```

# Config file

Example of a project config file.
```
{
	"description": "Generic command exec payload\nEvasion technique set to domain check",
	"template": "templates/payloads/generic-cmd-evasion-template.vba",
	"varcount": 150,
	"encodingoffset": 4,
	"chunksize": 200,
	"encodedvars": 	{
				"DOMAIN":"RINGZER0"
			},
	"vars": 	[],
	"evasion": 	["encoder", "domain"],
	"payload": "cmd.exe /c whoami"
}
```

# Evasion techniques

###### Domain check

The macro is fetching the USERDOMAIN environment variable and compare the value with a predefined one. If they match the final payload is executed.

###### Disk check

The macro is looking for the total disk space. VMs and test machines use small disk most of the time. 

###### Memory check

The macro is looking for the total memory size. Vms and test machines use less resources.

###### Uptime check

The macro is looking for the system uptime. Sandboxes will return a short uptime.

###### Process check

The macro is checking if a specific process is running (example outlook.exe)

###### Obfuscation 

The python script will also generate obfuscated code to avoid heuristic detection

###### More to come

# Credit

Mr.Un1k0d3r RingZer0 Team

https://ringzer0team.com
