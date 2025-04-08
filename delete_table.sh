#!/bin/bash
db_name=$1
read  -p  "Enter Table you want to delete: " table_name
table_path=DataBases/$db_name/$table_name

if [ ! -f "$table_path" ]; then

    echo "==========================="	
    echo "Table does not exist!!!!!!"
    echo "==========================="

    ./manipulate_db.sh $1
else

    # delete table Content
    #rm -ir $table_path
    #echo "$table_name was deleted Sucessfully!!!!"
    
   	echo -e "Are you Sure You Want To delete $table_name Table? y/n \c"
	read choice;
	case $choice in
		 [Yy]* ) 
			rm -r $table_path
                	echo "============================================"
         		echo "Table $table_name deleted successfully!!!!!!"
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
  
    ./manipulate_db.sh $1

fi
