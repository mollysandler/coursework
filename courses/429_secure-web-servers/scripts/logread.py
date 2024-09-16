infile = "/home/andruu/code/429/server/myauth"

important = []
keep_phrases = ["Connection closed by"]
ignore_phrase = "error"

with open(infile) as f:
    f = f.readlines()

for line in f:
    for phrase in keep_phrases:
        if phrase in line and ignore_phrase not in line:
            if (a := line.find("user")) != -1:
                yourString = line[a + 5 : len(line)]
                important.append(yourString.split(" "))


users = {}
ips = {}



for login in important:
    count_ip = ips.get(login[1], 0)
    ips.update({login[1] : count_ip + 1})
    
    count_user = users.get(login[0], 0)
    users.update({login[0] : count_user + 1})

ip_list = sorted(ips.items(), key=lambda x:x[1] ,reverse=True)    

users_list = sorted(users.items(), key=lambda x:x[1] ,reverse=True)   

for ii in ip_list:
    print(ii[0], "\t", ii[1])

for ii in users_list:
    print(ii[0], "\t", ii[1])