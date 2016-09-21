## MaliciousMacroGenerator
#Malicious Macro Generator Utility
---
Simple utility design to generate obfuscated macro that also include a AV / Sandbox escape trick
---

#Requirement
```
Python 2.7
Python 3.4 (Not tested)
```

#Usage
```
Usage: GenMacro.py [template] [domain] [offset] [payload] [output]

        template        Template macro
        domain          Target domain name (USERDOMAIN env variable value)
        offset          Encoding offset (default 3)
        payload         Payload to be executed
        output          Output filename
        
python GenMacro.py "base.vba" "RingZer0" 3 "cmd.exe /c ping ringzer0team.com" malicious.vba
```
