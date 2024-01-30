import sys

def main(filename, oldString, newString):
    with open(filename) as f:
        newText=f.read().replace(oldString, newString)

    with open(filename, "w") as f:
        f.write(newText)

if __name__== "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3])

with open("content.tpl", "w") as f:
    f.write(newText)
    EOM

    cat > script.py  <<- EOM
import sys

def main(filename, oldString, newString):
    with open(filename) as f:
        newText=f.read().replace(oldString, newString)

    with open(filename, "w") as f:
        f.write(newText)

if __name__== "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3])
EOM