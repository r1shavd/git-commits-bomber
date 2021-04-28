# The bash script for mass bombing the git commits for a particular repository.
#
# Author : Rishav Das
#

function commitBomber {
	# The function to do a commit on the current folder (GIT Repository). The function just does 1 commit, and we can use this function in a loop in order to make mass commits.

	commitMessage="Mass commit on - "$( date )
	command=$( git add --a )
	command=$( git commit -m "${commitMessage}" )
}

function setRepository {
	# The function to set a repository with README.md and initial commits and all

	# Getting the user entered parameter for the repository name
	repositoryName=$1

	# Writting the README.md documentation file
	echo -e "# ${repositoryName}

The documentation yet to be updated." > README.md

	# Doing the initial commit for the current repository
	command=$( git init )
	command=$( git add --a )
	command=$( git commit -m "Initial commit")
	command=$( git branch -M main )

	# Checking if any remote address for the repository is provided by the user, the place where our repository is to be hosted.
	remoteOrigin=$2
	if [[ ${#remoteOrigin} < 8 ]]; then
		# If the user entered remote origin is less than 8 characters, then we term it as invalid and pass the process without completing it

		echo -e "INITIAL COMMIT DONE...[!]"
	else
		# If the user entered remote origin is more than or equal to 8 characters, then we continue the process to add a remote origin to the repository

		command=$( git remote add origin ${remoteOrigin} )
		command=$( git push origin main )
		echo -e "INITIAL COMMIT DONE...[!]"
		echo -e "REMOTE ORIGIN ADDED, AND COMMIT PUSHED...[!]"
	fi
}

# The main script starts here

# Printing the main menu to the user and asking to enter an option
printf "Choose any of the options below :\n\n1. Initialize a GIT repository\n2. Mass commit bombing [default] \n3. Fixed file mass commit bombing\n4. Mass commit bombing with reseting the file [default]\n5. Fixed file mass commit bombing with reseting the file\n0. Exit\n\n"
read -p "Enter your choice : " choice

# Checking the user entered option
if [[ ${choice} == "1" ]]; then
	# If the user entered the option to initialize a new GIT repository, then we continue to complete the task

	# Displaying some warning messages to the user
	clear
	echo -e "\nSome points to be noted before proceeding :\n1. Make sure that GIT software is installed properly on the system you are currently operating on.\n2. Make sure that you are currently in the folder that you want to make a GIT repository, otherwise wrong folders might be created as the GIT repositories.\n4. If you enter the remote origin, check after the process to make sure remote origin is pushed. Many times it fails to do so.\n"

	# Asking the user for the repository name to be initialized
	read -p "Enter the repository name : " $repositoryName

	# Asking for the remote origin for the GIT repository
	read -p "Enter the remote origin for the repository [ leave blank if none ] : " $remoteOrigin

	setRepository "${repositoryName}" "${remoteOrigin}"
elif [[ ${choice} == "2" ]]; then
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
		commitBomber
		echo -e "[!] Commit-${commitNumber} made successfully"
	done

	echo -e "\nFINISHED COMMITS BOMBING...[!]"
elif [[ ${choice} == "3" ]]; then
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
		commitBomber
		echo -e "[!] Commit-${commitNumber} made successfully"
	done

	echo -e "\nFINISHED COMMITS BOMBING...[!]"
elif [[ ${choice} == "4" ]]; then
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
		commitBomber
		echo -e "[!] Commit-${commitNumber} made successfully"
	done

	echo -e "\nFINISHED COMMITS BOMBING...[!]"
elif [[ ${choice} == "5" ]]; then
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
		commitBomber
		echo -e "[!] Commit-${commitNumber} made successfully"
	done

	echo -e "\nFINISHED COMMITS BOMBING...[!]"
elif [[ ${choice} == "0" ]]; then
	# If the user entered the option to exit the script, then we exit the script

	exit
else
	# If the user entered option is undefined, then we display the error message to the user

	echo -e "\033[07;91m[ Error : No such options '${choice}' ]\033[00m"
fi
