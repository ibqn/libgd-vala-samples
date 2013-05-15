public class TestRevealer: Gtk.Window {
    public TestRevealer () {
        Object (type: Gtk.WindowType.TOPLEVEL);
        
        this.set_size_request (300, 300);
        this.title = "Test Gd.Revealer widget";
        this.hide_titlebar_when_maximized = false;
    }
 
    public static void main (string[] args) {
        Gtk.init (ref args);

        var tr = new TestRevealer ();
        tr.show_all ();

        Gtk.main ();
    }
}