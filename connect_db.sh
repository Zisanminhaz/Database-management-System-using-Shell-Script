 #!/bin/bash
 echo -e "Enter Database Name: \c"
 read -r db_name

  cd ./DataBases/$db_name 2> /dev/null
  

if [ $? -eq 0 ]

  then
    echo "========================================="
    echo "Connected to $db_name Successfully!!!!!!"
    echo "========================================="
    cd ..
    cd ..
    ./manipulate_db.sh $db_name
    ./main.sh

  else
    echo "================================"
    echo "Database $db_name was not found!!"
    echo "================================"
    ./main.sh

fi
       
