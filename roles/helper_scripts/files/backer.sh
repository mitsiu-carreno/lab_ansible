# backer.sh <path/to/dst>
# backer.sh /media/usb

#find /home -type d -path '/home/jupyter-*/starter/src' | while read -r src; do
#    id=$(basename "$(dirname "$(dirname "$src")")" | sed 's/^jupyter-//')
#    mkdir -p "$1/$id"
#    cp -a "$src" "$1/$id/"
#done

rsync -a --exclude='node_modules/' /home/ $1
