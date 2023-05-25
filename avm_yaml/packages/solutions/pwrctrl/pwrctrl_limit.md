





how it works

first of all - an auto-setting to turn on/off the automagical solution
    input_boolean.pwrctrl_limit_active

Settings on what is wanted max hourly consumption (due to local tarriffs ) 
    - input_number.pwrctrl_limit_capacity_limit
    (will have seasonal changes on this,, I guess 10KWh at winter-months and 5KWh at summer??)

Calculation of current monthly max (which is in fact the average of max values for the three days with highest hourly average) 
.... må få denne over frå evaHan

Sum of current consumtion this hour (so far)
- input from power-meeter - HAN-reader


Then defining usage-template,,, how close in % are we in this hour to reaching the max?
    sensor.pwrctrl_limit_usage_percent

and a counter of how many active PowerHourSaves is active


pwrctrl_limit_level