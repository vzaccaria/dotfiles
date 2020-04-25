# Lift command

Lift a command to produce a sequence of 0 ended list of strings. Useful
for the map command (see below).

Available lift instances:

-   `,lift find "<regex>"` : outputs list of file-names matching regex
-   `,lift f <substr>` : smarter find
-   `,lift fe <substr>` : smarter find by extension
-   `,lift ag "<word>"` : search files for word
-   `,lift head/tail/cat <filename>` : trivial
-   `,lift ls <pars>` : trivial

# Map command

Maps a command to strings, each substituted into placeholder `{}`:

    ,lift cat filenames.txt | ,map command ... {} ...

Use ,fmap instead of ,map to flatten results into a sequence of 0-ended
file names. So as to reuse results for another map.

# Find and execute by extension 

If you need to execute based on extension, use

    fex <extension> <command> ... {} ...
