#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

SHOW_BY_ATOMIC_NUMBER() {
	if [[ $ELEMENT_AT_NUMBER_SYMBOL_NAME =~ ^[0-9]+$ ]]
	then
		#Query element by atomic number, because a number was given as an argument
		ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $ELEMENT_AT_NUMBER_SYMBOL_NAME")
		
		if [[ -z $ATOMIC_NUMBER ]]
		then
			#The atomic_number was not finded.
			echo "I could not find that element in the database."
		else
			#The atomic_number exist in the database.
			ATOMIC_NUMBER_FORMATTED=$(echo $ATOMIC_NUMBER | sed 's/ |/"/')

			ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ELEMENT_AT_NUMBER_SYMBOL_NAME")
			ELEMENT_NAME_FORMATTED=$(echo $ELEMENT_NAME | sed 's/ |/"/')

			ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number= $ELEMENT_AT_NUMBER_SYMBOL_NAME")
			ELEMENT_SYMBOL_FORMATTED=$(echo $ELEMENT_SYMBOL | sed 's/ |/"/')

			ELEMENT_TYPE=$($PSQL "SELECT type FROM types FULL JOIN properties ON types.type_id=properties.type_id WHERE atomic_number = $ELEMENT_AT_NUMBER_SYMBOL_NAME")
			ELEMENT_TYPE_FORMATTED=$(echo $ELEMENT_TYPE | sed 's/ |/"/')

			ELEMENT_ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ELEMENT_AT_NUMBER_SYMBOL_NAME")
			ELEMENT_ATOMIC_MASS_FORMATTED=$(echo $ELEMENT_ATOMIC_MASS | sed 's/ |/"/')

			ELEMENT_MELT_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ELEMENT_AT_NUMBER_SYMBOL_NAME")

			ELEMENT_BOIL_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ELEMENT_AT_NUMBER_SYMBOL_NAME")

			echo -e "The element with atomic number $ATOMIC_NUMBER_FORMATTED is $ELEMENT_NAME_FORMATTED ($ELEMENT_SYMBOL_FORMATTED). It's a $ELEMENT_TYPE_FORMATTED, with a mass of $ELEMENT_ATOMIC_MASS_FORMATTED amu. $ELEMENT_NAME_FORMATTED has a melting point of $(echo $ELEMENT_MELT_POINT | sed -r 's/^ *| *$//g') celsius and a boiling point of $(echo $ELEMENT_BOIL_POINT | sed -r 's/^ *| *$//g') celsius."
		fi
		
	else
		#The argument was not a number, then you should query the element rather by name or symbol.
		ATOMIC_NUMBER_BY_NAME=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$ELEMENT_AT_NUMBER_SYMBOL_NAME'")
		ATOMIC_NUMBER_BY_SYMBOL=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$ELEMENT_AT_NUMBER_SYMBOL_NAME'")
		
		if [[ -z $ATOMIC_NUMBER_BY_NAME ]] && [[ -z $ATOMIC_NUMBER_BY_SYMBOL ]]; then
			echo "I could not find that element in the database."
		
		elif [[ -z $ATOMIC_NUMBER_BY_NAME ]]; then
			#This means that the input is a symbol.
			ATOMIC_NUMBER_FORMATTED=$(echo $ATOMIC_NUMBER_BY_SYMBOL | sed 's/ |/"/')

			ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER_FORMATTED")
			ELEMENT_NAME_FORMATTED=$(echo $ELEMENT_NAME | sed 's/ |/"/')

			ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number= $ATOMIC_NUMBER_FORMATTED")
			ELEMENT_SYMBOL_FORMATTED=$(echo $ELEMENT_SYMBOL | sed 's/ |/"/')

			ELEMENT_TYPE=$($PSQL "SELECT type FROM types FULL JOIN properties ON types.type_id=properties.type_id WHERE atomic_number = $ATOMIC_NUMBER_FORMATTED")
			ELEMENT_TYPE_FORMATTED=$(echo $ELEMENT_TYPE | sed 's/ |/"/')

			ELEMENT_ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER_FORMATTED")
			ELEMENT_ATOMIC_MASS_FORMATTED=$(echo $ELEMENT_ATOMIC_MASS | sed 's/ |/"/')

			ELEMENT_MELT_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER_FORMATTED")

			ELEMENT_BOIL_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER_FORMATTED")

			echo -e "The element with atomic number $ATOMIC_NUMBER_FORMATTED is $ELEMENT_NAME_FORMATTED ($ELEMENT_SYMBOL_FORMATTED). It's a $ELEMENT_TYPE_FORMATTED, with a mass of $ELEMENT_ATOMIC_MASS_FORMATTED amu. $ELEMENT_NAME_FORMATTED has a melting point of $(echo $ELEMENT_MELT_POINT | sed -r 's/^ *| *$//g') celsius and a boiling point of $(echo $ELEMENT_BOIL_POINT | sed -r 's/^ *| *$//g') celsius."
		elif [[ -z $ATOMIC_NUMBER_BY_SYMBOL ]]; then
			#This means that the input is a name.
				
			ATOMIC_NUMBER_FORMATTED=$(echo $ATOMIC_NUMBER_BY_NAME | sed 's/ |/"/')

			ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER_FORMATTED")
			ELEMENT_NAME_FORMATTED=$(echo $ELEMENT_NAME | sed 's/ |/"/')

			ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number= $ATOMIC_NUMBER_FORMATTED")
			ELEMENT_SYMBOL_FORMATTED=$(echo $ELEMENT_SYMBOL | sed 's/ |/"/')

			ELEMENT_TYPE=$($PSQL "SELECT type FROM types FULL JOIN properties ON types.type_id=properties.type_id WHERE atomic_number = $ATOMIC_NUMBER_FORMATTED")
			ELEMENT_TYPE_FORMATTED=$(echo $ELEMENT_TYPE | sed 's/ |/"/')

			ELEMENT_ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER_FORMATTED")
			ELEMENT_ATOMIC_MASS_FORMATTED=$(echo $ELEMENT_ATOMIC_MASS | sed 's/ |/"/')

			ELEMENT_MELT_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER_FORMATTED")

			ELEMENT_BOIL_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER_FORMATTED")

			echo -e "The element with atomic number $ATOMIC_NUMBER_FORMATTED is $ELEMENT_NAME_FORMATTED ($ELEMENT_SYMBOL_FORMATTED). It's a $ELEMENT_TYPE_FORMATTED, with a mass of $ELEMENT_ATOMIC_MASS_FORMATTED amu. $ELEMENT_NAME_FORMATTED has a melting point of $(echo $ELEMENT_MELT_POINT | sed -r 's/^ *| *$//g') celsius and a boiling point of $(echo $ELEMENT_BOIL_POINT | sed -r 's/^ *| *$//g') celsius."
		fi
	fi
}

ELEMENT_AT_NUMBER_SYMBOL_NAME="$1"

if [[ -z $ELEMENT_AT_NUMBER_SYMBOL_NAME ]]
then
	echo "Please provide an element as an argument."
	#read ELEMENT_AT_NUMBER_SYMBOL_NAME
	#SHOW_BY_ATOMIC_NUMBER
else
	SHOW_BY_ATOMIC_NUMBER
fi
