LaTeX support for Lora font by Olga Karpushina and Alexei Vanyashin
Author: Dmitriy Nosachev, [quartz64@gmail.com](mailto:quartz64@gmail.com) 
Copyright: Dmitriy Nosachev, 2026. License: LPPL 1.3c (LaTeX files)

# About the font
Fonts are Copyright 2011 The Cyreal Project Authors [a@cyreal.org](mailto:a@cyreal.org),
     licensed under the SIL Open Font License, Version 1.1.,
     <http://scripts.sil.org/OFL>

From <https://github.com/cyrealtype/Lora-Cyrillic>:

> Lora is a well-balanced contemporary serif with roots in calligraphy. It is a text typeface with moderate contrast well suited for body text. A paragraph set in Lora will make a memorable appearance because of its brushed curves in contrast with driving serifs. The overall typographic voice of Lora perfectly conveys the mood of a modern-day story, or an art essay.

> Technically Lora is optimised for screen appearance, and works equally well in print.

> Designed by Olga Karpushina, and Alexei Vanyashin for Cyreal. Released in 2011 with contributions and assistance from Gayaneh Bagdasaryan.

> Lora is a Unicode typeface family that supports languages that use the Latin and Cyrillic scripts and its variants, and could be expanded to support other scripts.

This package provides the fonts and LaTeX support for them.

# Installation

1. To obtain the font files, update the submodules if you are building the package from the GitHub repository:

```
git submodule update --init --recursive
```

2. Use `l3build` to build the package.


# Changelog

## [1.0.0] - 2026-09-10

### Changed

- Switched to a more meaningful `l3build` instead of `make`

- Switched to the original font filenames (Lora[wght].ttf, Lora-Italic[wght].ttf)

## [0.1] - 2026-09-09
- The first release version.

