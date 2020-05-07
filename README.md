# Installation

Either use this project as submodule in another project, or clone it to your local `texmf/` folder.
Please refer to the documentation of the [TeX Directory Structure (TDS)](http://tug.org/tds/tds.html).

# Usage

## Documentclass Options

Your thesis document requires at least the following lines at the start of the
preamble:

```latex
\documentclass[12pt,ngerman]{rftthesis}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{csquotes}
```

The documentclass options set the font size to 12pt and the language to German.
Currently, English language support is missing.

Please refer to the following documentation for the used packages:

* [inputenc](https://ctan.org/pkg/inputenc)
* [fontenc](https://ctan.org/pkg/fontenc?lang=de)
* [csquotes](https://ctan.org/pkg/csquotes)

The options given above for the used packages should work under the most Unix
based operating systems. Windows might differ from `utf8` and `T1`.

## Title Page

The title page uses the following commands:

```latex
\title{<title>}
\type{<type>}
\author{<author>}
\matriculation{<matriculation>}
\studies{<studies>}
\firstsupervisor{<first supervisor name>}
\secondsupervisor{<second supervisor name>}
```

The `type` should be either *Bachelorarbeit* or *Masterarbeit*. `author` and
`matriculation` should be set according to the student. `studies` defaults to
*Luft- und Raumfahrttechnik* and needs to be reset for Bachelor students and
students from other study programs. `first supervisor name` defaults to
*Dr.-Ing. Klaus Brieß* while the `second supervisor name` needs to be set
explicitly.
