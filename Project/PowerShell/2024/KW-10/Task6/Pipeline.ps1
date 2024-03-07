# Retrieve a list of all the members (methods and properties) of the Get-ChildItem cmdlet.
$PWD
$childItem = Get-ChildItem -Path $PWD #-Recurse -File
# Use Get-ChildItem to retrieve a list of the files in the current directory and the Get-Member cmdlet to retrieve a list of all the members
$childItem | Get-Member

# Retrieve a list of all the files in the current directory and then sort them ascending by size. 
# Use the Get-ChildItem cmdlet to retrieve the list of files and the Sort-Object cmdlet to sort them by size.


# Retrieve a list of all the processes currently running on the computer and then select the processes that have a high CPU usage (>50%). 
# Use the Get-Process cmdlet to retrieve the list of processes and the Where-Object cmdlet to select only the processes with a high CPU usage.


# Retrieve a list of all the services and select only the processes which are running. Display only the service name and the service description.
# Use the Get-Service cmdlet to retrieve a list of all services, the Where-Object cmdlet to select running processes and the Select-Object cmdlet to display  the service name and the service description.


# Retrieve a list of all the processes on the computer and then stop the processes that contain "Team" in the name. 


# Retrieve a list of all the local users username and last logon time and sort them by their last logon time. Don't list users, which have never logged on.


# Retrieve a list of all the files in the current directory and then select the files that have been modified in the past week. Sort them by their modification date.


