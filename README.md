# jsonfmt

Ridiculously simple and effective JSON formatter.

## Installation

Run `nimble install jsonfmt`.

## Usage

The simplest way to run the tool is to pass the JSON file (in this case
`db.json`) as the first positional argument (required):

```bash
jsonfmt /path/to/json/file/my_json.json
```

To specify indent, add `--indent INT` argument:

```bash
jsonfmt /path/to/json/file/db.json --indent 2
```

To specify the output file, add the second (optional) positional argument:

```bash
jsonfmt /path/to/json/file/db.json /path/to/json/file/db_formatted.json --indent 2
```

## Motivation

**Why another JSON formatter?** Unfortunately, VS
Code's JSON formatter does not handle JSON files larger than 50 MB. And, as
you probably know, sometimes you need to pretty format/print larger JSON files.
This tool can format JSON files up to 1 GB in size (tested), probably more,
depending on how much RAM you have available.

**Why Nim?** I wanted to try and experiment with the language.
