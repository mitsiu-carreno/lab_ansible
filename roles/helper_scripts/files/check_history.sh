find /home -mindepth 2 -maxdepth 2 -name '.bash_history' | while IFS= read -r hist; do
    printf '===== BEGIN: %s =====\n' "$hist"
    cat "$hist"
    printf '\n===== END: %s =====\n\n' "$hist"
done
