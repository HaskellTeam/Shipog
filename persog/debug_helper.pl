% debug helper
debug(MSG, Y) :- ( toggle(n), write("Debug: "), write(MSG), write(" "), write(Y), nl);!.
debug(MSG) :- debug(MSG, "").
toggle(y) :- !.
toggle(n) :- fail.
    