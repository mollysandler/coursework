#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb  3 09:49:07 2022

@author: mollysandler
"""

class HuffmanNode: 
   def __init__(self, char_ascii, freq): 
       self.char_ascii = char_ascii  # stored as an integer - the ASCII character code value 
       self.freq = freq              # the frequency count associated with the node 
       self.left = None              # Huffman tree (node) to the left 
       self.right = None             # Huffman tree (node) to the right 
       self.code = None
   
   def __lt__(self, other): 
       return comes_before(self, other) # Allows use of Python List sorting 
   
   def set_left(self, node): 
       self.left = node 
   
   def set_right(self, node): 
       self.right = node 
      
def comes_before(a, b): 
   """Returns True if node a comes before node b, False otherwise""" 
   if a.freq == b.freq: #if same frequency default to ascii value to decide 
        if a.char_ascii < b.char_ascii: #if a_ascii is smaller than b_ascii (before in alphabet)
            return True #true because smaller
        else:
            return False #false because bigger
   if a.freq < b.freq: #if b has a higher freequency, no default needed
        return True #true because lower frequency 
   else:
        return False #false because higher frequency 

def combine(a, b): 
    """Creates and returns a new Huffman node with children a and b, with the "lesser node" on the left 
   The new node's frequency value will be the sum of the a and b frequencies 
   The new node's char value will be the lesser of the a and b char ASCII values""" 
    if comes_before(a, b) == True: #if a is smaller than b
        combo = a.freq + b.freq
        temp = HuffmanNode(a.char_ascii, combo) #temp becomes new node with a_ascii with combined frequency 
        temp.set_left(a) #temp left becomes a 
        temp.set_right(b) #temp right becomes b
    else: #if b is smaller than a
        combo = a.freq + b.freq
        temp = HuffmanNode(b.char_ascii, combo) #temp becomes new node with b_ascii value with combined frequency
        temp.set_left(b) #temp left becomes b 
        temp.set_right(a) #temp right becomes a
    return temp #return the final node 

        
def cnt_freq(filename): #get freq for each letter
    """Opens a text file with a given file name (passed as a string) and counts the frequency of occurrences of all the characters within that file
    Returns a Python List with 256 entries - counts are initialized to zero. The ASCII value of the characters are used to index into this 
    list for the frequency counts""" 
    try: 
        freq = [0]*256 #initiliaze list
        file = open(filename, "r") #open file 
        listing = "" #empty string
        
        for line in file: #for each line so it works for multiline files 
            listing = listing + line #add line to empty list and alter it
        listChars = list(listing) #chars equals list of all lines in one
        
        for ch in listChars: #for each char in the list of lines
            num = ord(ch) #ascii value of char
            freq[num] += 1 #add one to frequency in slot of ascii value
        file.close() #close the file!!
        
        return freq #return final list 
    except FileNotFoundError: #if file not found 
        raise FileNotFoundError('This file does not exist!') #raise file not found
        
    try:
        with open(filename, encoding = "utf-8-sig") as file:
            freq = [0] * 256
            line = file.read()
            for i in line:
                o = ord(i)
                freq[o] += 1
    except FileNotFoundError:
        raise FileNotFoundError('this file does not exist')

    return freq

def create_huff_tree(freq_list): 
    """Input is the list of frequencies (provided by cnt_freq()). 
    Create a Huffman tree for characters with non-zero frequency 
    Returns the root node of the Huffman tree. Returns None if all counts are zero.""" 
    hufftree = [] #initialize empty list 
    for i in range(0, 256): #length 0 -256 
        if freq_list[i] != 0 :#if not 0 
            temp = HuffmanNode(i, freq_list[i]) #make node
            hufftree.append(temp) #add node to list
           
    while len(hufftree) > 1: #if the length is > one 
            node1 = find(hufftree) #find smallest
            hufftree.remove(node1) #remove it 
            node2 = find(hufftree) #find new smallest (old second smallest)
            hufftree.remove(node2) #remove it 
            temp = combine(node1, node2) #combine them 
            hufftree.append(temp) #add the new combined node
        
    if len(hufftree) == 0: #if less than one return nothing
        return
    
    if len(hufftree) == 1: #if one 
       return hufftree[0] #return tree[0]
        
    return hufftree[0] #returns root node 

def find(given): #find min of a given list                                                  
    small = given[0]
    for index in range(0, len(given)):                                
         current = given[index]
         if comes_before(current, small): #use previously defined come before function
             small = current
    return small #returns min value 

def create_code(node): 
   """Returns an array (Python list) of Huffman codes. For each 
   character, use the integer ASCII representation as the index into the arrary, with the resulting Huffman code 
   for that character stored at that location. Characters that are unused should have an empty string at that
   location""" 
   if node == None:
        return [] * 256
   else:
        finalList = [""] * 256
        create_code_helper(node, finalList, blank = "")
        return finalList

def create_code_helper(node, strings, blank = ""): #helper for create code     
    if node.left: #checks left side                                       
        temp = blank 
        blank = blank + "0" #add a 0 because left
        create_code_helper(node.left, strings, blank) #recursion magic
        blank = temp 
    if node.right: #checks right side                                   
        temp = blank  
        blank = blank + "1" #adds a 1 because right 
        create_code_helper(node.right, strings, blank) #reucrsion magic
        blank = temp
    if node.left == None and node.right == None: #if is a leaf                     
        node.val = blank #node value is current list of 0's and 1's
        strings[node.char_ascii] = node.val #sticks the current string into that node ascii value 


def create_header(freq_list): 
   """Input is the list of frequencies (provided by cnt_freq()). 
   Creates and returns a header for the output file """
   header = "" #empty string
   
   for a in range(0, 256): # for each item in the length of input
       if freq_list[a] != 0: #if has a vlaue 
           header = header + str(a) + ' ' + str(freq_list[a]) + ' ' #add the value and the amount to header 
   return header.strip() #header without leading and trailing whitespace


def huffman_encode(in_file, out_file): 
   """Takes input file name and output file name as parameters 
   Uses the Huffman coding process on the text from the input file and writes encoded text to output file 
   Take not of special cases - empty file and file with only one unique character"""
   try:
        file = open(in_file, "r") #open file 
        file.close()
        file2 = open(out_file, "w") #open output file with writing ability 
        amount = cnt_freq(in_file) #find frequency of given file
        header = create_header(amount) #find header
        code = encoder_helper(amount, in_file) #call helper function 
        file2.write(header) #write the header
        if code != "": #if not empty 
            file2.write("\n"+code) #write the code
        file2.close()
        
   except FileNotFoundError: #except file error
        raise FileNotFoundError('file does not exist')
       
def encoder_helper(amount, file): #helper function for encoding
    file = open(file, "r") #open file
    node = create_huff_tree(amount)
    code = create_code(node) 
    encoded = "" #blank string 
    final = "" #blank string
    for line in file: #for each line in given file
        final = final + line #string + line
    file.close() #close the file 
    final = list(final) #final as a list 
    for char in final: #for item in the list string 
        encoded = encoded + code[ord(char)] #add the binary at each letter ascii value in order
    return encoded #return final 

if __name__ == "__main__":
    hello = cnt_freq('file.txt')
    print()
    var = create_huff_tree(hello)
    print(create_header(hello))
    huffman_encode("file.txt", "output.txt")
    file = open('output.txt', "r")
    print(file.read())
    
    
    
    
    
    
    
    
    
    