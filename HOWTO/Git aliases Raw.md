[alias]
    	st = status -bs
    	lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
    	b = branch -v
    	co = checkout
    	undo = reset --soft HEAD^
    	cm = commit -v
    	today = log --since=midnight --author='Maarten Claes' --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit