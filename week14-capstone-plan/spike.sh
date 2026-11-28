#!/bin/bash

# spike.sh - Can I list old backup archives?

mkdir -p testdata
echo "test backup" > testdata/a.txt

for i in 1 2 3 4 5; do
  tar -czf "testdata/test-$i.tar.gz" testdata/a.txt
  sleep 1
done

echo "Oldest two backup archives:"
ls -t testdata/test-*.tar.gz | tail -n +4
