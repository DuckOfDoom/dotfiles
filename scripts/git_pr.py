#!python

# Script makes `git push` then opens link for creating a pull request automatically

import subprocess
import webbrowser
import re

link_regex= r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)'
result = subprocess.run(['git', 'push'], text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT).stdout
print(result)
match = re.search(link_regex, result)
if match is not None:
    webbrowser.open(match.group(0), new=0, autoraise=True)
