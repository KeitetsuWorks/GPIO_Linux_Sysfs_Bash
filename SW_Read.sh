#!/bin/bash
##
## Raspberry Pi GPIO Access Sample
## SW_Read.sh
##
## Rev.     | Date       | Design     | Comment
## 01.00    | 2016/09/26 | Keitetsu   | 
##

SW_DIP=19                   # DIP Switch
SW_PUSH=20                  # Tactile Switch

SW_ON=0                     # Low Active
SW_OFF=1

SW_READ_INTERVAL=1          # sec
SW_READ_LOOP=20

GPIO_VALUE=""

# Includes
source ./include/GPIO.sh

# Functions
error_check()
{
    if [ ${1} != "0" ]; then
        exit 1
    fi

    return 0
}

# Main
gpio_open ${SW_DIP} input
error_check $?
gpio_open ${SW_PUSH} input
error_check $?

for SW_READ_COUNT in `seq 1 ${SW_READ_LOOP}`
do
    GPIO_VALUE=`gpio_read ${SW_DIP}`
    error_check $?
    echo "DIP Switch:     ${GPIO_VALUE}"
    GPIO_VALUE=`gpio_read ${SW_PUSH}`
    error_check $?
    echo "Tactile Switch: ${GPIO_VALUE}"
    sleep ${SW_READ_INTERVAL}
done

gpio_close ${SW_DIP}
gpio_close ${SW_PUSH}

exit 0
