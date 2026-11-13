find /home/jupyter-*/ \
  \( -type d \( \
    -name '.jupyter' -o \
    -name '.local' -o \
    -name '.npm' -o \
    -name '.ipython' -o \
    -name '.ipynb_checkpoints' \
  \) -prune \) -o \
  \( -type f \
    ! -name '.lesshst' \
    ! -name '.profile' \
    ! -name '.bashrc' \
    ! -name '.bash_history' \
    ! -name '.bash_logout' \
    ! -name '*.pdf' \
    -print \) |
while IFS= read -r file; do
  echo  "$(wc -l < $file):\t $file"
done
