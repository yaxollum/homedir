#!/usr/bin/env python3

import re
import subprocess
import sys
from pathlib import Path

if len(sys.argv) != 2:
    sys.exit("Expected file name as argument.")

input_file = sys.argv[1]

m = re.fullmatch(r"([a-z0-9]+_a\d+)_full.pdf", input_file)
if m is None:
    sys.exit("Unable to identify course/assignment number.")

assignment = m.group(1)

CODE_TEMPLATE = f"""l = []
q_count = 0

assert input_file == "{input_file}"
"""

config_file = Path(f"zz_config_{assignment}.py")
if not config_file.is_file():
    with open(config_file, "w") as f:
        f.write(CODE_TEMPLATE)

    subprocess.run(["vi", config_file])

with open(config_file, "r") as f:
    exec(f.read())

input_file_data = subprocess.run(
    ["pdftk", input_file, "dumpdata"], capture_output=True, text=True
).stdout

page_count = int(re.search(r"NumberOfPages: (\d+)\n", input_file_data).group(1))
if sum(l) != page_count:
    sys.exit(f"Provided list {l} does not match page count {page_count}")
if len(l) != q_count:
    sys.exit(f"Provided list {l} does not match question count {q_count}")

print(f"total: {page_count} pages, {q_count} questions")

current = 1

for i, k in enumerate(l):
    start = current
    end = current + k - 1
    current += k

    output_file = f"{assignment}q{i+1}.pdf"
    print(f"writing to {output_file} ...")
    subprocess.run(
        [
            "pdftk",
            input_file,
            "cat",
            f"{start}-{end}",
            "output",
            f"{assignment}q{i+1}.pdf",
        ]
    )
