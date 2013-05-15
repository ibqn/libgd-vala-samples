bin_PROGRAMS = \
	header-bar-sample \
	revealer-sample \
	stack-sample

header_bar_sample_SOURCES = \
	header-bar-sample.vala \
	config.vapi

revealer_sample_SOURCES = \
	revealer-sample.vala \
	config.vapi

stack_sample_SOURCES = \
	stack-sample.vala \
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
