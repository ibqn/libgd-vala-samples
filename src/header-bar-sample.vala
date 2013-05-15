public class HeaderBarSample : Gtk.Window {
    private bool use_custom;
    Gd.HeaderBar bar;

    public HeaderBarSample () {
        Object (title: "Test HeaderBar widget",
                window_position: Gtk.WindowPosition.CENTER);

        this.use_custom = true;

        this.set_size_request (400, 300);
        this.destroy.connect (Gtk.main_quit);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        this.add (box);

        this.bar = new Gd.HeaderBar ();
        box.pack_start (this.bar, false, true, 0);

        this.bar.set_title ("Title Title Title Title Title Title");
        this.bar.set_subtitle ("Subtitle Subtitle Subtitle Subtitle Subtitle Subtitle");
        Gtk.Button button = new Gtk.Button.with_label ("Switch");
        button.set_valign (Gtk.Align.CENTER);

        Gtk.StyleContext style_context = button.get_style_context ();
        style_context.add_class (Gtk.STYLE_CLASS_RAISED);
        this.bar.pack_start (button);

        button.clicked.connect (() => {
            Gtk.Image image = null;

            if (this.use_custom) {
                image = new Gtk.Image.from_icon_name ("face-wink-symbolic",
                                                      Gtk.IconSize.MENU);
                this.use_custom = false;
            }
            else {
                this.use_custom = true;
            }

            this.bar.set_custom_title (image);
        });

        button = new Gtk.Button.with_label ("Done");
        button.set_valign (Gtk.Align.CENTER);
        style_context = button.get_style_context ();
        style_context.add_class ("suggested-action");
        this.bar.pack_end (button);

        button = new Gtk.Button.with_label ("Almost");
        button.set_valign (Gtk.Align.CENTER);
        style_context = button.get_style_context ();
        style_context.add_class (Gtk.STYLE_CLASS_RAISED);
        this.bar.pack_end (button);
    }

    public static void main (string[] args) {
        Gtk.init (ref args);

        if (Environment.get_variable ("RTL") != null) {
            Gtk.Widget.set_default_direction (Gtk.TextDirection.RTL);
        }
        else {
            Gtk.Widget.set_default_direction (Gtk.TextDirection.LTR);
        }

        var hbs = new HeaderBarSample ();
        thb.show_all ();

        Gtk.main ();
    }
}
