#!/bin/bash

if [[ $1 = '--help' ]]
then

	echo "chdt - изменяет даты модификации файлов каталога-1 на соответствующие даты одноименных файлов каталога-2"
	echo
	echo "СИНТАКСИС"
	echo "chdt [КЛЮЧ] КАТзам КАТобр"
	echo "      КАТзам - каталог с файлами которым необходимо поменять даты"
	echo "      КАТобр - каталог с образцовыми файлами"
	echo
	echo "КЛЮЧИ:"
	echo "--help     показать эту справку и выйти"
	echo
	echo "Замечание:"
	echo "Версия альфа, писалась для себя, поэтому будьте бдительны"


else

o=$1
n=$2


for filen in $(ls $n)
do

    
    for fileo in $(ls $o)
    do

        if [[ $fileo = $filen ]]
        then
           
            odt=$(stat --format "%y" $o/$fileo)
            ndt=$(stat --format "%y" $n/$filen)
            
            if $(touch -r $n/$filen $o/$fileo)
            then
                echo "$fileo - $odt -> $ndt"
            fi
            
            break
        fi


    done
done

fi
