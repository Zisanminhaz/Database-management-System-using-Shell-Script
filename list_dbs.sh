#!/bin/bash
dir=DataBases
if [ "$(ls -A $dir)" ]; 
    
    then
    echo "======================="
    echo "AVAILABLE DATABASES IS:"
    echo "======================="
    ls $dir 
    echo "======================="
    ./main.sh

else 
    echo "========================="
    echo "NO AVAILABLE DATABASES!!!"
    echo "=========================="
    ./main.sh
    
fi
