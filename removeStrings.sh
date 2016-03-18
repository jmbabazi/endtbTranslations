#!/bin/bash
set -e -x
FILENAME="$1"
sed -i 's/\\n./ /g' $PWD/$FILENAME
sed -ri 's/\\:./: /g' $PWD/$FILENAME
sed -ri 's/\\=./~ /g' $PWD/$FILENAME
#0 for false preferred locale
sed -i "s/$/', 'ru', 0, 1, NOW(), 'SHORT', 0, NULL, NULL, NULL, UUID()), /g" $PWD/$FILENAME
sed -i "s/=/'), '/g" $PWD/$FILENAME
#replace ~ with = for less or equal / greater or equal
sed -ri 's/~/= /g' $PWD/$FILENAME
sed -i "s/ui.i18n.Concept.name./(NULL, (select concept_id from concept where uuid = '/g" $PWD/$FILENAME
sed -i "1i INSERT INTO concept_name VALUES"  $PWD/$FILENAME
#replace , with ; on the last line
sed -i '$s/D()),/D());/g' $PWD/$FILENAME
