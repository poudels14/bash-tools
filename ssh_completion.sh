#Copyright Sagar Poudel
#This is a bash tool to auto complete "cd" command with you favorite folders/ most recent folders


BASH_TOOLS_HOME="$HOME/bash-tools/"
PYTHON_SCR="$BASH_TOOLS_HOME/cdd_helper.py"
CDD_MAP="$BASH_TOOLS_HOME/cdd_completion_map.csv"


_ssh(){
	CDD_COMPLETION_LIST="$(python $PYTHON_SCR $CDD_MAP get_keys)"
	local cur=${COMP_WORDS[COMP_CWORD]}
	COMPREPLY=( $( compgen -W "$CDD_COMPLETION_LIST" -- $cur ) )
}

cdd(){
	if [[ "$1" == "add" ]]
	then
		IFS="/" read -ra DIREC <<< "$(pwd)"
		LENGTH=$((${#DIREC[@]} - 1))
		hasValue="$(python $PYTHON_SCR $CDD_MAP has_key ${DIREC[LENGTH]})"
		if [[ "$hasValue" == "1" ]]
		then
			echo "Already added"
		else
			echo "${DIREC[LENGTH]},$(pwd)" >> $CDD_MAP
			echo "Added: ${DIREC[LENGTH]}"
			complete -o default -o bashdefault -F _cdd cdd
		fi
	elif [[ "$1" == "remove" ]] 
	then
		echo "$(python $PYTHON_SCR $CDD_MAP remove $2)"
		echo "$2 removed!"
		complete -o default -o bashdefault -F _cdd cdd
	else
		goto="$(python $PYTHON_SCR $CDD_MAP get_value $1)" 
		cd $goto
	fi
}
complete -o default -o bashdefault -F _cdd _cd cdd
