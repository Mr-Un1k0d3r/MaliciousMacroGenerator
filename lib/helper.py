import json
import os

class Helper:
    VERSION = "2.0"
    
    def __init__(self, argv):
        self.argv = argv
        self.Banner()
        self.ValidateArgv()
        self.config = {}
    
    def ValidateArgv(self):
        if len(self.argv) < 3:
            self.HelpMenu()
            self.ExitShowError("Missing arguments.")
            
    def HelpMenu(self):
        print "Usage: %s [config] [output]\n\n\tconfig\tConfig file that contain generator information\n\toutput\tOutput filename for the macro" % self.argv[0]
        
    def Banner(self):
        print "MMG.Malicious Macro Generator v%s - RingZer0 Team\nAuthor: Mr.Un1k0d3r mr.un1k0d3r@gmail.com\n" % Helper.VERSION
        
    def ProcessCompleted(self):
        self.PrintSuccess("Generation completed.")    
    
    def ExitShowError(self, error):
        print "\n[-] Error: %s" % error
        exit(0)
        
    def PrintSuccess(self, message):
        print "[+] %s" % message
        
    def ParseConfig(self):
        buffer = self.LoadFile(self.argv[1])
        try:
            self.config = json.loads(buffer)
        except:
            self.ExitShowError("\"%s\" is not a valid config file." % self.argv[1])
        return self
    
    def GetConfig(self, key):
        if self.config.has_key(key):
            return self.config[key]
        else:
            self.ExitShowError("\"%s\" key not found in the config file." % key)
        
    def ShowConfigDescription(self):
        buffer = self.GetConfig("description")
        self.PrintSuccess("Loading the following payload:\n\n%s\n" % buffer)
        return self            
        
    def LoadFile(self, filename):
        if os.path.exists(filename):
            buffer = open(filename, "rb").read()
            return buffer
        else:
            self.ExitShowError("\"%s\" file not found." % filename)
            
    def SaveFile(self, filename, buffer):
        try:
            open(filename, "wb").write(buffer)
        except:
            self.ExitShowError("Failed to save \"%s\"." % filename)
        self.PrintSuccess("\"%s\" successfully saved to the disk." % filename)
        return self