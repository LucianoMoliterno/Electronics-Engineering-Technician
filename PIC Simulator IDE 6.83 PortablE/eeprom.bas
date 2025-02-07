Dim a As Byte  'eeprom address
Dim b As Byte  'eeprom data

For a = 0 To 63  'go through whole eeprom memory
b = 255 - a  'set the data value to be written
Write a, b  'perform the writing to eeprom
Next a
