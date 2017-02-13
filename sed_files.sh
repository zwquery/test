#!/bash/sh
echo "First one :"
for f in *.html 
do 
	echo "Processing $f file..."
	sed -i "s|<a[^>]* href=\"[^\"]*|<a href=\"#|g" "$f"
	cat "$f" >> log.txt
done
