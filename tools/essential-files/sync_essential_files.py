#!/usr/bin/env python3
"""Check or apply the essential repository files defined in essential-files.yml.

  sync_essential_files.py --root DIR check   exit 1 if a file is missing or a sync-mode file has drifted
  sync_essential_files.py --root DIR apply   write missing files, overwrite drifted sync-mode files

Each repo is read from DIR/<repo path>. Create-mode files that already exist are never changed.
"""
import argparse
import pathlib
import sys

import yaml

HERE = pathlib.Path(__file__).resolve().parent


def expected_files(manifest, root):
    """Yield (repo key, destination, rendered text, mode) for every file each repo should have."""
    commands = manifest["commands"]
    for key, repo in manifest["repos"].items():
        values = {
            "DESC": repo["description"],
            "VER": str(repo["version"]),
            "COMMANDS": commands[repo["commands"]].rstrip("\n"),
        }
        for entry in manifest["files"]:
            if key in entry.get("exclude", []):
                continue
            text = (HERE / entry["template"]).read_text()
            for name, value in values.items():
                text = text.replace(f"__{name}__", value)
            yield key, root / repo["path"] / entry["path"], text, entry["mode"]


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("action", choices=["check", "apply"])
    parser.add_argument("--root", required=True, type=pathlib.Path, help="directory that holds the repo checkouts")
    parser.add_argument("--manifest", type=pathlib.Path, default=HERE / "essential-files.yml")
    args = parser.parse_args()

    manifest = yaml.safe_load(args.manifest.read_text())
    issues = 0
    for key, dest, text, mode in expected_files(manifest, args.root):
        if not dest.exists():
            status = "missing"
        elif mode == "sync" and dest.read_text() != text:
            status = "drifted"
        else:
            continue
        issues += 1
        shown = dest.relative_to(args.root)
        if args.action == "apply":
            dest.parent.mkdir(parents=True, exist_ok=True)
            dest.write_text(text)
            if dest.suffix == ".sh":
                dest.chmod(0o755)
            print(f"{key}: {status}, wrote {shown}")
        else:
            print(f"{key}: {status} {shown}")

    if args.action == "check":
        print(f"{issues} issue(s)")
        return 1 if issues else 0
    print(f"applied {issues} change(s)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
