# no-echo-when-format Extension For Quarto

Supress the source code for a given cell from your output file based on the document format.

## Installing

```bash
quarto add qmd-lab/no-echo-when-format
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

Add the `no-echo-when-format` code cell option to any code cell where would you like to suppress the printing of the source code into the output file. The suppression will only take effect when the document format matches the one that you specifies in the code cell option. Accepts all valid Quarto output formats (`pdf`, `html`, `docx`, etc).

The following will suppress the source code from printing only in pdf format. It will appear in any format that is not pdf.

```r
#| echo: true
#| no-echo-when-format: pdf

histogram(rnorm(10))
```

## Example

Here is the source code for a minimal example: [example.qmd](example.qmd).

