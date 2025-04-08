read -p "Enter table you want to insert into: " table_name
if [ -e ./DataBases/$1/$table_name  ]; then
    
    for (( i = 1 ; i <= "$(awk -F: '{print NF}' DataBases/$1/.metadata/$table_name.meta )"  ; i++ )) 
      do
      #check col_value
      var='!@#$%^&*()/?\|'
      while true;
      do
            read -p "Enter value: " col_value
            if [[ $col_value =~ [$var] ]];  then
            echo "Column value can't have regex!!!"

            elif [[ -z "$col_value" ]];  then
            echo "Column value can't be empty!!!"
          
          
            elif [[  $col_value = *" "* ]];  then
            echo "Column value can't contain spaces!!!" 
            else 
            break
            fi
      done

      #insert
      if (( $i == "$(awk -F: '{print NF}' DataBases/$1/.metadata/$table_name.meta )" )); then
            echo "$col_value" >> DataBases/$1/$table_name
            echo "=============================================="
            echo "Insert in $table_name is done sucessfully!!!!"
            echo "=============================================="
            break
      elif (( $i < "$(awk -F: '{print NF}' DataBases/$1/.metadata/$table_name.meta )" )); then
            echo -e "$col_value:\c" >>  DataBases/$1/$table_name
      fi 
done    
else
      echo "===================================="
      echo $table_name "table doesn't exist!!!"
      echo "===================================="
      ./manipulate_db.sh $1
fi


  
