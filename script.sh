#!/bin/bash

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "System information:"
dmidecode -t system | grep  'Product\ Name:'

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "System Serial Number:"
dmidecode -t system | grep  'Serial\ Number'

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "System UUID:"
dmidecode -t system | grep 'UUID:'

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "System SKU"
dmidecode -t system| grep 'SKU'

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "BaseBoard Model and Bios"
inxi -M

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Baseboard Information:"
dmidecode -t baseboard | grep -iE 'Serial Number:| Part\ Number'

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "The CPU info"
lscpu | grep 'socket'

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Number of CPUs"
lscpu | grep '^CPU(s)'

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Number of CPU sockets"
lscpu |grep '^Socket(s)'

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Number of threads per core"
lscpu | grep -i thread 

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Number of memory devices"
dmidecode -t memory | grep -c '^Memory Device$'

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Numer of empty slots"
dmidecode -t memory | grep -c -o '^\tPart Number: (?!\[Empty\])'

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Memory Size, Type, Speed And Serial"
dmidecode -t memory | grep -iE "Size\n|Type:|Speed|Serial|Part\ Number"

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Number of Hard Drives"
inxi -Dxx |grep "ID" |wc -l

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Hard Drives Capacity and Serial Number"
inxi -Dxx

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "HBA Cards"
udevadm info -q all -n /dev/sdc

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "RAID Device Info"
inxi -F |grep 'RAID'

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Number of Power Supplies"
dmidecode -t 39 | grep -c '^Name$'

printf '%*s\n'  "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo "Power Supply Serial Number"
dmidecode -t 39 | grep 'serial'

