#!/bin/bash
#chapter 2 workshop 2
#osdetect with elif 
os=$(uname -o)
if [[ $os  ==  "GNU/Linux" ]]
 then
   echo "Your operating system is: $os"

elif [ $os != 'GNU/Linux' ]
  then
   echo "Your operating system is not GNU/Linux, but $os "
fi

