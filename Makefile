TEXOPTIONS = -lualatex \
		--output-directory=build \
		--interaction=nonstopmode \
		--halt-on-error \
		--use-make \

TEXPREFIX = TEXINPUTS=build: \
	BIBINPUTS=build: \
	max_print_line=1048576 \

TEXSOURCE = praesentation.tex

all: build/Praesentation.pdf

work: | build
	$(TEXPREFIX)
	latexmk -pvc \
		$(TEXOPTIONS)\
		$(TEXSOURCE)

build/Praesentation.pdf: header.tex $(TEXSOURCE) | build
	$(TEXPREFIX)
	latexmk \
		$(TEXOPTIONS)\
		$(TEXSOURCE)
	#cp media/Cycloid.mp4 build/Cycloid.mp4

# Use this job to start the presentation
present: all
	pdfpc -s -p build/Praesentation.pdf

build:
	mkdir -p build

clean:
	rm -rf build

.phony: clean work build