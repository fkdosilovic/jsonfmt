import argparse
import std/json

from std/strutils import parseInt
from os import fileExists


when isMainModule:
  var parser = newParser("jsonfmt"):
    help("Ridiculously simple and effective JSON formatter.")
    arg("input", help="Absolute path to the JSON file.", nargs=1)
    arg("output", default=some(""), help="Absolute path to formatted JSON file.", nargs=1)
    option("--indent", default=some("4"), help="Indent.")

  let args = try:
    parser.parse()
  except:
    echo parser.help
    quit(QuitFailure)

  # Check if the passed file exists.
  if not fileExists(args.input):
    echo "The JSON file does not exist."
    quit(QuitFailure)

  # Parse the indent.
  let indent = try:
    parseInt(args.indent)
  except ValueError:
    echo "Indent should be an integer."
    quit(QuitFailure)

  # Prettify.
  let formattedJSON = json.pretty(json.parseFile(args.input), indent)
  if args.output.isEmptyOrWhitespace():
    echo formattedJSON
  else:
    writeFile(args.output, formattedJSON)
