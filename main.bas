dim startTime as double
dim endTime as double
startTime = timer

dim testString as string
dim testNum as integer

dim currentVal as string

dim subString as string

open "data.txt" for input as #1

input #1, testString
input #1, testNum

dim totalMatch(1 to testNum) as integer

dim shared x as integer

dim shared prime as integer = 7

dim shared currentHash as double
dim shared valHash as double

dim shared firstPoint as integer

dim shared currentValLen as integer

dim shared testStringLen as integer

testStringLen = len(testString)

for x = 1 to testNum
    input #1, currentVal
    
    currentValLen = len(currentVal)
    
    for setInitHash as integer = 0 to currentValLen-1
        'sets a init hash
        currentHash += testString[setInitHash]*prime^(setInitHash)
        'gets the hash of the currently read value
        valHash += currentVal[setInitHash]*prime^(setInitHash)
    next
    
    for test as integer = currentValLen-1 to testStringLen-1
        'Test to see if the last hash was a match
        if currentHash = valHash then totalMatch(testNum) += 1
        'Take out the first letter, then add the new letter
        firstPoint = test-currentValLen+1
        currentHash = (((currentHash-testString[firstPoint])) / prime) + testString[test]*prime^(currentValLen-1)
    next
        
next

close #1

endTime = timer - startTime
open "output.dat" for output as #1
for outputNum as integer = 1 to testNum
    print #1, totalMatch(outputNum)
next
close #1
print "Completed the search in :"; endTime; " seconds."
sleep
