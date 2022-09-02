.PHONY: clean

OUT_DIR := public/

INPUTS := index.rkt about.rkt projects.rkt
OUTPUTS := $(addprefix $(OUT_DIR), $(patsubst  %.rkt, %.html, $(INPUTS)))


all: $(OUTPUTS)

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

$(OUT_DIR)%.html: %.rkt $(OUT_DIR)
	racket $< > $@

clean:
	rm -f $(OUTPUTS)
