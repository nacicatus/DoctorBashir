#/bin/sh


# clear the screen
clear

# draw greeting
echo 

# build knowledge base
declare -a kb
kb=(`cat "KnowBase.txt"`)

# greet user
echo  "Hello Doctor! I am here to assist you in reaching a diagnosis." | pv -qL 20

# get symptom 

echo  "What is the symptom you would like to explore? " | pv -qL 20
read symptom
# check symptom is in knowledge base
if [[ " ${kb[*]} " == " $symptom " ]]; then
	source bradycardia.sh	
else
	echo "These are the symptoms I have in my Knowledge Base:" | pv -qL 20

	# show Knowledge Base
	for (( i=0 ; i < ${#kb[@]}; i++ ))
	do
		echo "Symptom [$i]: ${kb[$i]}"
	done
	
	if grep -q $symptom futureStudies.txt; then
		echo "I have it already on my  future learning plan." | pv -qL 20
	else
		echo "I have now added '$symptom' to my future learning plan." | pv -qL 20
		echo $symptom >> futureStudies.txt 
	fi
fi



