bin_PROGRAMS = \
	test-header-bar \
	test-revealer

test_header_bar_SOURCES = \
	test-header-bar.vala \
	config.vapi

test_revealer_SOURCES = \
	test-revealer.vala \
	config.vapi

AM_LDFLAGS = \
	-export-dynamic \
	$(top_srcdir)/libgd/libgd.la \
	$(LIBGD_VALA_SAMPLES_LIBS)

AM_CFLAGS = \
	$(LIBGD_VALA_SAMPLES_CFLAGS) \
	-Wall

AM_CPPFLAGS = \
	-I$(top_srcdir)/libgd

AM_VALAFLAGS = \
	--target-glib=2.36 \
	--vapidir=$(top_srcdir)/libgd \
	--pkg gd-1.0 \
	--pkg gtk+-3.0

CLEANFILES = \
	$(patsubst %.vala,%.c,$(filter %.vala, $(SOURCES))) \
	*_vala.stamp

-include $(top_srcdir)/git.mk
