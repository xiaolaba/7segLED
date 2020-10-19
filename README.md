# 7segLED
2 digits, 8 bit data bus, counter 0x00 ~ 0xFF

### 7-seg LED used, datasheet [TDSO3150](TDSO3150.pdf),
![7-seg_LED_common_anode_map.JPG](7-seg_LED_common_anode_map.JPG)

### Excel table to design map for display "0" ~ "F"
[tool, how to design 7-seg LED lookup table to display](7segLEDmap.xlsx)

### circuit design
![schematic.jpg](schematic.jpg) or PDF[schematic.pdf](schematic.pdf)

### a simple NOT gate, an invertor, control power for LEDs
PD7, COM driver, a one single I/O pin to drive two COM of 7-seg LED (common anode and as power supply to the LEDs)
PD7 = 0V, Tens+ = 0V, no power; Units+ = 5V, LED lites
PD7 = 5V, Tens+ = 5V, LED lites; Units+ = 0V, no power

### lites a digit, uses mapping table
DP (decemal point) is not USED, no connection.
for example, "0", the pattern of segment mask is 0x3F, because common anode of LEDs, COM supply power to LEDs, segment (A-F) must be pulled to 0V, in order to lites LEDs, inverts 0x3F will see those segment pins to be 0V.