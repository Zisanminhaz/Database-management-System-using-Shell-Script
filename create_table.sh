db_name=$1
function taple_name_constrain(){
var='!@#$%^&*()/?\|'
db_namee=$db_name
while true;
do
  read -p "Enter table name: " table_name
if  [[  $table_name =~ [0-9]+$ ]]; 
  
        then
        echo "Invalid input! name of table can not be numbers!"
          
elif
      [[ $table_name =~ [$var] ]];  

        then
        echo " Invalid input! name of table can't be regex! "
          
elif
      [[ -z "$table_name" ]];  
        
        then
        echo " Invalid input! name of taple can't be empty "
          
elif 
      [[  $table_name = *" "* ]];  
      
        then
        echo " Invalid input! name of taple can't contain spaces "
  
else 
      touch DataBases/$db_namee/$table_name
      mkdir DataBases/$db_namee/.metadata 2>>/dev/null
      touch DataBases/$db_namee/.metadata/$table_name.meta
      create_column 
      
     
fi
done
}
function create_column(){

#==>
  declare -i coloum_number
  db_nameee=$db_name
   while true;
   do
    read -p "Enter numbers of coloums: " coloum_number
        if [[ $coloum_number =~ ^[0-9]+$ ]]; 
    
        then
        break

        else

        echo " Invalid input! Enter Numbers ONLY "

        fi
    done

    for (( i = 1 ; i <= $coloum_number ; i++ ))
    do
        while true;
        do
            read -p "Enter column name: " column_name
            if [[ -z $column_name ]]  || [[ ! $column_name =~ ^[a-zA-Z]+[a-zA-Z0-9]*$  ]]; 
            
            then
                echo "Column field must be charachters only"
            else
                break
            fi
        done
      
        if (( $i == $coloum_number )); then
            
            echo "$column_name;" >> DataBases/$db_nameee/.metadata/$table_name.meta
            echo "==============================="
            echo "Table created succefully!!!!!!"
            echo "==============================="
            ./manipulate_db.sh $db_nameee
            break
        elif (( $i < $coloum_number )); then
           echo -e "$column_name:\c" >> DataBases/$db_nameee/.metadata/$table_name.meta
        fi 
    done
}
taple_name_constrain
createcolumn
