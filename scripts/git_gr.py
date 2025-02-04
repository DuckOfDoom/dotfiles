#!python

# Script for checking out branches using pattenrs. 
# Usable for both local and remote branches
# Usage:
#   - Add to your .gitconfig:
#     [alias]
#       gr = "!python ~/git_gr.py"
#   - $ git gr dev hapt
#       Will give you all branches that contain "dev" and "hapt". Like feature/SXR-1337-haptic-feedback/develop
#   - Call with no agruments to see all branches

import subprocess
import sys

nocolor = '\033[0m'  
red = '\033[0;31m'  
green = '\033[0;32m'
bGreen = '\033[0;92m'
white = '\033[0;37m'

merge = False

if (len(sys.argv) < 1):
    exit("First arg should be either 'checkout' or 'merge'")

if (sys.argv[1] == "merge"):
    merge = True
elif (sys.argv[1] == "checkout"):
    merge = False
else:
    exit(f"Unrecognized command '{sys.argv[1]}'")

if (len(sys.argv) > 2):
    patterns = sys.argv[2:]
    command = "git branch -a"
else:
    patterns = list("")
    command = "git branch"

branches = subprocess.run(command, capture_output=True).stdout.decode("utf-8").splitlines()
branches = [str(s).replace("origin/", "").replace("remotes/", "").strip() for s in branches[1:]]
branches = sorted(list(set(branches)))

current = list(filter(lambda b: "*" in b, branches))
if (len(current) > 0):
    print(f"Current branch is {bGreen}{current[0].replace('* ', '')}{nocolor}")

def matches(patterns, value):
    if "*" in value:
        return False

    for p in patterns:
        if p not in value: 
            return False
    return True


matches = list(filter(lambda b: matches(patterns, b), branches))

if (len(matches) == 0):
    print(f"{red} No branches containing '{patterns}' were found")
    exit()

command = "merge" if merge else "checkout"

if (len(matches) == 1):
    print(f"{green}Found a matching branch:\n {white}{matches[0]}{nocolor}\n")
    input(f"Press Enter to {command}...")

    subprocess.run(f"git {command} {matches[0]}")
    exit()

print(f"{green}Matched multiple branches:{nocolor}");
c = 1
for m in matches:
    print(f" {c}: {m}")
    c=c+1

selected = int(input(f"Please select which branch to {command}: "))
m = matches[selected - 1]
print(f"{green}Starting to {command} branch:\n{white}{m}{nocolor}")
subprocess.run(f"git {command} {m}")
