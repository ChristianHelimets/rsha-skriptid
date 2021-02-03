# mysql-server paigaldusskript
#
# kontrollime, mitu korda mysql-server korral ok installed
# sõnad on leitud ja vastavus salvestame
# muutuja sisse:
MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed')
if [ $MYSQL -eq 0 ]; then
        # siis ok installed ei ole leitud
        # ja väljastame vastav teada ning
        # paigaldame teenus
        echo "Paigaldame mysql ja vajalikud lisad"
        apt install mysql-server
        echo "mysql on paigaldatud"
        # lisame võimalus kasutada mysql käsk ilma kasutaja ja parooli lisamiseta
        touch $HOME/.my.cnf # lisame vajalik konfiguratsiooni fail antud kasutaja kodukausta
        echo "[client]" >> $HOME/.my.cnf
        echo "host = localhost" >> $HOME/.my.cnf
        echo "user = root" >> $HOME/.my.cnf
        echo "password = qwerty" >> $HOME/.my.cnf
# kui MYSQL muutuja väärtus võrdub 1-ga
elif [ $MYSQL -eq 1 ]; then
        # siis ok installed on leitud 1 kord
        # ja teenus on juba paigaldatud
        echo "mysql-server on juba paigaldatud"
        # kontrollime olemasolu
        mysql
# lõpetame tingimuslause
fi
# skripti lõpp
