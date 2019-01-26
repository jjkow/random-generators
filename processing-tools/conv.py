f = open("dump.log", "r")
out = open("out.log", "w")
for x in f:
    a = x.rstrip()
    b = int(a, 0)
    b = format(b, '032b')
    c = str(b)
    c = (" ".join(c))
    out.write(c + '\n')
