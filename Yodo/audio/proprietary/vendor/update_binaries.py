#!/usr/bin/env python3
import copy
import shutil
import argparse
import subprocess
from pathlib import Path


rewrited = [
    ("libcodec2_soft_common.so", "libcodec2_soft_common_prebuilt.so"),
    ("libsfplugin_ccodec_utils.so", "libsfplugin_ccodec_utils_prebuilt.so"),
    ("vendor.dolby.hardware.dms@2.0.so", "vendor.dolby.hardware.dms@2.0_prebuilt.so")
]

rewrited_self = [item[0] for item in rewrited]


def update_binaries(source_path: Path, dest_dir: str):
    dest_path = Path(dest_dir)

    for target_file in dest_path.rglob('*'):
        if not target_file.is_file():
            continue

        source_file = copy.copy(target_file)
        if source_file.name.endswith("_prebuilt.so"):
            source_file = source_file.with_name(source_file.name.removesuffix("_prebuilt.so") + ".so")
        source_file = source_path / source_file

        print(f"Updating: {source_file} -> {target_file}")
        shutil.copy2(source_file, target_file)

        for old, new in rewrited:
            if source_file.name == old:
                subprocess.run(["patchelf", "--set-soname", new, target_file], check=True, text=True)
            else:
                subprocess.run(["patchelf", "--replace-needed", old, new, target_file], check=True, text=True)


def main():
    parser = argparse.ArgumentParser(description="Update files")
    parser.add_argument('source_dir', type=Path, help='Source directory containing updated files')

    args = parser.parse_args()

    update_binaries(args.source_dir, 'bin')
    update_binaries(args.source_dir, 'lib64')


if __name__ == "__main__":
    main()