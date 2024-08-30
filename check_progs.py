import os
import sys
from pathlib import Path
from typing import Final

PROGS_SYMLINK: Final[Path] = Path(
    os.path.join(os.path.dirname(os.path.realpath(__file__)), "progs")
)


def check_progs():
    if not (
        PROGS_SYMLINK.is_symlink() and PROGS_SYMLINK.exists() and PROGS_SYMLINK.is_dir()
    ):
        sys.exit(
            "Follow instructions in README to create a symlink to the 'sdql/progs' directory"
        )
