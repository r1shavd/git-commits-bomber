# The bash script for mass bombing the git commits for a particular repository.
#
# Author : Rishav Das
#

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

# Printing the main menu to the user and asking to enter an option
printf "Choose any of the options below :\n\n1. Initialize a GIT repository\n2. Mass commit bombing [default] \n3. Fixed file mass commit bombing\n4. Mass commit bombing with reseting the file [default]\n5. Fixed file mass commit bombing with reseting the file\n0. Exit\n\n"
echo -e "Choose any of the options below :"
echo -e "[1] Default mass commits bombing"
echo -e "[2] Fixed file mass commits bombing"
echo -e "[3] Default mass commits bombing with resetting the file every commit"
echo -e "[4] Fixed file mass commits bombing with resetting the file every commit"
echo -e "[5] Mass empty commits\n"
read -p "Enter your choice : " choice

# Checking the user entered option
if [[ ${choice} == "1" ]]; then
	# If the user entered the option to mass commit an existing GIT repository, then we continue to complete the task

	# Displaying some warning messages to the user
	clear
	echo -e "\nSome points to be noted before proceeding :\n1. Make sure that GIT software is installed properly on the system you are currently operating on.\n2. Make sure you are in the folder that you want to mass commit bomb on, otherwise wrong folders will be mass bombed.\n3. After the commits bombing, don't forget to push the changes to the remote origin.\n"

	# Asking the user for the amount of commits that are to be made
	read -p "Enter the amount of commits : " amountOfCommits

	# Starting the bombing process
	echo -e "\nSTARTING THE COMMITS BOMBING...[!]"
	echo -e "Changes will be made by default to the file 'test.txt'...[!]"
	echo -e ""
	startedOn=$( date )
	for commitNumber in $( seq 1 ${amountOfCommits} ); do
		# First making changes in the source files for allowing for the commits
		echo "Change for the commit-${commitNumber} on $( date ). This commit was made for the mass commit bombing started on ${startedOn}" >> test.txt

		# Calling the commits bomber function in order to do a commit with currently made changes
		commit
		echo -e "[!] Commit-${commitNumber} made successfully"
	done

	echo -e "\nFINISHED COMMITS BOMBING...[!]"
elif [[ ${choice} == "2" ]]; then
	# If the user entered the option to mass commit an existing GIT repository with changing just a fixed file, then we continue to complete the task

	# Displaying some warning messages to the user
	clear
	echo -e "\nSome points to be noted before proceeding :\n1. Make sure that GIT software is installed properly on the system you are currently operating on.\n2. Make sure you are in the folder that you want to mass commit bomb on, otherwise wrong folders will be mass bombed.\n3. Make sure the filename you entered is of proper extension.\n4. After the commits bombing, don't forget to push the changes to the remote origin.\n"

	# Asking the user for the amount of commits that are to be made
	read -p "Enter the amount of commits : " amountOfCommits

	# Asking for the filename with extension to which changes are to be made
	read -p "Enter the filename [with extension] to which changes are to be made : " filename

	# Starting the bombing process
	echo -e "\nSTARTING THE COMMITS BOMBING...[!]"
	echo -e "Changes are to be made to the file '${filename}'...[!]"
	startedOn=$( date )
	for commitNumber in $( seq 1 ${amountOfCommits} ); do
		# First making changes in the source files for allowing for the commits
		echo "Change for the commit-${commitNumber} on $( date ). This commit was made for the mass commit bombing started on ${startedOn}" >> $filename

		# Calling the commits bomber function in order to do a commit with currently made changes
		commit
		echo -e "[!] Commit-${commitNumber} made successfully"
	done

	echo -e "\nFINISHED COMMITS BOMBING...[!]"
elif [[ ${choice} == "3" ]]; then
	# If the user choosed the option to mass commit an existing GIT repository but with reseting the file at every change, then we continue to complete the task

	# Displaying some warning messages to the user
	clear
	echo -e "\nSome points to be noted before proceeding :\n1. Make sure that GIT software is installed properly on the system you are currently operating on.\n2. Make sure you are in the folder that you want to mass commit bomb on, otherwise wrong folders will be mass bombed.\n3. After the commits bombing, don't forget to push the changes to the remote origin.\n"

	# Asking the user for the amount of commits that are to be made
	read -p "Enter the amount of commits : " amountOfCommits

	# Starting the bombing process
	echo -e "\nSTARTING THE COMMITS BOMBING...[!]"
	echo -e "Changes will be made by default to the file 'test.txt'...[!]"
	echo -e ""
	startedOn=$( date )
	for commitNumber in $( seq 1 ${amountOfCommits} ); do
		# First making changes in the source files for allowing for the commits
		echo "Change for the commit-${commitNumber} on $( date ). This commit was made for the mass commit bombing started on ${startedOn}. Mass commit mode : Reseting the file on every change (commit)." > test.txt

		# Calling the commits bomber function in order to do a commit with currently made changes
		commit
		echo -e "[!] Commit-${commitNumber} made successfully"
	done

	echo -e "\nFINISHED COMMITS BOMBING...[!]"
elif [[ ${choice} == "4" ]]; then
	# If the user choosed the option to mass commit an existing GIT repository but with reseting the user specified file at every change, then we continue to complete the task

	# Displaying some warning messages to the user
	clear
	echo -e "\nSome points to be noted before proceeding :\n1. Make sure that GIT software is installed properly on the system you are currently operating on.\n2. Make sure you are in the folder that you want to mass commit bomb on, otherwise wrong folders will be mass bombed.\n3. Make sure the filename you entered is of proper extension.\n4. After the commits bombing, don't forget to push the changes to the remote origin.\n"

	# Asking the user for the amount of commits that are to be made
	read -p "Enter the amount of commits : " amountOfCommits

	# Asking for the filename with extension to which changes are to be made
	read -p "Enter the filename [with extension] to which changes are to be made : " filename

	# Starting the bombing process
	echo -e "\nSTARTING THE COMMITS BOMBING...[!]"
	echo -e "Changes are to be made to the file '${filename}'...[!]"
	startedOn=$( date )
	for commitNumber in $( seq 1 ${amountOfCommits} ); do
		# First making changes in the source files for allowing for the commits
		echo "Change for the commit-${commitNumber} on $( date ). This commit was made for the mass commit bombing started on ${startedOn}. Mass commit mode : Reseting the file on every change (commit)." > $filename

		# Calling the commits bomber function in order to do a commit with currently made changes
		commit
		echo -e "[!] Commit-${commitNumber} made successfully"
	done

	echo -e "\nFINISHED COMMITS BOMBING...[!]"
elif [[ $choice == "5" ]]; then
	# If the user chooses the option to do mass empty commits, then we continue to complete the task

	# Displaying some warning messages to the user
	clear
	echo -e "\nSome points to be noted before proceeding : \n1. Make sure the GIT software is installed properly on the system you are currently operating on.\n2. Make sure you are in the folder that you want to mass commit bomb on, otherwise wrong folders will be mass bombed.\n"

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
			echo -e "[!] Empty commit-${commitNumber} made successfully"
		done
	else
		# If the user enters any other value other than 0, then we continue

		for commitNumber in $( seq 1 ${amountOfCommits} ); do
			# Calling the empty commit function
			emptyCommit
			echo -e "[!] Empty commit-${commitNumber} made successfully"
		done
	fi

	echo -e "\nFINISHED COMMITS BOMBING...[!]"
elif [[ ${choice} == "0" ]]; then
	# If the user entered the option to exit the script, then we exit the script

	exit
else
	# If the user entered option is undefined, then we display the error message to the user

	echo -e "\033[07;91m[ Error : No such options '${choice}' ]\033[00m"
fi
