# VHS tape — a reproducible terminal demo of the bundled HTML→PNG engine.
# Render:  vhs examples/terminal-demo.tape   (run from the repo root)
Output examples/terminal-demo.gif

Require python3

Set Shell bash
Set FontSize 24
Set Width 1240
Set Height 600
Set Padding 28
Set TypingSpeed 34ms
Set Theme { "name": "sharecraft", "background": "#0E1116", "foreground": "#E8ECF3", "cursor": "#FF6B5B", "selection": "#222836", "black": "#0E1116", "red": "#FF6B5B", "green": "#7BE0A8", "yellow": "#E5C07B", "blue": "#7BC8FF", "magenta": "#C792EA", "cyan": "#7BE0E0", "white": "#E8ECF3", "brightBlack": "#5A647A", "brightRed": "#FF8B7E", "brightGreen": "#9BEFC0", "brightYellow": "#F0D08B", "brightBlue": "#9BD4FF", "brightMagenta": "#D7AAF0", "brightCyan": "#9BE8E8", "brightWhite": "#F5F7FA" }

# Build a tiny 3-card carousel fixture off-screen (each <section> is one card).
Hide
Type `printf '<style>section{width:1080px;height:1440px;background:#0E1116;color:#F5F7FA;font:800 96px -apple-system,sans-serif;display:flex;align-items:center;justify-content:center}#p2{color:#FF6B5B}</style><section id="cover">Cover</section><section id="p2">Page 2</section><section id="p3">Page 3</section>' > carousel.html` Enter
Type "clear" Enter
Show

Type "# One source file with many #id sections — one PNG each, one browser"
Enter
Sleep 700ms
Type "python3 scripts/html_to_image.py carousel.html out/ \"
Enter
Type "  --ids cover p2 p3 --width 1080 --height 1440 --scale 2"
Sleep 500ms
Enter
Sleep 4s
Type "ls -lh out/"
Enter
Sleep 2.4s

Hide
Type "rm -rf carousel.html out" Enter
Show
Sleep 400ms
