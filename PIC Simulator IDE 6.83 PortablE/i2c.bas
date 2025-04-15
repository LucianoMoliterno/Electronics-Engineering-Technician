Dim addr As Word  'variable for storing EEPROM byte address
Dim data As Byte  'variable for storing EEPROM byte data

Symbol sda = PORTC.2  'nickname for SDA pin
Symbol scl = PORTC.3  'nickname for SCL pin

For addr = 0 To 31  'the first 32 bytes will be written
	data = 255 - addr  'set the data byte to be written
	I2CWrite sda, scl, 0xa0, addr, data  'perform I2C write operation to serial EEPROM
	WaitMs 1  'small delay interval
Next addr
