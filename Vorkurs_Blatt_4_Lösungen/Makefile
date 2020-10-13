NUMMER = 4

all: Blatt_$(NUMMER)_Lsg.pdf

build:
	@mkdir -p build

clean:
		@rm -rf build
		@echo 'Entferne build-Ordner'



.DELETE_ON_ERROR:
Blatt_$(NUMMER)_Lsg.pdf: Blatt_$(NUMMER)_Lsg.tex |build
	@TEXINPUTS="$(call translate,build:)" lualatex \
	  --output-directory=build \
	  --interaction=nonstopmode \
	  --halt-on-error \
	Blatt_$(NUMMER)_Lsg.tex|grep -B 12 -e'no output PDF file produced' -e'LuaTeX' --color=auto
	@echo
	@lualatex \
	  --output-directory=build \
	  --interaction=nonstopmode \
	  --halt-on-error \
	Blatt_$(NUMMER)_Lsg.tex>/dev/null
	@lualatex \
	  --output-directory=build \
	  --interaction=nonstopmode \
	  --halt-on-error \
	Blatt_$(NUMMER)_Lsg.tex|grep  -e'reference' -e'LuaTeX' --color=auto
	@mv build/Blatt_$(NUMMER)_Lsg.pdf Blatt_$(NUMMER)_Lsg.pdf
	@make clean
