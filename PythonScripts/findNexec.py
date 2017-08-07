
import os
os.chdir('/tmp')
cmd = ['git init','git clone https://github.com/kukuriku/'+raw_input('enter repo:')]
command = 'sudo apt-get install git git-core -y'
os.system(command)
for command in cmd:
	os.system(command)
def find(name, path):
    for root, dirs, files in os.walk(path):
        if name in files:
            return os.path.join(root, name)
path = find('script.py', '/tmp')
length = len('script.sh')
path = path[:-length]
os.chdir(path)
command = 'bash script.sh'
p = os.system(command)






 











				

