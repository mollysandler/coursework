import matplotlib.pyplot as plt

data = {
    2: (3, 0.0003008842468261719), 4: (11, 0.0005550384521484375), 6: (8, 0.00045180320739746094),
    8: (28, 0.0010859966278076172), 10: (14, 0.0006690025329589844), 12: (65, 0.0022399425506591797),
    14: (149, 0.0048220157623291016), 16: (112, 0.0036759376525878906), 18: (781, 0.027774810791015625),
    20: (655, 0.02314281463623047), 22: (2839, 0.09036612510681152), 24: (5015, 0.16292810440063477),
    26: (9045, 0.29329991340637207), 28: (24931, 0.8194370269775391), 30: (51014, 1.7026419639587402),
    32: (47841, 1.6434247493743896), 34: (294523, 10.14099407196045), 36: (718551, 24.528011083602905),
    38: (1140512, 38.24376821517944), 40: (758140, 25.488888025283813), 42: (2327482, 53.683939695358276),
    44: (9618159, 226.32035422325134), 46: (4831055, 116.43157720565796), 48: (14841214, 360.7649209499359),
    50: (73045590, 1736.4403879642487)
}

bits = list(data.keys())
inputs = [x[0] for x in data.values()]
time_seconds = [x[1] for x in data.values()]

plt.figure(figsize=(10, 6))

plt.subplot(2, 1, 1)
plt.plot(bits, inputs, marker='o', linestyle='-')
plt.title('Number of Inputs vs Number of Bits')
plt.xlabel('Number of bits')
plt.ylabel('Number of Inputs')
plt.grid(True)

plt.subplot(2, 1, 2)
plt.plot(bits, time_seconds, marker='o', linestyle='-')
plt.title('Time taken vs Number of Bits')
plt.xlabel('Number of bits')
plt.ylabel('Time (seconds)')
plt.grid(True)

plt.tight_layout()
plt.savefig("task1_graph.png")
plt.show()
