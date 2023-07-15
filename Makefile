CC65_URL = https://github.com/cc65/cc65/archive/refs/tags/V2.19.tar.gz
CC65_DIR = tools/cc65
current_dir = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SPRITE_DEBUG ?= 0
DEBUG ?= 0

.SILENT:

debug: ARGS = -v --debug-info -g
debug: CCARGS = -D SPRITE_DEBUG=${SPRITE_DEBUG}
debug: CAARGS = -W1
debug: LDARGS = --dbgfile rom/rgblocks.dbg -v

#build: GFXARGS = -s
build: CAARGS = -W0

build: cc65 compile assemble link clean
debug: cc65 compile assemble link

cc65: ${CC65_DIR}/bin/cc65
#gfx: temp/sprite.rle
assemble: temp/crt0.o
link: rom/rgblocks.nes

${CC65_DIR}/bin/cc65:
	printf "Installing cc65...\n"
	mkdir -p "${CC65_DIR}"
	wget -c "${CC65_URL}" -O - | tar -xz --strip-components=1 -C "${CC65_DIR}"
	cd "${CC65_DIR}" && $(MAKE) -s

#temp/sprite.rle: graphics/sprite.chr
#	$(info Compressing CHR data...)
#	python3 tools/utils/RLE.py -i sprite.chr -no-delta -o temp/sprite.rle ${GFXARGS}

temp/crt0.o: src/*.asm src/*.s
	$(info Assembling...)
	mkdir -p temp
	"${CC65_DIR}/bin/ca65" -I . -o temp/crt0.o src/system-runtime.asm ${ARGS} ${CAARGS}

rom/rgblocks.nes: temp/crt0.o config/ca65.cfg
	$(info Linking...)
	mkdir -p rom
	"${CC65_DIR}/bin/ld65" -o rom/rgblocks.nes -C config/ca65.cfg temp/crt0.o "${CC65_DIR}/lib/nes.lib" ${LDARGS}
clean:
	rm -R temp/

.PHONY: cc65 compile assemble link clean build debug
