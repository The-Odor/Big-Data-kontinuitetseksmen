Instructions for use:
Assumming a Docker-environment has been started with a linked folder using “docker run -it -v [FilePath to WorkingDirectory]:/Files kristiania/hadoop /start” or something similar

1.	Place the necessary files into a folder named “Dataset” (necessary files being Users.xml and Posts.xml. The others were deemed unnecessary for the given tasks)
2.	Copy the folder “Dataset” into Docker environment using -copyFromLocal
3.	Maneuver to a given task folder (task1c, task3b, etc.) and run the bash-script in the folder
