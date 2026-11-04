import argparse
import re
from pathlib import Path


def restore_appendix_locations(source_path: Path, content: str) -> str:
    source = source_path.read_text(encoding="utf-8")
    entries = re.finditer(
        r"\\indexentry\{([^|\n]+)\|hyperpage\}\{([A-Z])\}", source
    )
    for match in entries:
        term, location = match.groups()
        pattern = re.compile(
            r"(\\item\s+" + re.escape(term) + r"[^\n]*\\hfill\s*\{)[A-Z](\})"
        )
        content = pattern.sub(
            lambda found: found.group(1) + location + found.group(2),
            content,
            count=1,
        )
    return content


def adjust_index(jobname: str) -> None:
    index_path = Path(jobname).with_suffix(".ind")
    if not index_path.is_file():
        raise FileNotFoundError(f"Index file not found: {index_path}")

    content = index_path.read_text(encoding="utf-8")
    adjusted = content.replace("90", ".").replace("\\hyperpage", "")
    adjusted = restore_appendix_locations(index_path.with_suffix(".idx"), adjusted)
    index_path.write_text(adjusted, encoding="utf-8", newline="\n")


def main() -> None:
    parser = argparse.ArgumentParser(description="Adjust GB-Template index locations.")
    parser.add_argument("jobname", help="LaTeX job name without the .ind extension")
    args = parser.parse_args()
    adjust_index(args.jobname)


if __name__ == "__main__":
    main()
