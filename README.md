## MaliciousMacroGenerator
#Malicious Macro Generator Utility

Simple utility design to generate obfuscated macro that also include a AV / Sandbox escape trick

#Requirement
```
Python 2.7
Python 3.4 (Not supported yet)
```

#Usage
```
Usage: GenMacro.py [config] [output]

        config  Config file that contain generator information
        output  Output filename for the macro
        
python GenMacro.py configs/generic-cmd-domain-evasion.json malicious.vba
```

#Config file
```

```

#Evasion technique

The macro is fetching the USERDOMAIN environment variable and compare the value with a predefined one. If they match the final payload is executed.

The python script will also generate obfuscated code to avoid heuristic detection


#Credit

Mr.Un1k0d3r RingZer0 Team
https://ringzer0team.com
charles.hamilton@mandiant.com

