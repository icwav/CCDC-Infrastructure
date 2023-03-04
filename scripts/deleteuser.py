import random
import os

Names = ["Ivan", "Jaylon", "Friday", "Soto", "Ethan", "Issac", "Christian", "Wesley", "fannypackguy", "Marc", "Erinea", "Coulson", "Nestler", "Charles", "Alberto", "Hunter", "Aurek", "Aubrey", "Abigail", "Jason", "Moya", "Jose", "Nathan", "goblino", "bruh", "Jackie", "Andy", "Vannessa", "Thomas", "Peter"]

for i in range(100):
    user =(random.choice(Names))
    cmd = 'sudo userdel ' + user + ''
    os.system(cmd)