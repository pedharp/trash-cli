#!/bin/sh

file=~/.bashrc
trash_location=~/.local/share/Trash/files/
trash_files=$trash_location*
remove_items="\n########## Trash cli ##########\n### Remove Trash ###\nfunction to_trash () {           
mv  \"\$@\" $trash_location  
}"
list_items="\n### List Items ###\nfunction list_trash () {
ls $trash_location
}\n"
empty_items="\n### Empty Trash ###\nfunction empty_trash () {
rm -rf $trash_files
}\n"
if ! grep -q "$remove_items"\|"$list_items"\|"$empty_items" "$file"; then
	printf "$remove_items" >> $file
	printf "$list_items" >> $file
	printf "$empty_items" >> $file
	echo alias to-trash=\'to_trash\' >> $file
	echo " " 
	echo alias list-trash=\'list_trash\' >> $file
	echo " "
	echo alias empty-trash=\'empty_trash\' >> $file
	source $file
	echo "#########################" >> $file
fi

