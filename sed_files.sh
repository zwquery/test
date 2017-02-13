#!/bash/sh
# This simple tool automatically blanks 'classical' links in all .html files from current folder"
echo "Your links will be broken :"
for f in *.html 
do 
	echo "Processing $f file..."
	sed -i "s|<a[^>]* href=\"[^\"]*|<a href=\"#|g" "$f"
	cat "$f" >> log.txt
done
