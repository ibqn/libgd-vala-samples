public class StackSample : Gtk.Window {
    public StackSample () {
        Object (title: "Test Stack widget", window_position: Gtk.WindowPosition.CENTER);

        this.set_size_request (300, 300);
        this.destroy.connect (Gtk.main_quit);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        this.add (box);

        Gd.StackSwitcher switcher = new Gd.StackSwitcher ();
        box.pack_start (switcher, false, false, 0);

        Gd.Stack stack = new Gd.Stack ();
        stack.set_transition_duration (500);
        stack.set_halign (Gtk.Align.START);
        box.add (stack);

        switcher.set_stack (stack);

        Gtk.TextView text_view = new Gtk.TextView ();
        text_view.get_buffer ().set_text ("This is a\nTest\nBlah!");
        stack.add_with_properties (text_view, "name", "1", "title", "1", null);

        Gtk.Button button = new Gtk.Button.with_label ("Gazoooooooooooooooonk");
        stack.add (button);
        stack.child_set (button, "name", "2", "title", "2", null);

        Gtk.ScrolledWindow scrolled_win = new Gtk.ScrolledWindow (null, null);
        scrolled_win.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        scrolled_win.set_size_request (100, 200);

        Gtk.ListStore store = new Gtk.ListStore (1, typeof (string));
        Gtk.TreeIter iter;

        for (int i = 0; i < 40; i ++) {
            store.insert_with_values (out iter, i, 0, "Test value", -1);
        }

        Gtk.TreeView tree_view = new Gtk.TreeView.with_model (store);
        scrolled_win.add (tree_view);

        Gtk.CellRendererText renderer = new Gtk.CellRendererText ();
        Gtk.TreeViewColumn column = new Gtk.TreeViewColumn.with_attributes ("Target", renderer,
                                                                            "text", 0, null);
        tree_view.append_column (column);

        stack.add_titled (scrolled_win, "3", "3");

        Gtk.Box hbox = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        box.add (hbox);

        Gtk.Button btn = new Gtk.Button.with_label ("1");
        hbox.add (btn);
        btn.clicked.connect (() => { stack.visible_child = text_view; });

        btn = new Gtk.Button.with_label ("2");
        hbox.add (btn);
        btn.clicked.connect (() => { stack.visible_child = button; });

        btn = new Gtk.Button.with_label ("3");
        hbox.add (btn);
        btn.clicked.connect (() => { stack.visible_child = scrolled_win; });

        hbox = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        box.add (hbox);

        btn = new Gtk.Button.with_label ("one");
        hbox.add (btn);
        btn.clicked.connect (() => { stack.visible_child_name = "1"; });

        btn = new Gtk.Button.with_label ("two");
        hbox.add (btn);
        btn.clicked.connect (() => { stack.visible_child_name = "2"; });

        btn = new Gtk.Button.with_label ("three");
        hbox.add (btn);
        btn.clicked.connect (() => { stack.visible_child_name = "3"; });

        hbox = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        box.add (hbox);

        btn = new Gtk.CheckButton.with_label ("homogeneous");
        ((Gtk.ToggleButton)btn).set_active (stack.get_homogeneous ());
        btn.clicked.connect (() => {
            bool active  =  ((Gtk.ToggleButton)btn).get_active ();
            stack.set_homogeneous (active);
        });
        hbox.add (btn);

        Gtk.ComboBoxText combo = new Gtk.ComboBoxText ();
        combo.append_text ("NONE");
        combo.append_text ("CROSSFADE");
        combo.append_text ("SLIDE_RIGHT");
        combo.append_text ("SLIDE_LEFT");
        combo.set_active  (0);
        combo.changed.connect (() => {
            Gd.StackTransitionType id = (Gd.StackTransitionType)combo.get_active ();
            stack.set_transition_type (id);
        });
        hbox.add (combo);
    }

    public static void main (string[] args) {
        Gtk.init (ref args);

        var ss = new StackSample ();
        ss.show_all ();

        Gtk.main ();
    }
}