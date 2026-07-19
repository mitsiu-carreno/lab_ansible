find /home -name '*.txt' | while IFS= read -r file; do
    echo "===== BEGIN: $file ====="
    cat "$file"
    echo
    echo "===== END: $file ====="
    echo
done
