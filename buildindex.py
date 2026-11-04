import argparse
import shutil
import subprocess
from pathlib import Path

from adjustind import adjust_index


def main() -> None:
    parser = argparse.ArgumentParser(description="Build the GB-Template index.")
    parser.add_argument("jobname", help="LaTeX job name without an extension")
    parser.add_argument("destination", help="Output .ind file")
    parser.add_argument("source", help="Input .idx file")
    args = parser.parse_args()

    project_root = Path(__file__).resolve().parent
    style_path = project_root / "gb-idxstyle.mst"
    executable = project_root / "zhmakeindex.exe"
    if not executable.is_file():
        executable = shutil.which("zhmakeindex")
    if executable is None:
        raise FileNotFoundError("zhmakeindex was not found")

    subprocess.run(
        [
            str(executable),
            "-s",
            str(style_path),
            "-o",
            args.destination,
            args.source,
        ],
        check=True,
    )
    adjust_index(args.jobname)


if __name__ == "__main__":
    main()
