PS3="What you want to do in $1: "
select choice in  "show tables" "create new table" "insert into table" "Select table" "update table" "Delete table" "return to main menu"
do
    case $REPLY in 
        1)
        . ./list_tables.sh $1
          ;; 
        2) 
        . ./create_table.sh $1
          ;;
        3)
        . ./insert_table.sh $1
          ;;
        4) 
        . ./select_table.sh $1
          ;;
        5)
        . ./update_table.sh $1
          ;; 
        6)
        . ./delete_table.sh $1
          ;;
        7)
        . ./main.sh
    esac 
done

