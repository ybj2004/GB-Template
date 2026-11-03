import argparse
import subprocess

from adjustind import adjust_index


def main() -> None:
    parser = argparse.ArgumentParser(description="Build the GB-Template index.")
    parser.add_argument("jobname", help="LaTeX job name without an extension")
    parser.add_argument("destination", help="Output .ind file")
    parser.add_argument("source", help="Input .idx file")
    args = parser.parse_args()

    subprocess.run(
        [
            "zhmakeindex",
            "-s",
            "gb-idxstyle.mst",
            "-o",
            args.destination,
            args.source,
        ],
        check=True,
    )
    adjust_index(args.jobname)


if __name__ == "__main__":
    main()
