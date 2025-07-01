#!/bin/bash/
mkdir profiles;
zip_file="$1";
unzip "$zip_file";
echo "Pending file renaming and folder deletion..."
echo "Please do not close..."
directory_name="${zip_file%.zip}";
cd "$directory_name";
for f in *; do 
    
    cd "$f"
    name="$f"
    for i in *; do
        ext="${i##*.}"
        newName="$name.$ext"
        mv -f "$i" "$newName"
        mv -f "$newName" ../../profiles/
    done 
    cd ../;
    rm -rf "$f"
done
cd ../;
rm -rf "$directory_name";
echo "Complete! Thank you!"



