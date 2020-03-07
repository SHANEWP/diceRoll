#!/bin/bash
#Shane Panagakos
# allows the user to specify the number of sides a die has
# and generate a random number as if that die were rolled

echo "\nReady to roll a die\n(Type exit to quit)\n"

#loops through until stop is typed
while true
do
	echo "How many sides?"
	read input
	#checks if input is stop and exits
	if [[ $input = "exit" ]]
	then
		echo "Goodbye\n"
		exit 1
	#checks if the input is a positive integer
  elif [[ $input =~ ^[\-0-9]+$ ]]
	then
		#checks if the input is zero
		if [[ "$input" -gt "0" ]]
		then
			#generates a random number from 1 to the given number
			roll=$((RANDOM%$input+1))
			#checks if the die is a d20 and if a critical fail occures
			if [[ $roll == 1 ]] && [[ $input == 20 ]]
			then
				echo "You rolled a $roll!\nCritical fail!\n"
			#checks if the die is a d20 and a critical success occures
			elif [[ $roll == 20 ]] && [[ $input == 20 ]]
			then
				echo "You rolled a $roll!\nCritical success!\n"
			else
				echo "You rolled a $roll!\n"
			fi
		else
			echo "<Invalid input>\n"
		fi
	else
		echo "<Invalid input>\n"
	fi
done
