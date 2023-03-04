import random
import os


###SYSTEM ADMINISTRATORS: DONT FORGET TO DELETE THIS FILE AFTER RUNNING IT AS IT HAS ALL USERS PASSWORDS IN IT###

Names = ["ivan", "jaylon", "friday", "soto", "ethan"," eduardo", "issac", "christian", "wesley", "fannypackguy", "marc", "erinea", "coulson", "nestler", "charles", "alberto", "hunter", "aurek", "aubrey", "abigail", "jason", "moya", "jose", "nathan", "goblino", "bruh", "jackie", "andy", "vannessa", "thomas", "peter", "maddi", "bingus"]

for i in range(100):
    randomuser = (random.choice(Names))
    #this one-liner creates new users for each employee with their passwords in plaintext
    creation = 'sudo useradd -m -p password123 -s /bin/bash ' + randomuser + ''
    os.system(creation)