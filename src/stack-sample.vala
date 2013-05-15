public class StackSample : Gtk.Window {
    public StackSample () {
        Object (title : "Test Stack widget");

        this.destroy.connect (Gtk.main_quit);
    }

    public static void main (string[] args) {
        Gtk.init (ref args);

        var ss = new StackSample ();
        ss.show_all ();

        Gtk.main ();
    }
}