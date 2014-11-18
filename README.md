Thank you for the coding exercise. 

This is my solution code and test for exercise #1 - converting numbers to words.

First I initialize the converter with the amount, dollar amount, and cents.
I decided to split the amount into dollar and cents because I noticed that cents 
are required to be written in a fraction. 

My convert_cents method changes cents into the correct format of "cents/100 dollars"

Then I created create_number_segments method that will separate dollar amounts
into three digit numbers since I noticed that every three digit can be converted into
words using a same method.  

After that, I wrote convert_amounts_to_words method that encompasses special cases
such as a user inputting a negative amount, zero amount or amount less than one dollar. 
This method uses two methods mentioned previously as well as convert_dollars_and_cents
 method that will run if the amount is greater than one dollar. 
 
Short explanation of convert_dollars_and_cents method: this method will go through the
segmented dollar amounts and convert each segment(3-digit number) into words. Those words
are then pushed into an array which with join method will produce the correct converted 
number to words.  
