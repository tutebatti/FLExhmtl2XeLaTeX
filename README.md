# FLEx2LaTeX

This repository provides code and documentation to transform FLEx dictionary output in XHTML format to LaTeX via XSLT.
The project is carried out by [Beth Mardutho](bethmardutho.org).

## Content of Repository

- This `README.md`
- `.gitignore` (cf. https://git-scm.com/docs/gitignore)
- `.gitattributes` (cf. https://git-scm.com/docs/gitattributes)
- XSLT file `xhtml2xml.xsl`, used to transform messy XHTML output of FLEx into custom XML
- XSLT file `xml2xml.xsl`, used mainly for rearranging some sections and elements with wrong order in FLEx output
- XSLT file `xml2tex.xsl`, referring to the xsl modules (see next point)
- Folder `xsl-modules` with
    - XSLT templates for each section of an entry, included in `xml2tex.xsl` via `<xsl:include>`
    - Illustrations for each module showing correspondences between XML elements and PDF output to facilitate adaption
- Folder `sample-entries` with
    - Subfolders for each sample entry of the dictionary in XHTML, including a prettified version for better readability
    - Folder `pictures` with illustrations; files should be in PNG format and be named after the SEDRA id of the respective entry
- Simple markdown file `xhtml_structure.md` documenting structure of XHTML output of FLEx
- `changelog.txt` to document changes (in markdown format, but stored as TXT)
- Bash script `prettyxhtml.sh` for easy prettifying/formatting of Flex xhtml output (do not use this file for further processing: spaces cause problems; it is mainly meant for better readability when studying FLEx output)

## Basic idea and how to adapt

The transformation consists of four steps:

1) FLEx XHTML output, which mainly consists of `<div>` and `<span>` elements with a wide variety of `@class` attributes (used for CSS handling), is transformed to a custom XML format.
The transformation is achieved with an [identity transformation](http://dh.obdurodon.org/identity.xhtml) approach using the XSLT file `xhtml2xml.xsl`.
The general order of the FLEx output is kept.
In the resulting custom format, the elements are mainly named after the `@class` attributes just mentioned.
A notable exception is the handling of different scripts (e.g. Syriac or Arabic) and font styles (e.g. italics or superscript);
here, elements are created according to `@style` attributes.
Further, internal references (i.e., one entry referring to another one) are created based on `@href` attributes.
The only attributes in the original XHTML file that are kept as such in the output are the `@id` attributes for internal referencing.
More complex transformations based on conditionals is the handling of nested elements for Syriac as well as the handling of verb stems in etymology entries.

Future adaption will probably need to include additional `@class` attributes of `<span>` (or `div`) elements not
Another problem might be possible changes in FLEx and, accordingly, its output (e.g., different style for certain elements), which, however, should be easily adaptable.

2) A second XSLT file, `xml2xml.xsl`, is mainly meant to rearrange the elements in a more concise order, including the introduction of new parent elements which are not present in the original FLEx output.
This file, too, uses identity transformation.
First, orthographic variants are put in an `<orthography>` element;
non-Serto scripts (i.e., Estrangela and Eastern/Madnḥaya) are transformed to special elements.
Secondly, the whole etymology section is rearranged, with a parent element (e.g., `<etymsemitic>`) for each block;
"before" and "after" fields (e.g., `<etymaramaicbefore>`) are positioned at the beginning or end of each block.
Thirdly, morphology elements are put in an `<morphology>` element.
Fourthly, the verb stems for the etymologies are further restructured.

Adaption will possibly be needed regarding the verb stems as well as phonology and morphology;
both the latter sections are based on a possibly outdated sample entry.

3) A third XSLT file, `xml2tex.xsl`, is only a container that points to several modules.
These modules correspond to the different sections and elements of an entry.
For some modules, pictures showing the correspondences between the elements and the output are included for better documentation.
(However, these will need updating after most changes...)

These modules will need most adaption to achieve the desired output.
However, there can be no general remarks at this point.
Please refer to the individual XSLT files with the respective comments in the code for documentation.

4) The final XML file is compiled using XeLaTeX.
If problems are encountered, there can be two reasons:
either there are inconsistencies on the level of an individual entry (typos etc.) which need to be changed manually.
or there is a structural problem (e.g. the &/ampersand character appearing time and again in an element), which should be solved automatically via code.

### Switches

There are currently two switches: spacious/compact layout; show/hide dates (creation dates etc.).
In the beginning of file `xml2tex.xsl`, these can each be set to `true()` or `false()`.
Conditionals in the respective templates take care of the rest.
Further switches can be introduced following the same or similar method.

## Workflow for FLEx Output Transformation

### Preparation

1) Export the desired entries via `File` > `Export` > `Configured Dictionary` to the respective subfolder of `sample-entries`
2) Delete the created css files
3) Create a prettified version via `prettyxhtml.sh`

### Actual Transformation (see [] above)

1) Transform the XHTML file using `xhtml2xml`
2) Transform the result using `xml2xml`
3) Transform the result using `xml2tex`
4) Use the command `xelatex` to create a PDF

## Workflow for Using _git(hub)_

For the time being, we mostly follow a very basic versioning with only one main branch.

If necessary, a [simple feature branch workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow) can be used.
This would imply:

- There is the _main branch_ with the current code.
- For each new feature and development, a branch is created.
- The name of each such branch should start with `feature/`.
(Note that the slash (`/`) is simply part of the name, it does not imply a folder structure.
However, there can be no folder or branch simply named `feature`.)
- The _feature branch_ needs a telling name, such as `feature/better-orthography-section`.
- Git commits to a feature branch should be small, logical units.
Even if only a small change, the code of the commit should not bring about any errors.
- Commit messages should make clear what the commit does and why it does that (what problem is addressed and how?).
- If a feature is ready and everything is working, a [_pull request_](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) is made to merge the feature branch to the main branch.

## Naming Conventions

To facilitate working in (Linux) terminal, certain naming conventions regarding files and folders should be followed.

- Do not use spaces; use `-` and `_` instead separating logical units of two levels, respectively.
- Try to put the part of the name that distinguishes one file/folder from another up front.
E.g., use
- Avoid using dates in filenames: git is there to handle versions.
(For sample files exported from Flex, the date of adding the file to the repository is assumed to be the date it was exported.)
- Use transliteration instead of Syriac script:

|Syriac|Latin|
|---|---|
|ܐ|A|
|ܒ|b|
|ܓ|g|
|ܕ|d|
|ܗ|h|
|ܘ|w|
|ܙ|z|
|ܚ|H|
|ܛ|T|
|ܝ|y|
|ܟ|k|
|ܠ|l|
|ܡ|m|
|ܢ|n|
|ܣ|s|
|ܥ|c|
|ܦ|p|
|ܨ|S|
|ܩ|q|
|ܪ|r|
|ܫ|x|
|ܬ|t|
|---|---|
|ـܳ|o|
|ـܰ|a|
|ـܶ|e|
|ـܺ|i|
|ـܽ|u|
