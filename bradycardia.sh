#!/bin/sh

echo "Bradycardia can be physiologic, pathologic, or pharmacologic in origin. Alteration of either the sinoatrial (SA) or atrioventricular (AV) conduction system may play a role."

echo "Symptoms of bradyarrhythmias include fatigue, dizziness or syncope, and dyspnea and angina."

read -p "Does your patient have any of these symptoms [y/n]?" p1a

if [[ $p1a =~ [Nn] ]]; then
	read -p "Is the patient an athlete? [y/n]" p1b
	if [[ $p1b =~ [Yy] ]]; then
		echo "Conditioned athletes often can have high resting vagal tone during the day."
	else
		read -p "How long is the sinus pause (in seconds)? " p1c
		if [[ $p1c -le 2 ]]; then
			echo "Sinus pauses up to 2 seconds in asymptomatic individuals can be considered normal."
		else
			read -p "Is there evidence of first/second degree Mobitz type I (Wenckebach) AV block on the ECG? [y/n]" p1d
			if [[ $p1d =~ [Yy] ]]; then
				echo "This looks like a case of Vagal Hypersensitivity."
			else
				echo "Hmm... maybe you should go back and take a detailed history. We might need to exclude other causes."
			fi
		fi
	fi
elif [[ $p1a =~ [Yy] ]]; then
	echo "So the bradycardia is probably not physiologic, and we need to rule out Pathologic and Pharmacologic causes."
	read -p "Is the patient on any of the following drugs: Diltiazem, Verapamil, Beta-blockers,  Digoxin, Amiodarone, Propafenone, Quinidine, Procainamide, or Disopyramide? [y/n]" p2a
	if [[ $p2a =~ [Yy] ]]; then
		echo "Which one? Type it out exactly as I listed above"
		read drug
		case $drug in
			Diltiazem|Verapamil)
			echo "AV node conduction is slowed down by Diltiazem and Verapamil."
			;;
			Beta-blockers)
			echo "AV node is blocked and there is withdrawal of sympathetic tone"
			;;
			Digoxin)
			echo "Vagal tone is increased."
			;;
			Amiodarone|Propafenone)
			echo "Calcium channel blockade is causing the AV node conduction to slow down."
			;;
			Quinidine|Procainamide|Disopyramide)
			echo "These drugs affect the sodium channels and are slowing down the infranodal conducting system."
			;;
		esac
	else
		echo "Let us explore pathologic causes, then."
	fi
else
	echo "Yes or No answers only, please!"
fi


