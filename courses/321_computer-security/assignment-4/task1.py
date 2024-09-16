from Crypto.Hash import SHA256
import random
import time

# Takes an input and returns its SHA256 hash in hexadecimal format
def hash_input(input):
    sha256_hash = SHA256.new()
    sha256_hash.update(input.encode('utf-8'))
    return sha256_hash.hexdigest()

def generate_random_input():
    rand = ''.join(random.choice(
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
        ) for _ in range(16))
    #print("Random input: ", rand)
    return rand
    
def hash_input_truncated(input, num_bits):
    sha256_hash = SHA256.new()
    sha256_hash.update(input.encode('utf-8'))
    full_hash = int(sha256_hash.hexdigest(), 16)
    truncated_hash = full_hash % (2 ** num_bits)
    return truncated_hash

def find_collision(num_bits):
    hash_dict = set()
    start_time = time.time()
    input_count = 0
    
    while True:
        input_candidate = generate_random_input()
        truncated_hash = hash_input_truncated(input_candidate, num_bits)
        input_count += 1

        if truncated_hash in hash_dict:
            end_time = time.time()
            collision_time = end_time - start_time
            return input_candidate, hash_dict, input_count, collision_time
        else:
            hash_dict.add(truncated_hash)

# Test
# num_bits = 16 # You can change this to any value between 8 and 50
# collision_input, _, input_count, collision_time = find_collision(num_bits)
# print("Collision Found!")
# print("Input:", collision_input)
# print("Number of Inputs Tried:", input_count)
# print("Time taken to find collision:", collision_time, "seconds")

#test 1b:
in1 = "Hello world"
in2 = "Hello World"
print("input 1", in1, ": ", hash_input(in1))
print("input 2", in2, ": ", hash_input(in2))