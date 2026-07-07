# ./gen.sh <prefix> <number_of_randoms>
# ./gen.sh aa 30

for i in $(seq $2); do
  printf $1
  openssl rand -base64 12 | tr -dc 'a-z0-9' | head -c 10
  echo
done
