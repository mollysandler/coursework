# Implements operations on binary numbers.
# CSC 225, Assignment 1
# Given code, Spring '22


def add(addend_a, addend_b): #works 
    """
    Add two 16-bit, two's complement numbers; ignore carries/overflows.
    TODO: Implement this function. Do *not* convert the numbers to decimal.

    :param addend_a: A bitstring representing the first number
    :param addend_b: A bitstring representing the second number
    :return: A bitstring representing the sum
    """
    carry = 0 #define carry variable 
    bitsum = "" #define final answer

    for i in range(len(addend_a)-1, -1, -1):
        if addend_a[i] == '0' and addend_b[i] == '0': #if both numbers are 0 
            if carry == 0:
                bitsum = bitsum + '0'
                carry = 0
            elif carry == 1:
                bitsum = bitsum + '1'
                carry = 0
        elif addend_a[i] == '1' and addend_b[i] == '0': #if only one is 1
            if carry == 0:
                bitsum = bitsum + '1'
                carry = 0
            elif carry == 1:
                bitsum = bitsum + '0'
                carry = 1
        elif addend_a[i] == '0' and addend_b[i] == '1': #if only one is 1, but the other one
            if carry == 0:
                bitsum = bitsum + '1'
                carry = 0
            elif carry == 1:
                bitsum = bitsum + '0'
                carry = 1
        elif addend_a[i] == '1' and addend_b[i] == '1': #if both are 1
            if carry == 0:
                bitsum = bitsum + '0'
                carry = 1
            elif carry == 1:
                bitsum = bitsum + '1'
                carry = 1
        i = i + 1
        
    return bitsum[::-1] #return reversed string


def negate(number): #works 
    """
    Negate a 16-bit, two's complement number.
    TODO: Implement this function. Do *not* convert the number to decimal.

    :param number: A bitstring representing the number to negate
    :return: A bistring representing the negated number
    """
    negated = "" #defines starter string
    for digit in number: #for each number, flip the bit
        if digit == '1': 
            negated = negated + "0"
        elif digit == '0':
            negated = negated + "1"
    negated = add(negated, '0000000000000001') #add one using previous function 
    return negated #return final answer


def subtract(minuend, subtrahend): #works
    """
    Subtract one 16-bit, two's complement number from another.
    TODO: Implement this function. Do *not* convert the numbers to decimal.

    :param minuend: A bitstring representing the number from which to subtract
    :param subtrahend: A bitstring representing the number to subtract
    :return: A bitstring representing the difference
    """
    new_sub = negate(subtrahend) #negate given subtractor 
    bitsum = add(minuend, new_sub) #define answer using previous add function 
    return bitsum #return final answer 

def multiply(multiplicand_a, multiplicand_b):
    """
    Multiply two 16-bit, two's complement numbers; ignore carries/overflows.
    TODO: Implement this function. Do *not* convert the numbers to decimal.

    :param multiplicand_a: A bitstring representing the first number
    :param multiplicand_b: A bitstring representing the second number
    :return: A bitstring representing the product
    """
    temp1 = multiplicand_a[0]
    temp2 = multiplicand_b[0]

    if multiplicand_a[0] == "1":
        multiplicand_a = negate(multiplicand_a)
    if multiplicand_b[0] == "1":
        multiplicand_b = negate(multiplicand_b)
    
    ans = "0000000000000000"
    while multiplicand_b != "0000000000000000":
        ans = add(ans, multiplicand_a)
            #print(ans)
        multiplicand_b = subtract(multiplicand_b, '0000000000000001')
            #print(multiplicand_b)
    if temp1 != temp2:
        ans = negate(ans)
        return ans
    else:
        return ans

def binary_to_decimal(number): #works
    """
    Convert a 16-bit, two's complement number to decimal.
    TODO: Implement this function.

    :param number: A bitstring representing the number to convert
    :return: An integer, the converted number
    """
    total = 0
    if number[0] == '1':
        number = negate(number)
        print(number)
        if number[1] == '1':
            total = total + 16384    
        if number[2] == '1':
            total = total + 8192
        if number[3] == '1':
            total = total + 4096
        if number[4] == '1':
            total = total + 2048
        if number[5] == '1':
            total = total + 1024
        if number[6] == '1':
            total = total + 512
        if number[7] == '1':
            total = total + 256
        if number[8] == '1':
            total = total + 128
        if number[9] == '1':
            total = total + 64
        if number[10] == '1':
            total = total + 32
        if number[11] == '1':
            total = total + 16
        if number[12] == '1':
            total = total + 8
        if number[13] == '1':
            total = total + 4
        if number[14] == '1':
            total = total + 2
        if number[15] == '1':
            total = total + 1
        return -total
    else:
        if number[15] == "1":
            total = total + 1
        if number[14] == "1":
            total = total + 2
        if number[13] == "1":
            total = total + 4
        if number[12] == "1":
            total = total + 8
        if number[11] == "1":
            total = total + 16
        if number[10] == '1':
            total = total + 32
        if number[9] == "1":
            total = total + 64
        if number[8] == "1":
            total = total + 128
        if number[7] == "1":
            total = total + 256
        if number[6] == "1":
            total = total + 512
        if number[5] == '1':
            total = total + 1024
        if number[4] == '1':
            total = total + 2048
        if number[3] == '1':
            total = total + 4096
        if number[2] == '1':
            total = total + 8192
        if number[1] == '1':
            total = total + 16384    
        return total

def decimal_to_binary(number): #works 
    """
    Convert a decimal number to 16-bit, two's complement binary.
    TODO: Implement this function.

    :param number: An integer, the number to convert
    :return: A bitstring representing the converted number
    :raise OverflowError: If the number cannot be represented with 16 bits
    """

    if -32768 > number or number > 32767 :
        raise OverflowError('this number is too long to be expressed in 16 bits!')
    
    else:
        temp = number

        if number < 0:
            number = 0 - number #negate it
        
        if number > 0: #should be all numbers now 
            bitsum = ""
            sol = None
            
            while sol != 0: #for negatives
                sol = number // 2
                remainder = number % 2
                if remainder == 1:
                    bitsum = bitsum + "1"
                else:
                    bitsum = bitsum + "0"
                number = sol
            
            if temp < 0:
                bitsum = bitsum.zfill(16)
                bitsum = negate(bitsum)
                return bitsum
        
        return bitsum.zfill(16)

        
#print(binary_to_decimal('1000000000000000'))
print(decimal_to_binary(-5))