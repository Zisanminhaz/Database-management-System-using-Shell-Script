#!/bin/bash
if [ -n "$(ls DataBases/$1)" ]; 

    then
        echo "Existing Tables in $1: "
        echo "========================"

        ls DataBases/$1
        echo "========================"
         
else
        echo "========================"
        echo "NO Tables to Show !!!! "
        echo "========================"

fi
