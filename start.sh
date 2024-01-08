#/bin/sh

# clear the screen
clear

# greet user
echo  "Hello Doctor! I am here to assist you in reaching a diagnosis."

# get symptom 
read -p  "What is the symptom you would like to explore? " symptom

# check symptom is in knowledge base
if grep -q  $symptom KnowBase.txt; then
	echo "Let's get some information about your patient suffering from:" $symptom
else
	echo "I don't know about that yet, sorry."
	if grep -q $symptom futureStudies.txt; then
		echo "I have it on my learning plan."
	else
		echo "Let me add $symptom to my future learning."
		echo $symptom >> futureStudies.txt
	fi
fi

