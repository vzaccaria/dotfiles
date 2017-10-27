# Lift command

Lift a command to produce a sequence of 0 ended list of strings,
example:

     lift cat filenames.txt | map echo ... _ ...

Available lift instances:

-   `lift find "<regex>"` : outputs list of file-names matching regex
-   `lift f <substr>` : smarter find
-   `lift fex <substr>` : smarter find by extension
-   `lift ag "<word>"` : search files for word
-   `lift head/tail/cat <filename>` : trivial
-   `lift ls <pars>` : trivial

# Map command

Maps a command to strings, each substituted into placeholder `_`:

    lift cat filenames.txt | map command ... _ ...

Use fmap instead of map to flatten results into a sequence of 0-ended
file names

# Find by extension (and execute)

If you need to execute based on extension, use

    fex <extension> <command> ... {} ...
