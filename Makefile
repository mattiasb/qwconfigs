PREFIX=$(HOME)/.var/app/io.github.ezQuake/.ezquake
PLAYERS=moo sata
PLAYER=
CONFIG=$(PLAYER:%=%.cfg)
CONFIGS=$(PLAYERS:=.cfg)
INSTALLED_CONFIGS=$(CONFIGS:%.cfg=$(PREFIX)/id1/%.cfg)

$(INSTALLED_CONFIGS): %.cfg : $(PREFIX)/id1/%.cfg
	/bin/install -m 644 -D $< $^

install: $(INSTALLED_CONFIGS)
	echo "exec $(CONFIG)" > $(PREFIX)/id1/autoexec.cfg

uninstall:
	@rm $(PREFIX)/id1/autoexec.cfg || true
	@for p in $(INSTALLED_CONFIGS); do rm "$${p}"; done
