#!/usr/bin/env bash
while getopts a:n:u:d: flag
do
    case "${flag}" in
        a) author=${OPTARG};;
        n) name=${OPTARG};;
        u) urlname=${OPTARG};;
        d) description=${OPTARG};;
    esac
done

echo "Author: $author";
echo "Project Name: $name";
echo "Project URL name: $urlname";
echo "Description: $description";

echo "Renaming project..."

name_upper="$(echo $name|tr 'a-z' 'A-Z')"

# for filename in $(find . -name "*.*")
for filename in $(git ls-files)
do
    sed -i "s/phuclb1/$author/g" $filename
    sed -i "s/go-saas-practice/$urlname/g" $filename
    sed -i "s/Awesome go_saas_practice created by phuclb1/$description/g" $filename
    sed "s/PROJECT_NAME/$name_upper/g" $filename
    sed -i "s/go_saas_practice/$name/g" $filename
    echo "Renamed $filename"
done

mv cmd/app cmd/$name
mv pkg/app/app.go pkg/app/$name.go
mv pkg/app pkg/$name

# This command runs only once on GHA!
rm -rf .github/template.yml