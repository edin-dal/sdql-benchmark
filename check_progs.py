import os
import sys
from typing import Final

PROGS_SYMLINK: Final[str] = os.path.join(
    os.path.dirname(os.path.realpath(__file__)), "progs"
)


def check_progs():
    if not (
        os.path.islink(PROGS_SYMLINK) and os.path.isdir(os.readlink(PROGS_SYMLINK))
    ):
        sys.exit(
            "Follow instructions in README to create a symlink to the 'sdql/progs' directory"
        )
