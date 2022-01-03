# canvas_fill - the canvas (patch background)
# canvas_text_cursor - text insertion cursor for all canvas objects
# gop_box - the GOP rectangle (when editing GOP patches)
# obj_box_text - text in an object box
# msg_box_text - text in a message box
# comment
# selected - selection
# obj_box_outline_broken - outline of "broken" object
#                          (that failed to create)
# obj_box_outline
# msg_box_outline
# msg_box_fill - fill of a message box
# obj_box_fill - " " object box
# signal_cord - signal cord and outline of signal inlets
# msg_cord - message cord and outline of message inlets
# msg_iolet - message inlet/outlet fill
# msg_iolet_border - border/outline of message inlet
# signal_iolet - signal inlet/outlet fill
# signal_iolet_border - border/outline of signal iolet
# graph_outline - outline of arrays and GOP patches in the parent patch
# graph_text - color of the names of GOP patches in the parent patch
# selection_rectangle - selection rectangle color in edit mode
# txt_highlight - color text is highlighted (in the "background") when selected
# array_name - garray names
# array_values - array elements
# atom_box_fill - fill of gatoms (number box, symbol box)
# atom_box_text - text of gatoms
# atom_box_label - label of gatoms
# atom_box_outline - outline of gatoms
# atom_box_focus_outline - outline of gatoms with keyboard focus
# text_window_fill - [text] window background
# text_window_text - [text] window text
# text_window_highlight - like txt_highlight but for [text] window
# text_window_hl_text - color of highlighted text in [text] window
# text_window_cursor - [text] window cursor
# pdwindow_fill - background of post window
# pdwindow_fatal_text - text for fatal errors
# pdwindow_fatal_highlight - highlight (background) for fatal errors
# pdwindow_error_text - text for errors
# pdwindow_post_text - text for posting
# pdwindow_debug_text - text for verbose logs
# helpbrowser_fill
# helpbrowser_text
# helpbrowser_highlight - like txt_highlight but for help browser
# helpbrowser_hl_text - text highlight color (defaults to helpbrowser_text)

# bezier cords
proc redraw_cords {name, blank, op} {
    foreach wind [wm stackorder .] {
        if {[winfo class $wind] eq "PatchWindow"} {
            set canv ${wind}.c
            foreach record [$canv find withtag cord] {
                set tag [lindex [$canv gettags $record] 0]
                set coords [lreplace [$canv coords $tag] 2 end-2]
                ::pdtk_canvas::pdtk_coords {*}$coords $tag $canv
            }
        }
    }
}
trace variable ::curve_cords w redraw_cords
set ::curve_cords 1 ;# bezier cords

# gruvbox material light
array set ::pd_colors {
    gop_box 		         "#EA6962"

    atom_box_label 	 	     "#928374"
    comment 		         "#928374"

    obj_box_outline 	     "#f2e5bc"
    msg_box_outline 	     "#f2e5bc"
    atom_box_outline 	     "#f2e5bc"
    msg_box_fill 		     "#f2e5bc"
    obj_box_fill 		     "#f2e5bc"
    atom_box_fill 		     "#f2e5bc"
    atom_box_focus_outline   "#7DAEA3"

    obj_box_text 		     "#6c782e"
    msg_box_text 		     "#805F4B"
    atom_box_text 		     "#945e80"
    pdwindow_post_text 	     "#654735"
    helpbrowser_text 	     "#654735"
    text_window_text 	     "#654735"

    signal_cord 		     "#B0C15C"
    signal_iolet 		     "#B0C15C"
    signal_iolet_border      "#B0C15C"
    msg_cord 		         "#A8A29F"
    msg_iolet 		         "#A8A29F"
    msg_iolet_border         "#A8A29F"

    graph_outline 		     "#654735"
    graph_text 		         "#654735"
    array_name 		         "#654735"
    array_values 		     "#4C7A5D"

    canvas_fill 		     "#F9F5D7"
    pdwindow_fill 		     "#F9F5D7"
    text_window_fill 	     "#F9F5D7"
    helpbrowser_fill 	     "#F9F5D7"

    obj_box_outline_broken   "#c14a4a"
    pdwindow_fatal_text 	 "#c14a4a"
    pdwindow_error_text 	 "#c14a4a"
    pdwindow_fatal_highlight "#F9F5D7"
    pdwindow_debug_text 	 "#C35E0A"

    selection_rectangle      "#7DAEA3"
    selected 		         "#7DAEA3"
    helpbrowser_highlight 	 "#EBDBB2"
    helpbrowser_hl_text      "#7DAEA3"
    text_window_highlight    "#EBDBB2"
    text_window_hl_text      "#7DAEA3"
    txt_highlight 		     "#EBDBB2"
    txt_highlight_front      "#7DAEA3"

    text_window_cursor 	     "#654735"
    canvas_text_cursor 	     "#654735"
    cursor                   "#654735"

    scrollbox_fill           "#DCD6C5"
    text                     "#654735"
}
