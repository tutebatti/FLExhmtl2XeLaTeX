# xhtml2tex

This repository provides code and documentation to transform Flex dictionary output in xhtml format to LaTeX via XSLT.
The project is carried out by [Beth Mardutho](bethmardutho.org).

## Content of Repository

- This `README.md`
- `.gitignore` (cf. https://git-scm.com/docs/gitignore)
- Folder `sample-entries` with subfolders for each sample entry of the dictionary in xhtml and derivatives
- XSLT file `xhtml2tex.xsl`
- Simple markdown file `xslt_structure.md` containing structure of XSLT for better readibility (long XSLT file cannot be easily navigated)
- `changelog.txt` to document changes
- Bash script `prettyxhtml.sh` for easy prettifying/formatting of Flex xhtml output 

## Workflow for Using _git(hub)_

For the time being, we follow a [simple feature branch workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow).
This means:

- There is the _main branch_ with the current stable code (mainly the XSLT file).
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
- Use transliteration instead of Syriac script: A, b, g, d, h, w, z, ḥ, ṭ, y, k, l, m, n, s, c, p, ṣ, q, r, š, t; o, a, e, i, u
- Avoid using dates in filenames: git is there to handle versions.
(For sample files exported from Flex, the date of adding the file to the repository is assumed to be the date it was exported.)
