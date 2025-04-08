#!/bin/bash
db_name=$1
read  -p  "Enter Table you want to update: " table_name
table_path=DataBases/$db_name/$table_name

if [ ! -f "$table_path" ]; then

    echo "==========================="
    echo "Table does not exist!!!!!!"
    echo "==========================="

    ./manipulate_db.sh $db_name

else

    #column you want to update into
    read  -p  "Enter column you want to update: " col_update
                                                          
    check_col=`awk -v RS=':' "/$col_update/ "'{print NR}' DataBases/$db_name/.metadata/$table_name.meta`
    col_NR=`awk -v RS=':' "/$col_update/ "'{print NR}' DataBases/$db_name/.metadata/$table_name.meta`

    if [ -z $check_col ]; then

        echo "==========================="
        echo "Column does not exist!!!!!"
        echo "==========================="

        ./manipulate_db.sh $db_name

    else

        #value you want to change
        read  -p  "Enter $col_update value you want to change: " value_update

        value_NR=`cut -d: -f $col_NR DataBases/$db_name/$table_name 2>/dev/null | awk "/$value_update/ "'{print NR}'`
    
        read  -p  "Enter new $value_update value: " new_value
    

        old_value=$(awk 'BEGIN{FS=":"} {
        if(NR=="'$value_NR'"){
            print $'$col_NR';     
            }
          }' DataBases/$db_name/$table_name)

        sed -i ''$value_NR's/'$old_value'/'$new_value'/g' DataBases/$db_name/$table_name 2>>/dev/null

        echo "========================================="
        echo "$col_update is updated  successfully!!!!"
        echo "========================================="

        ./manipulate_db.sh $db_name

    fi
    
fi