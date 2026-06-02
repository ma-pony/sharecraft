# VHS tape — a reproducible terminal demo of the bundled HTML→PNG engine.
# Render:  vhs examples/terminal-demo.tape   (run from the repo root)
Output examples/terminal-demo.gif

Require python3

Set Shell bash
Set FontSize 24
Set Width 1240
Set Height 600
Set Padding 28
Set TypingSpeed 36ms
Set Theme { "name": "sharecraft", "background": "#0E1116", "foreground": "#E8ECF3", "cursor": "#FF6B5B", "selection": "#222836", "black": "#0E1116", "red": "#FF6B5B", "green": "#7BE0A8", "yellow": "#E5C07B", "blue": "#7BC8FF", "magenta": "#C792EA", "cyan": "#7BE0E0", "white": "#E8ECF3", "brightBlack": "#5A647A", "brightRed": "#FF8B7E", "brightGreen": "#9BEFC0", "brightYellow": "#F0D08B", "brightBlue": "#9BD4FF", "brightMagenta": "#D7AAF0", "brightCyan": "#9BE8E8", "brightWhite": "#F5F7FA" }

Hide
Type "cp examples/launch-card.html card.html && clear" Enter
Show

Type "# One bundled script turns hand-authored HTML into a pixel-perfect PNG"
Enter
Sleep 800ms
Type "python3 scripts/html_to_image.py card.html card.png --width 1600 --height 900 --scale 2"
Sleep 600ms
Enter
Sleep 3.4s
Type "ls -lh card.png"
Enter
Sleep 2s

Hide
Type "rm -f card.html card.png" Enter
Show
Sleep 500ms
