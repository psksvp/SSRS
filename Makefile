SOURCES=$(wildcard chapters/*.md)

outputDirs:
	mkdir -p ./output

epub: $(SOURCES) outputDirs
	pandoc --embed-resources \
           -t epub3 \
           --css=style.epub.css \
           --metadata title="Sentimental Swordsman and the Ruthless Sword (多情劍客無情劍)" \
           --metadata author="Gu Long" \
           --epub-cover-image=cover.jpeg\
           -o output/SSRS.epub README.md $(SOURCES)
           
html:  $(SRCS) outputDirs
	pandoc --embed-resources=true --standalone \
           -t html5\
           --css=style.epub.css \
           --top-level-division=chapter \
           --metadata pagetitle="Sentimental Swordsman and the Ruthless Sword (多情劍客無情劍) by Gu Long" \
           -o output/SSRS.html README.md $(SOURCES)

clean: 
	rm -rf output