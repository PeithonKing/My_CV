from os import listdir, remove, path

with open(".gitignore") as f:
    ignore = [".git"] + [a[2:-1] for a in f.readlines() if a.startswith("!") and a!="!*/"]

def not_important(filename):
    for ig in ignore:
        if filename.endswith(ig):
            return False
    return True



l = listdir()

for li in l:
    if not_important(li) and path.isfile(li):
        print(f"removing: {li}")
        remove(li)