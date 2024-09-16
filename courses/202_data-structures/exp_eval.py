#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 24 18:28:36 2022

@author: mollysandler
"""

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jan 23 15:56:40 2022

@author: mollysandler
"""


# Stack class implemented with array
class Stack:
    """Implements an efficient last-in first-out Abstract Data Type using a Python 
List"""
    # capacity is max number of Nodes, init_items is optional List parameter for initialization
    # if the length of the init_items List exceeds capacity, raise IndexError
    def __init__(self, capacity, init_items=None):
            """Creates an empty stack with a capacity"""
            self.capacity = capacity        # capacity of stack
            self.items = [None]*capacity    # array for stack
            self.num_items = 0              # number of items in stack           
            
            if init_items is not None:      # if init_items is not None, initialize stack
                if len(init_items) > capacity:
                    raise IndexError
                
                else:
                    self.num_items = len(init_items)
                    self.items[:self.num_items] = init_items
                    
    def __eq__(self, other):
            return ((type(other) == Stack)
                and self.capacity == other.capacity
                and self.items[:self.num_items] == other.items[:other.num_items])
        
    def __repr__(self):
        return ("Stack({!r}, {!r})".format(self.capacity, self.items[:self.num_items]))
    

    def is_empty(self): 
        if self.num_items == 0:
            return True
        else:
            return False
        '''Returns True if the stack is empty, and False otherwise
               MUST have O(1) performance'''
  
    def is_full(self): 
        if self.capacity == self.num_items:
            return True
        else:
            return False
            '''Returns True if the stack is full, and False otherwise
               MUST have O(1) performance'''
               
    def push(self, item):
        if not self.is_full():
            self.items[self.num_items] = item
            self.num_items += 1  
            return self.num_items
        else:
            raise IndexError
        
            '''If stack is not full, pushes item on stack. 
               If stack is full when push is attempted, raises IndexError
               MUST have O(1) performance'''
               
    def pop(self): 
        if not self.is_empty():
            temp = self.items[self.num_items -1]
            self.items[self.num_items -1] = None
            self.num_items -= 1
            return temp
            
        else: 
            raise IndexError
            '''If stack is not empty, pops item from stack and returns item.
               If stack is empty when pop is attempted, raises IndexError
               MUST have O(1) performance'''
   
    def peek(self):
        if not self.is_empty():
            return self.items[self.num_items -1]
        else:
            raise IndexError
            '''If stack is not empty, returns next item to be popped (but does not 
    remove the item)
               If stack is empty, raises IndexError
               MUST have O(1) performance'''
               
    def size(self):
        return self.num_items
        '''Returns the number of elements currently in the stack, not the capacity
               MUST have O(1) performance'''


    """Converts an infix expression to an equivalent postfix expression """
    """Signature:  a string containing an infix expression where tokens are space 
    separated is the single input parameter and returns a string containing a postfix 
    expression where tokens are space separated"""

def operations(num1, num2, operator):
    if operator == "+":
        return num1 + num2
    if operator == "-":
        return num1 - num2
    if operator == "*":
        return num1 * num2
    if operator == "/":
        return num1 / num2
    if operator == "^":
        return num2 ** num1
    
    
def p(operator):
    if operator in '+-':
        return 1
    elif operator in '*/':
        return 2
    elif operator == '^':
        return 3
    
def infix_to_postfix(infixexp):  #stack items - must be a string
    """changes the expresssion from infix to postfix"""
    oper = '+-*/^()'
    stack = [] # initially stack empty
    new = [] # initially output empty
    new_expr = infixexp.split()
    for ch in new_expr:  
        if ch not in oper:  # if an operand then put it directly in postfix expression
            new.append(ch)
        elif ch== '(' :  # else operators should be put in stack
            stack.append('(')
        elif ch == '^':
            stack.append('^')
        elif ch== ')' :
            while stack and stack[-1]!= '(':
                new.append(stack.pop())
            stack.pop()

        else: # lesser priority can't be on top on higher or equal priority so pop and put in output   
            while stack and stack[-1]!= '(' and int(p(ch)) <= int(p(stack[-1])):
                new.append(stack.pop())
            stack.append(ch)

    while stack:
        new.append(stack.pop())
    
    return " ".join(new)

def postfix_eval(exp): 
    """ actually solves the new postfix expression """
   
    stack = Stack(30)
    oper = '+-*/^'
    s = exp.split()

    for i in s: #for each item in the string
        if i not in oper: #if the current index is a number
            stack.push(i) #add back to stack
        elif i == "+" : # if curent index is addition
            a = stack.pop()
            b = stack.pop()
            result = float(a) + float(b) #adds previous two values in stack
            stack.push(result)
        elif i == "-": # if curent index is subtraction
            a = stack.pop()
            b = stack.pop()
            result = float(b) - float(a) #subtracts the two values 
            stack.push(result)
        elif i == "*": # if curent index is multiplication
            a = stack.pop()
            b = stack.pop()
            result = float(a) * float(b) #multiplies the two values
            stack.push(result)
        elif i == "/": # if curent index is division
            a = stack.pop()
            b = stack.pop()
            try: 
                result = float(b) / float(a) #divdes first value by the second
                stack.push(result)
            except ZeroDivisionError:
                raise ValueError
        elif i == "^": # if curent index is exponent
            a = stack.pop()
            b = stack.pop()
            result = float(b)**float(a) #brings first value to the power of the second
            stack.push(result)
            
    return stack.pop()
    

def postfix_valid(postfixexpr):
    """ determines if the postfix expression is actually valid """
    valid = postfixexpr.split()
    op1 = 0
    op2 = 0
    
    if len(valid) == 0:
        return False
    elif valid[0] in "+-*/^":
        return False
    else:
        for i in valid:
            if i not in  "+-*/^":
                op1 = op1 + 1
            else:
                op2 = op2 + 1
                
    if (op1 - 1) == op2:
        return True
    else:
        return False
                     