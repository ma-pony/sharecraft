"""VS02 → VS03 → VS04 in one scene: concrete-first, then morph to the general
form, then spotlight it. Render:

    manim -qm --format=gif --fps 30 examples/vs-concrete-to-abstract.py ConceptMorph

Demonstrates the signature explainer move from video.md's shot recipes, in
sharecraft's palette (deep ink + one accent — here violet).
"""
from manim import *

BG = "#0B0E14"
FG = "#ECEFF5"
MUTED = "#8B95A7"
ACCENT = "#9A86FF"


class ConceptMorph(Scene):
    def construct(self):
        self.camera.background_color = BG

        kicker = Text("VS02 · concrete first", font_size=22, color=ACCENT).to_edge(UP)
        self.play(FadeIn(kicker, shift=DOWN * 0.3))

        # VS02 — a concrete example: a 3 × 2 rectangle, area 6.
        rect = Rectangle(width=3.0, height=2.0, color=FG, stroke_width=3)
        rect.set_fill(ACCENT, opacity=0.10)
        w_lbl = Text("3", font_size=36, color=FG).next_to(rect, DOWN, buff=0.25)
        h_lbl = Text("2", font_size=36, color=FG).next_to(rect, LEFT, buff=0.25)
        area = Text("Area = 6", font_size=44, color=FG).next_to(rect, UP, buff=0.5)

        self.play(Create(rect))
        self.play(FadeIn(w_lbl, shift=UP * 0.2), FadeIn(h_lbl, shift=RIGHT * 0.2))
        self.play(Write(area))
        self.wait(0.8)

        # VS03 — morph the concrete into the general form (same thing!).
        kicker2 = Text("VS03 · morph to the general form", font_size=22, color=ACCENT).to_edge(UP)
        w2 = Text("w", font_size=36, color=ACCENT, slant=ITALIC).move_to(w_lbl)
        h2 = Text("h", font_size=36, color=ACCENT, slant=ITALIC).move_to(h_lbl)
        area2 = Text("Area = w · h", font_size=44, color=FG).move_to(area)

        self.play(Transform(kicker, kicker2))
        self.play(
            TransformMatchingShapes(w_lbl, w2),
            TransformMatchingShapes(h_lbl, h2),
        )
        self.play(TransformMatchingShapes(area, area2))
        self.wait(0.6)

        # VS04 — spotlight the insight.
        kicker3 = Text("VS04 · spotlight the insight", font_size=22, color=ACCENT).to_edge(UP)
        self.play(Transform(kicker, kicker3))
        self.play(Circumscribe(area2, color=ACCENT, time_width=0.5, run_time=1.6))
        self.play(Indicate(area2, color=ACCENT, scale_factor=1.15))
        self.wait(1.0)
