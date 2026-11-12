find /home/jupyter-*/ \
  \( -type d \( \
    -name '.jupyter' -o \
    -name '.local' -o \
    -name '.npm' -o \
    -name '.ipynb_checkpoints' \ # without -o
  \) -prune \) -o \
  \( -type f \
    ! -name '.lesshst' \
    ! -name '.profile' \
    ! -name '.bashrc' \
    ! -name '.bash_history' \
    ! -name '.bash_logout' \
    -print \) |
while IFS= read -r file; do
  echo "========== BEGIN: $file ========="
  wc -l < "$file"
  echo
done
