# Implements operations on hexadecimal numbers.
# CSC 225, Assignment 1
# Given code, Winter '20

def binary_to_hex(number):
    """
    Convert a 16-bit binary number to hexadecimal.
    TODO: Implement this function. Do *not* convert the number to decimal.

    :param number: A bitstring representing the number to convert
    :return: A hexadecimal string, the converted number
    """
    dic = {'0000':'0', '0001':'1', '0010':'2','0011':'3', '0100': '4', '0101': '5', '0110':'6', '0111': '7', '1000': '8', '1001': '9', '1010': 'A', '1011': 'B', '1100': 'C', '1101': 'D', '1110': 'E', '1111': 'F'}
    hexi = ""

    group1 = number[0:4]
    print(group1)
    group2 = number[4:8]
    print(group2)
    group3 = number[8:12]
    print(group3)
    group4 = number[12:]
    print(group4)
    
    hexi = hexi + dic.get(group1)
    hexi = hexi + dic.get(group2)
    hexi = hexi + dic.get(group3)
    hexi = hexi + dic.get(group4)
    hexi = '0x' + hexi
    return hexi

def hex_to_binary(number):
    """
    Convert a hexadecimal number to 16-bit binary.
    TODO: Implement this function. Do *not* convert the number to decimal.

    :param number: A hexadecimal string, the number to convert
    :return: A bitstring representing the converted number
    """
    dic = {'0':'0000', '1':'0001', '2':'0010','3':'0011', '4': '0100', '5': '0101', '6':'0110', '7': '0111', '8': '1000', '9': '1001', 'A': '1010', 'B': '1011', 'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'}

    binary = ""
    number = number[2:]
    for val in number:
        binary = binary + dic.get(val)
    return binary
