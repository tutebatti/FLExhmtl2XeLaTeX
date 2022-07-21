# xhtml2tex

This repository provides code and documentation to transform FLEx dictionary output in xhtml format to LaTeX via XSLT.
The project is carried out by [Beth Mardutho](bethmardutho.org).

## Content of Repository

- This `README.md`
- `.gitignore` (cf. https://git-scm.com/docs/gitignore)
- XSLT file `xhtml2xml.xsl` (replacing the former, using "identity transformation")
- XSLT file `xml2xml.xsl` (used for rearranging the etymology section with wrong order in FLEx output)
- XSLT file `xml2tex.xsl`
- Folder `xsl-modules` with modules included in `xml2tex.xsl` via `<xsl:include>`
- Illustrations for each module showing correspondences between XML elements and PDF output to facilitate adaption
- Folder `sample-entries` with subfolders for each sample entry of the dictionary in xhtml and derivatives
- Folder `pictures` inside folder `sample-entries` with illustrations; files should be in PNG format and be named after the SEDRA id of the respective word
- Simple markdown file `xhtml_structure.md` documenting structure of XHTML output of FLEx 
- `changelog.txt` to document changes (in markdown format, but stored as TXT)
- Bash script `prettyxhtml.sh` for easy prettifying/formatting of Flex xhtml output (do not use this file for further processing: spaces cause problems; it is mainly meant for better readability when studying FLEx output)

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
