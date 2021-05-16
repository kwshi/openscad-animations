
%/small.gif: %/large.gif
	gifsicle -o '$@' --resize-height 256 -k32 -f -O5 '$<'

.PHONY: README.md
README.md: justfile
	just readme-top > '$@'
