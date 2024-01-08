#/bin/sh


# clear the screen
clear

# build knowledge base
declare -a kb
kb=(`cat "KnowBase.txt"`)

# greet user
echo  "Hello Doctor! I am here to assist you in reaching a diagnosis."

# get symptom 
read -p  "What is the symptom you would like to explore? " symptom

# check symptom is in knowledge base
if [[ " ${kb[*]} " == " $symptom " ]]; then
	echo $symptom "is in my Knowledge Base. Let us begin."
	
else
	echo "These are the symptoms I have in my Knowledge Base:"

	# show Knowledge Base
	for (( i=0 ; i < ${#kb[@]}; i++ ))
	do
		echo "Symptom [$i]: ${kb[$i]}"
	done
	
	if grep -q $symptom futureStudies.txt; then
		echo "I have it already on my  future learning plan."
	else
		echo "I have now added '$symptom' to my future learning plan."
		echo $symptom >> futureStudies.txt
	fi
fi



