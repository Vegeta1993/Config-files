#!/bin/bash

if [[ $( pgrep cmus ) ]]
then
	status=$( cmus-remote -Q | grep status\ | sed 's/status //' )
	if [[ "$status" = *playing*  ]]
	then
	  	name=`cmus-remote -Q | awk '$2=="title"{for(i=3;i<=NF;i++){printf "%s ", $i}; printf "\n"}'`
		echo -ne "$name"
	elif [[ "$status" = *paused* ]]
	then
		echo -ne ""
	elif [[ "$status" = *stopped* ]]
	then
		echo -ne ""
	fi
else
	  echo -ne ""
fi
