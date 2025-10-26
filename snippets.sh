#!/bin/bash

parse_command()
{
	if [ $1 = "list" ]; then
		while IFS=';' read -r -a lines; do
			echo -e "${lines[0]}: ${lines[1]}\t\t ${lines[2]}"	
		done < "templates.txt"
		echo -e "\nPlease select a snippet to copy to your clipboard:"
	fi
}

copy_snippet()
{
    if [ $1 = "1" ]; then
        echo "Copying Makefile to Clipboard!"
        xclip /usr/local/lib/snippets/Makefile.txt -selection c
    elif [ $1 = "2" ]; then
        echo "Copying C Hello World to Clipboard!"
        xclip /usr/local/lib/snippets/Hello_C.txt -selection c
    elif [ $1 = "3" ]; then
        echo "Copying CPP Hello World to Clipboard!"
        xclip /usr/local/lib/snippets/Hello_CPP.txt -selection c
	elif [ $1 = "install" ]; then
		echo "Copying templates to lib director"
		mv templates/* /usr/local/lib/snippets/
    fi
}

if [ $# -eq 0 ]; then
    echo "Enter \"list\" to display the list of available templates"
	echo "Enter \"help\" to display avilable commands"
	read cmd
	parse_command $cmd	

    read snippet
    copy_snippet $snippet
else
    copy_snippet $1
fi
