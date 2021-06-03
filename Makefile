# Custom systemd Makefile that installs udev rules for LFS
# Bruce Dubbs 2014-04-02

# vim: tabstop=3

SHELL=/bin/bash

ifeq ($(V),)
 VB = @
else
 VB =
endif

all:
	@echo "Use the install target"

install: 
	@mkdir -pv $(DESTDIR)/lib/udev/rules.d \
              $(DESTDIR)/etc/udev/rules.d \
              $(DESTDIR)/usr/share/doc/udev

   # Copy rules
	@cp -v ./*.rules $(DESTDIR)/etc/udev/rules.d
	@cp -v ./*_rules           \
          ./init-net-rules.sh \
          ./rule_generator.functions $(DESTDIR)/lib/udev

   # Copy documentation
	@cp -v ./README     $(DESTDIR)/usr/share/doc/udev
	@cp -v ./*.txt      $(DESTDIR)/usr/share/doc/udev
