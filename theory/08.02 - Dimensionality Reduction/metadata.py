# coding=utf-8

# Global settings.
document_class = "ext" + "article"  # Ext is for extsizes package.
font_size = "10pt"  # Allowed: 8pt, 9pt, 10pt, 11pt, 12pt, 14pt, 17pt, 20pt

# Front page.
## Setting title to None also ignores authors and date.
title = "Dimensionality Reduction"
authors = None
date = None

abstract = open("abstract.txt", "r").read()

table_contents = False

bibliography_style = "plain"


# Layout, as strings with specified metric unit.
top_margin = "3.5cm"
bot_margin = top_margin
left_margin = top_margin
right_margin = left_margin