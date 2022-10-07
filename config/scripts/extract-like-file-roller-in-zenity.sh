#!/bin/bash

set -e
addname=""
path=""
action=$(yad --width 300 --entry --title "Smart Move" \
    --button="OK:0" --button="Cancel:1" \
    --text "Choose action:" \
    --entry-text \
    "Move" "Copy" "Extract_as_Folder" "Extract_Content")
ret=$?

	case $action in
   		 Move*) act=1 ;;
    		 Copy*) act=2 ;;
                 Extract_as_Folder*) act=3 ;;
                 Extract_Content*) act=4 ;;
  	 	 *) exit 1 ;;
	esac

ypath=$(yad --width 800 --height 600 --title "Smart Move" --file-selection --directory)

for fullpath in "$@"
do
    filename="${fullpath##*/}"                                     # Strip longest match of */ from start
    xpath="${fullpath:0:${#fullpath} - ${#filename}}"  # Substring from 0 thru pos of filename
    xbase="${filename%.[^.]*}"                                   # Strip shortest match of . plus at least one non-dot char from end
    xfext="${filename:${#xbase} + 1}"
                 # Substring from len of base thru end
    if [[ -z "$xbase" && -n "$xfext" ]]; then
        xbase=".$ext"
        xfext=""
    fi

	if [[ ! -e "$ypath/$filename" ]]; then
   		 newname="$filename"
	else
   	         newname="copy_$(date +%Y%m%d%H%M%S)_$filename"
	fi


	if [[ $act -eq 1 ]]; then

              if [ -w "$ypath" ] ; then
                    cp -ar "$fullpath" "$ypath/$newname" && rm -rf "$fullpath"
              else
                    cp -ar "$fullpath" "$ypath/$newname"
                       if [[ -e "$ypath/$newname" ]]; then
                             rm -rf "$fullpath"
                       fi
               fi
	fi

	if [[ $act -eq 2 ]]; then

              if [ -w "$ypath" ] ; then
                    cp -ar "$fullpath" "$ypath/$newname"
              else
                    cp -ar "$fullpath" "$ypath/$newname"
              fi


	fi

	if [[ $act -eq 3 ]]; then

   		  addname=$RANDOM
       		  mkdir "$xpath/$addname" && cd "$xpath/$addname/"

      		  case "$1" in
       		  *.tar.bz2)   tar xvjf "$1"    ;;
        	  *.tar.gz)    tar xvzf "$1"    ;;
         	  *.tar.xz)    tar xvJf "$1"    ;;
        	  *.lzma)      unlzma "$1"      ;;
       		  *.bz2)       bunzip2 "$1"     ;;
        	  *.rar)       unrar x -ad "$1" ;;
       	 	  *.gz)        gunzip "$1"      ;;
        	  *.tar)       tar xvf "$1"     ;;
        	  *.tbz2)      tar xvjf "$1"    ;;
         	  *.tgz)       tar xvzf "$1"    ;;
       		  *.zip)       unzip "$1"       ;;
       		  *.Z)         uncompress "$1"  ;;
        	  *.7z)        7z x "$1"        ;;
         	  *.xz)        unxz "$1"        ;;
        	  *.exe)       cabextract "$1"  ;;
                  *)           notify-send "Not a known archive format" && exit 1 ;;
                  esac


                     if [ -w "$ypath" ] ; then
                        cp -ar "$xpath/$addname" "$ypath/$xbase"
                     else
                        cp -ar "$xpath/$addname" "$ypath/$xbase"
                     fi

                     cd ..
                     rm -rf "$xpath/$addname"
        fi

      	if [[ $act -eq 4 ]]; then
		  addname=$RANDOM
       		  mkdir "$xpath/$addname" && cd "$xpath/$addname/"

                  #if [[ ! -d "$xpath/$xbase" ]]; then
                   #     exit
                  #fi

      		  case "$1" in
       		  *.tar.bz2)   tar xvjf "$1"    ;;
        	  *.tar.gz)    tar xvzf "$1"    ;;
         	  *.tar.xz)    tar xvJf "$1"    ;;
        	  *.lzma)      unlzma "$1"      ;;
       		  *.bz2)       bunzip2 "$1"     ;;
        	  *.rar)       unrar x -ad "$1" ;;
       	 	  *.gz)        gunzip "$1"      ;;
        	  *.tar)       tar xvf "$1"     ;;
        	  *.tbz2)      tar xvjf "$1"    ;;
         	  *.tgz)       tar xvzf "$1"    ;;
       		  *.zip)       unzip "$1"       ;;
       		  *.Z)         uncompress "$1"  ;;
        	  *.7z)        7z x "$1"        ;;
         	  *.xz)        unxz "$1"        ;;
        	  *.exe)       cabextract "$1"  ;;
                  *)           notify-send "Not a known archive format" && exit 1 ;;
                  esac

                     if [ -w "$ypath" ] ; then
                        cp -Tar "$xpath/$addname" "$ypath"
                     else
                        cp -Tar "$xpath/$addname" "$ypath"
                     fi

                  cd ..
                  rm -rf "$xpath/$addname"
	fi

done
