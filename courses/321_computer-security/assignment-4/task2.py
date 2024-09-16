# Geneva Laurain
# Molly Sandler

import bcrypt
import time
import sys
import nltk
nltk.download('words')
from nltk.corpus import words

def crack_passwords(shadow_file):
    
    # Process shadow.txt 
    with open(shadow_file, "r") as f:
        lines = f.readlines()

    # Filter words for efficiency
    word_list = [word.lower() for word in words.words() if 6 <= len(word) <= 10]

    # parse entry as instructed in the assignment spec
    for line in lines:
        username, hash_string = line.strip().split(":")
        algorithm, workfactor, salt, hash_remainder = hash_string.split("$")

        start_time = time.time()
        
        # Password cracking
        for word in word_list:
            
            # use bcrypt to break down the hash
            if bcrypt.checkpw(word.encode("utf-8"), hash_string.encode("utf-8")):
                
                elapsed_time = time.time() - start_time
                print(f"Username: {username}")
                print(f"Password: {word}")
                print(f"Time taken: {elapsed_time:.2f} seconds\n")
                break  # Move to the next user

if __name__ == "__main__":
    shadow_file = "shadow.txt" 
    crack_passwords(shadow_file)














# wordList = [word for word in words.words() if 6<= len(word) <= 10]

# # filter words so that it is between 6 and 10 bits


# #load shadow.txt
# def load_shadow(fp):
#     data = []
#     with open(fp, 'r') as file:
#         for line in file:
#             data.append(line.strip())
#     return data





# #entry: Bilbo:$2b$08$J9FW66ZdPI2nrIMcOxFYI.qx268uZn.ajhymLP/YHaAsfBGP3Fnmq
# def parse_entry(entry):
#     parts = entry.split(':')

#     if len(parts) == 2:
#         user = parts[0]
#         algorithm, workfactor, salt_hash = parts[1].split('$')[1:4]
        
#         print("user: ", user)
#         print("algorithm", algorithm)
#         print("workfactor: ", workfactor)
#         print("salt_hash", salt_hash)
        
#         salt = salt_hash[:31]
#         print("salt: ", salt)
#         hash_value = salt_hash[31:]
#         print("hash_value: ", hash_value)
        
#         return {
#             'User': user,
#             'Algorithm': algorithm,
#             'Workfactor': workfactor,
#             'Salt': salt,
#             'Hash': hash_value
#         }
#     else:
#         print(f"Invalid entry: {entry}")
#         return None

# def cracking_script(shadow, wordList):
#     for user_entry in shadow:
#         result = parse_entry(user_entry)
#         if result is not None:
#             user = result['User']
#             algorithm = result['Algorithm']
#             workfactor = result['Workfactor']
#             stored_hash = result['Hash']
            
#             #print(f"User: {user}, Algorithm: {algorithm}, Workfactor: {workfactor}, Hash: {stored_hash}")

            
#             for word in wordList:
#                 hashed = bcrypt.hashpw(word.encode('utf-8'), stored_hash.encode('utf-8'))
#                 if bcrypt.checkpw(stored_hash.encode('utf-8'), hashed):
#                     print(f"Password for {user} found: {word}")
#                     break
#             else:
#                 print(f"Password for {user} not found")
            
        
# def main():
       
#     if len(sys.argv) != 2:
#         print("Insufficient number of args: task2.py shadow.txt")
#         sys.exit(1)    
        
#     shadow = sys.argv[1]
    
#     users = load_shadow(shadow)
    
#     start_time = time.time()
    
#     cracking_script(users, wordList)
    
#     end_time = time.time()
    
#     total_time = end_time - start_time
    
#     print(f"Total time taken: {total_time} seconds")
    


# if __name__ == "__main__":
#     main()
    
    
    
    
    
