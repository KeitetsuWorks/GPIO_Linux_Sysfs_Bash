#!/bin/bash
##
## Raspberry Pi GPIO Access Sample
## LED_Blink.sh
##
## Rev.     | Date       | Design     | Comment
## 01.00    | 2016/09/25 | Keitetsu   | 
##

LED_1=21                    # Green
LED_2=26                    # Red

LED_ON=0                    # Low Active
LED_OFF=1

LED_BLINK_INTERVAL=1        # sec
LED_BLINK_LOOP=10

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
gpio_open ${LED_1} output
error_check $?
gpio_open ${LED_2} output
error_check $?

for LED_BLINK_COUNT in `seq 1 ${LED_BLINK_LOOP}`
do
    gpio_write ${LED_1} ${LED_ON}
    error_check $?
    gpio_write ${LED_2} ${LED_OFF}
    error_check $?
    sleep ${LED_BLINK_INTERVAL}
    
    gpio_write ${LED_1} ${LED_OFF}
    error_check $?
    gpio_write ${LED_2} ${LED_ON}
    error_check $?
    sleep ${LED_BLINK_INTERVAL}
done

gpio_close ${LED_1}
gpio_close ${LED_2}

exit 0
