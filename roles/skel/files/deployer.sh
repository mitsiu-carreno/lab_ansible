# deployer.sh <group> <access> <file>
# deployer.sh v2a <544 | 644> /home/lab/instrumentos/gradeMe.sh
#                Exec  Read

for dir in /home/jupyter-$1*; do
    owner=$(stat -c '%U' "$dir")
    group=$(stat -c '%G' "$dir")
    install -o "$owner" -g "$group" -m $2 $3 "$dir/"
done
