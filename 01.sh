#!/bin/sh

domains=("https://google.com" "https://gooogle.com" "https://facebook.com" "https://twitter.com")

log="log.txt"

> "$log"

for d in "${domains[@]}"; do
    res=$(curl -s -o /dev/null -w "%{http_code}" -L "$d")
    
    # Перевірка статусу
    if [ "$res" -eq 200 ]; then
        echo "<$d> is UP" | tee -a "$log"
    else
        echo "<$d> is DOWN (HTTP status: $res)" | tee -a "$log"
    fi
done

echo "Results have been written to $log"
