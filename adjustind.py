import argparse
from pathlib import Path


def adjust_index(jobname: str) -> None:
    index_path = Path(jobname).with_suffix(".ind")
    if not index_path.is_file():
        raise FileNotFoundError(f"Index file not found: {index_path}")

    content = index_path.read_text(encoding="utf-8")
    adjusted = content.replace("90", ".").replace("\\hyperpage", "")
    index_path.write_text(adjusted, encoding="utf-8", newline="\n")


def main() -> None:
    parser = argparse.ArgumentParser(description="Adjust GB-Template index locations.")
    parser.add_argument("jobname", help="LaTeX job name without the .ind extension")
    args = parser.parse_args()
    adjust_index(args.jobname)


if __name__ == "__main__":
    main()
