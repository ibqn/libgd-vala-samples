bin_PROGRAMS = test-header-bar
test_header_bar_SOURCES = test-header-bar.vala \
				config.vapi

test_header_bar_LDFLAGS = $(LIBGD_VALA_SAMPLES_LIBS)
test_header_bar_CFLAGS  =  $(LIBGD_VALA_SAMPLES_CFLAGS)

AM_VALAFLAGS = \
	--target-glib=2.36 \
	--vapidir=libgd
	--pkg gd-1.0 \
	--pkg gtk-3.0

CLEANFILES = \
	$(patsubst %.vala,%.c,$(filter %.vala, $(SOURCES))) \
	*_vala.stamp

-include $(top_srcdir)/git.mk
