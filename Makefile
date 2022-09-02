.PHONY: clean

OUT_DIR := public/

INPUTS := index.rkt about.rkt projects.rkt
STYLES := $(OUT_DIR)/style.css
OUTPUTS := $(addprefix $(OUT_DIR), $(patsubst  %.rkt, %.html, $(INPUTS)))


all: $(OUTPUTS) $(STYLES)

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

$(OUT_DIR)%.html: %.rkt $(OUT_DIR)
	racket $< > $@

$(OUT_DIR)/style.css:
	cp style.css $(OUT_DIR)

clean:
	rm -f $(OUTPUTS)
