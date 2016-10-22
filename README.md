Markdown.vim
============

This is a plugin that formats finances into a table.

Requirements
------------
1. [tabular](https://github.com/godlygeek/tabular) to make tables look nice.
2. [UltiSnips](https://github.com/SirVer/ultisnips) to have completions.
3. [AsyncRun](https://github.com/skywind3000/asyncrun.vim) to compile the markdown into a pdf.

How it works
------------
There are two parts: The Perl script and the Ultisnips snippets.

1. The UltiSnips snippets allow for fast table and row generation.
2. The Perl script parses the data, adds values up, uses Google's chart API to download a pie graph.
3. AsyncRun then calls pandoc to convert the markdown into a pdf document, including the picture generated.
