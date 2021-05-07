# ----
# GIT Commits Bomber
#
# A tool which provides the features of mass commits bombing in any respective GIT repository. Leave the bomber on for a day, and your repository may reach a million fake commits. The repository's commits signature depends upon the user's GPG key verification with github / gitlab / any git web-service he/she is using. The tool is written in shell scripting / bash scripting. Warning : The tool is created for testing and fun purpose, do not intend it to use for any further malicious purposes. Otherwise, you and only you will be responsible for that incident.
# You can freely check the source code, and even you can contribute to this project to make it more better. Contribute either in the main shell script, or just do it in the docs section. This project lacks a proper documentation anyways.
#
# Dependencies :
# 1. git (cli client)
#
# Author : Rishav Das (https://github.com/rdofficial/)
# Created on : April 25, 2021
#
# Last modified by : Rishav Das (https://github.com/rdofficial/)
# Last modified on : - May 7, 2021
#
# Changed made in last modification :
# 1. Added commented docs.
# 2. Added the feature of colored output and edited some printing errors and else.
#
# Authors contributed to this script (Add your name below if you have contributed) :
# 1. Rishav Das (github:https://github.com/rdofficial/, email:rdofficial192@gmail.com)
#
# ----

# First, we define all the functions that are used in this script

function commit {
	# The function to do a commit on the current folder (GIT Repository). The function just does 1 commit, and we can use this function in a loop in order to make mass commits.

	commitMessage="Mass commit on - "$( date )
	command=$( git add --a )
	command=$( git commit -m "${commitMessage}" )
}

function emptyCommit {
	# The function to an empty commit on the current folder (GIT repository). The function just does 1 commit, and we can call this function in a loop in order to do a series of empty commits or to say in other words, we can do mass commits.

	command=$( git commit -m "Empty mass commit on - $( date )" --allow-empty )
}

# The main script starts here

# Defining the ANSII color code variables for colored output
RED="\033[91m"
GREEN="\033[92m"
YELLOW="\033[93m"
BLUE="\033[94m"
RED_REV="\033[07;91m"
YELLOW_REV="\033[07;93m"
DEFCOL="\033[00m"

# Printing the heading on the console screen
echo -e "${YELLOW_REV}[ GIT Commits Bomber ]${DEFCOL}\n"

# Printing the main menu to the user and asking to enter an option
echo -e "Choose any of the options below :"
echo -e "${YELLOW}[${DEFCOL}1${YELLOW}]${DEFCOL} Default mass commits bombing"
echo -e "${YELLOW}[${DEFCOL}2${YELLOW}]${DEFCOL} Fixed file mass commits bombing"
echo -e "${YELLOW}[${DEFCOL}3${YELLOW}]${DEFCOL} Default mass commits bombing with resetting the file every commit"
echo -e "${YELLOW}[${DEFCOL}4${YELLOW}]${DEFCOL} Fixed file mass commits bombing with resetting the file every commit"
echo -e "${YELLOW}[${DEFCOL}5${YELLOW}]${DEFCOL} Empty mass commits\n"
read -p "Enter your choice : " choice

# Checking the user entered option
if [[ $choice == "1" ]]; then
	# If the user entered the option to mass commit an existing GIT repository, then we continue to complete the task

	# Displaying some warning messages to the user
	clear
	echo -e "\n${RED}[${DEFCOL} Some points to be noted before proceeding :\n1. Make sure that GIT software is installed properly on the system you are currently operating on.\n2. Make sure you are in the folder that you want to mass commit bomb on, otherwise wrong folders will be mass bombed.\n3. After the commits bombing, don't forget to push the changes to the remote origin. ${RED}]${DEFCOL}\n"

	# Asking the user for the amount of commits that are to be made
	read -p "Enter the amount of commits : " amountOfCommits

	# Starting the bombing process
	echo -e "\n${BLUE}STARTING THE COMMITS BOMBING...${DEFCOL}[${YELLOW}!${DEFCOL}]"
	echo -e "Changes will be made by default to the file '${GREEN}test.txt${DEFCOL}'...[${YELLOW}!${DEFCOL}]\n"
	startedOn=$( date )
	for commitNumber in $( seq 1 ${amountOfCommits} ); do
		# First making changes in the source files for allowing for the commits
		echo "Change for the commit-${commitNumber} on $( date ). This commit was made for the mass commit bombing started on ${startedOn}" >> test.txt

		# Calling the commits bomber function in order to do a commit with currently made changes
		commit
		echo -e "[${GREEN}!${DEFCOL}] Commit-${GREEN}${commitNumber}${DEFCOL} made successfully"
	done

	echo -e "\nFINISHED COMMITS BOMBING...[${GREEN}!${DEFCOL}]"
elif [[ $choice == "2" ]]; then
	# If the user entered the option to mass commit an existing GIT repository with changing just a fixed file, then we continue to complete the task

	# Displaying some warning messages to the user
	clear
	echo -e "\n${RED}[${DEFCOL} Some points to be noted before proceeding :\n1. Make sure that GIT software is installed properly on the system you are currently operating on.\n2. Make sure you are in the folder that you want to mass commit bomb on, otherwise wrong folders will be mass bombed.\n3. Make sure the filename you entered is of proper extension.\n4. After the commits bombing, don't forget to push the changes to the remote origin. ${RED}]${DEFCOL}\n"

	# Asking the user for the amount of commits that are to be made
	read -p "Enter the amount of commits : " amountOfCommits

	# Asking for the filename with extension to which changes are to be made
	read -p "Enter the filename [with extension] to which changes are to be made : " filename

	# Starting the bombing process
	echo -e "\n${BLUE}STARTING THE COMMITS BOMBING...${DEFCOL}[${YELLOW}!${DEFCOL}]"
	echo -e "Changes are to be made to the file '${GREEN}${filename}${DEFCOL}'...[${YELLOW}!${DEFCOL}]\n"
	startedOn=$( date )
	for commitNumber in $( seq 1 ${amountOfCommits} ); do
		# First making changes in the source files for allowing for the commits
		echo "Change for the commit-${commitNumber} on $( date ). This commit was made for the mass commit bombing started on ${startedOn}" >> $filename

		# Calling the commits bomber function in order to do a commit with currently made changes
		commit
		echo -e "[${GREEN}!${DEFCOL}] Commit-${GREEN}${commitNumber}${DEFCOL} made successfully"
	done

	echo -e "\nFINISHED COMMITS BOMBING...[${GREEN}!${DEFCOL}]"
elif [[ $choice == "3" ]]; then
	# If the user choosed the option to mass commit an existing GIT repository but with reseting the file at every change, then we continue to complete the task

	# Displaying some warning messages to the user
	clear
	echo -e "\n${RED}[${DEFCOL} Some points to be noted before proceeding :\n1. Make sure that GIT software is installed properly on the system you are currently operating on.\n2. Make sure you are in the folder that you want to mass commit bomb on, otherwise wrong folders will be mass bombed.\n3. After the commits bombing, don't forget to push the changes to the remote origin. ${RED}]${DEFCOL}\n"

	# Asking the user for the amount of commits that are to be made
	read -p "Enter the amount of commits : " amountOfCommits

	# Starting the bombing process
	echo -e "\n${BLUE}STARTING THE COMMITS BOMBING...${DEFCOL}[${YELLOW}!${DEFCOL}]"
	echo -e "Changes will be made by default to the file '${GREEN}test.txt${DEFCOL}'...[${YELLOW}!${DEFCOL}]\n"
	startedOn=$( date )
	for commitNumber in $( seq 1 ${amountOfCommits} ); do
		# First making changes in the source files for allowing for the commits
		echo "Change for the commit-${commitNumber} on $( date ). This commit was made for the mass commit bombing started on ${startedOn}. Mass commit mode : Reseting the file on every change (commit)." > test.txt

		# Calling the commits bomber function in order to do a commit with currently made changes
		commit
		echo -e "[${GREEN}!${DEFCOL}] Commit-${GREEN}${commitNumber}${DEFCOL} made successfully"
	done

	echo -e "\nFINISHED COMMITS BOMBING...[${GREEN}!${DEFCOL}]"
elif [[ $choice == "4" ]]; then
	# If the user choosed the option to mass commit an existing GIT repository but with reseting the user specified file at every change, then we continue to complete the task

	# Displaying some warning messages to the user
	clear
	echo -e "\n${RED}[${DEFCOL} Some points to be noted before proceeding :\n1. Make sure that GIT software is installed properly on the system you are currently operating on.\n2. Make sure you are in the folder that you want to mass commit bomb on, otherwise wrong folders will be mass bombed.\n3. Make sure the filename you entered is of proper extension.\n4. After the commits bombing, don't forget to push the changes to the remote origin. ${RED}]${DEFCOL}\n"

	# Asking the user for the amount of commits that are to be made
	read -p "Enter the amount of commits : " amountOfCommits

	# Asking for the filename with extension to which changes are to be made
	read -p "Enter the filename [with extension] to which changes are to be made : " filename

	# Starting the bombing process
	echo -e "\n${BLUE}STARTING THE COMMITS BOMBING...${DEFCOL}[${YELLOW}!${DEFCOL}]"
	echo -e "Changes are to be made to the file '${GREEN}${filename}${DEFCOL}'...[${YELLOW}!${DEFCOL}]\n"
	startedOn=$( date )
	for commitNumber in $( seq 1 ${amountOfCommits} ); do
		# First making changes in the source files for allowing for the commits
		echo "Change for the commit-${commitNumber} on $( date ). This commit was made for the mass commit bombing started on ${startedOn}. Mass commit mode : Reseting the file on every change (commit)." > $filename

		# Calling the commits bomber function in order to do a commit with currently made changes
		commit
		echo -e "[${GREEN}!${DEFCOL}] Commit-${GREEN}${commitNumber}${DEFCOL} made successfully"
	done

	echo -e "\nFINISHED COMMITS BOMBING...[${GREEN}!${DEFCOL}]"
elif [[ $choice == "5" ]]; then
	# If the user chooses the option to do empty mass commits, then we continue to complete the task

	# Displaying some warning messages to the user
	clear
	echo -e "\n${RED}[${DEFCOL} Some points to be noted before proceeding : \n1. Make sure the GIT software is installed properly on the system you are currently operating on.\n2. Make sure you are in the folder that you want to mass commit bomb on, otherwise wrong folders will be mass bombed.\n ${RED}]${DEFCOL}"

	# Asking the user for the amounts of commits to be done
	read -p "Enter the amount of commits (0 for inifinite) : " amountOfCommits

	# Checking wheter the user wants infinite commits or not
	if [[ $amountOfCommits == "0" ]]; then
		# If the user chooses to do infinite commits, then we continue to do so

		commitNumber=0
		while true; do
			# Using an while..true loop for doing an infinite loop

			# Calling the empty commit function
			emptyCommit
			commitNumber=$(($commitNumber+1))
			echo -e "[${GREEN}!${DEFCOL}] Empty commit-${GREEN}${commitNumber}${DEFCOL} made successfully"
		done
	else
		# If the user enters any other value other than 0, then we continue

		for commitNumber in $( seq 1 ${amountOfCommits} ); do
			# Calling the empty commit function
			emptyCommit
			echo -e "[${GREEN}!${DEFCOL}] Empty commit-${GREEN}${commitNumber}${DEFCOL} made successfully"
		done
	fi

	echo -e "\nFINISHED COMMITS BOMBING...[${GREEN}!${DEFCOL}]"
elif [[ $choice == "0" ]]; then
	# If the user entered the option to exit the script, then we exit the script

	exit
else
	# If the user entered option is undefined, then we display the error message to the user

	echo -e "${RED_REV}[ Error : No such options '${choice}' ]${DEFCOL}"
fi
