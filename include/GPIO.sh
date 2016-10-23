#!/bin/bash
##
## GPIO Control Functions
## GPIO.sh
##
## Rev.     | Date       | Design     | Comment
## 01.00    | 2016/09/25 | Keitetsu   | 
##

##
## Open GPIO Port
##
## @param1  port number
## @param2  port direction
##              input
##              output
##
## @return  0:  Success
##          1:  Failure
##
gpio_open()
{
    if [ -d /sys/class/gpio/gpio${1} ]; then
        echo "Warning: gpio${1} is already exported"
    else
        echo ${1} > /sys/class/gpio/export
    fi

    if [ ! -d /sys/class/gpio/gpio${1} ]; then
        echo "Error: invalid gpio port \"gpio${1}\""
        
        return 1
    fi

    if [ ${2} = "input" ]; then
        echo in > /sys/class/gpio/gpio${1}/direction
    elif [ ${2} = "output" ]; then
        echo out > /sys/class/gpio/gpio${1}/direction
    else
        echo "Error: invalid argument \"${2}\""
        
        return 1
    fi

    return 0
}

##
## Close GPIO Port
##
## @param1  port number
##
## @return  0:  Success
##          1:  Failure
##
gpio_close(){
    if [ -d /sys/class/gpio/gpio${1} ]; then
        echo ${1} > /sys/class/gpio/unexport
    else
        echo "Warning: gpio${1} is already unexported"
    fi

    return 0
}

##
## Write Value to GPIO Port
##
## @param1  port number
## @param2  output value
##
## @return  0:  Success
##          1:  Failure
##
gpio_write(){
    if [ -d /sys/class/gpio/gpio${1} ]; then
        GPIO_DIRECTION=`cat /sys/class/gpio/gpio${1}/direction`
        
        if [ $GPIO_DIRECTION = "out" ]; then
            echo ${2} > /sys/class/gpio/gpio${1}/value
        else
            echo "Error: unexpected gpio direction \"$GPIO_DIRECTION\""

            return 1
        fi
    else
        echo "Error: gpio${1} is not available"

        return 1
    fi

    return 0
}

##
## Read Value from GPIO Port
##
## @param1  port number
##
## @return  0:  Success
##          1:  Failure
##
gpio_read(){
    if [ -d /sys/class/gpio/gpio${1} ]; then
        GPIO_DIRECTION=`cat /sys/class/gpio/gpio${1}/direction`
        
        if [ $GPIO_DIRECTION = "in" ]; then
            cat /sys/class/gpio/gpio${1}/value
        else
            echo "Error: unexpected gpio direction \"$GPIO_DIRECTION\""

            return 1
        fi
    else
        echo "Error: gpio${1} is not avaliable"

        return 1
    fi

    return 0
}

