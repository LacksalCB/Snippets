#!/bin/bash

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
    echo "1: Makefile       (Generic Makefile for C/CPP)"
    echo "2: HelloC         (Hello world for C)"
    echo "3: HelloCPP    (Hello world for CPP)"
	echo "install: copy local templates to /usr/local/lib/snippets for universal access"
    echo ""
	echo "Which Snippet would you like to chose?"   
    read snippet
    copy_snippet $snippet
else
    copy_snippet $1
fi
