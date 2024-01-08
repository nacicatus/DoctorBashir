#!/bin/sh

echo "Bradycardia can be physiologic, pathologic, or pharmacologic in origin." | pv -qL 20
echo "Alteration of either the sinoatrial (SA) or atrioventricular (AV) conduction system may play a role." | pv -qL 20
echo
echo "Symptoms of bradyarrhythmias include fatigue, dizziness or syncope, and dyspnea and angina." | pv -qL 20

echo "Does your patient have any of these symptoms [y/n]?" | pv -qL 20 
read p1a

if [[ $p1a =~ [Nn] ]]; then
	echo "Is the patient an athlete? [y/n]" | pv -qL 20
	read p1b
	if [[ $p1b =~ [Yy] ]]; then
		echo "Conditioned athletes often can have high resting vagal tone during the day." | pv -qL 20
	else
		echo "How long is the sinus pause (in seconds)? " | pv -qL 20
		read p1c
		if [[ $p1c -le 2 ]]; then
			echo "Sinus pauses up to 2 seconds in asymptomatic individuals can be considered normal." | pv -qL 20
			echo "Diagnosis: Normal" | pv -qL 20
		else
			echo "Is there evidence of first/second degree Mobitz type I (Wenckebach) AV block on the ECG? [y/n]" | pv -qL 20
			read p1d
			if [[ $p1d =~ [Yy] ]]; then
				echo "Diagnosis: Vagal Hypersensitivity." | pv -qL 20
			else
				echo "Hmm... maybe you should go back and take a detailed history. We might need to exclude other causes." | pv -qL 20
			fi
		fi
	fi
elif [[ $p1a =~ [Yy] ]]; then
	echo "So the bradycardia is probably not physiologic, and we need to rule out Pathologic and Pharmacologic causes." | pv -qL 20
	echo "Is the patient on any of the following drugs: Diltiazem, Verapamil, Beta-blockers,  Digoxin, Amiodarone, Propafenone, Quinidine, Procainamide, or Disopyramide? [y/n]" | pv -qL 20
	read p2a
	if [[ $p2a =~ [Yy] ]]; then
		echo "Which one? Type it out exactly as I listed above" | pv -qL 20
		read drug
		case $drug in
			Diltiazem|Verapamil)
			echo "AV node conduction is slowed down by Diltiazem and Verapamil." | pv -qL 20
			echo "Diagnosis: Drug-induced bradycardia" | pv -qL 20
			;;
			Beta-blockers)
			echo "AV node is blocked and there is withdrawal of sympathetic tone." | pv -qL 20
			echo "Diagnosis: Drug-induced bradycardia" | pv -qL 20
			;;
			Digoxin)
			echo "Vagal tone is increased by Digoxin." | pv -qL 20
			echo "Diagnosis: Drug-induced bradycardia" | pv -qL 20
			;;
			Amiodarone|Propafenone)
			echo "Calcium channel blockade is causing the AV node conduction to slow down." | pv -qL 20
			echo "Diagnosis: Drug-induced bradycardia" | pv -qL 20
			;;
			Quinidine|Procainamide|Disopyramide)
			echo "These drugs affect the sodium channels and are slowing down the infranodal conducting system." | pv -qL 20
			echo "Diagnosis: rug-induced bradycardia" | pv -qL 20
			;;
		esac
	else
		echo "Let us explore pathologic causes, then." | pv -qL 20
	fi
else
	echo "Yes or No answers only, please!" | pv -qL 20
fi


