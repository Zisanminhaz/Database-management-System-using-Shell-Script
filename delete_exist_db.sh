#!/bin/bash
echo -e "Enter a database name to delete: \c"
read db_name
db_path="./DataBases/$db_name"

if [ ! -d "$db_path" ]; 
then
  echo "==================================="
  echo "Database $db_name doesn't exist!!!"
  echo "==================================="

    ./main.sh

else
  
  #rm -r "$db_path"
  #echo "============================================"
  #echo "Database $db_name deleted successfully!!!!!!"
  #echo "============================================"
  
  echo -e "Are you Sure You Want To delete $db_name Database? y/n \c"
  read choice;
	case $choice in
		 [Yy]* ) 
			rm -r "$db_path"
			echo "============================================"
         		echo "Database $db_name deleted successfully!!!!!!"
         		echo "============================================"
			;;
		 [Nn]* ) 
      			echo "======================"
			echo "Deleting Canceled!!!"
      			echo "======================"
			;;
		 * ) 
		 	echo "===================="
			echo "Please choice y/n"
			echo "===================="
			;;
	esac
  
    ./main.sh

fi
