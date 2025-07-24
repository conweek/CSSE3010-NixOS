# CSSE3010-NixOS
This repository provides a NixOS flake for the course CSSE3010 at the University of Queensland.
Please note this is **NOT** official course resources and is **NOT** associated, endorsed or affiliated with the University of Queensland in any way whatsoever.

## Installation
1. Clone *[sourcelib](https://github.com/uqembeddedsys/sourcelib)*.
2. Clone this repository.
3. Copy the **flake.nix** and the **shell.nix** from this repository into the root of the sourcelib directory.
4. Modify the `flash` rule in `m_common.mk` within the directory `sourcelib/components/mk/` to be `echo -e ...` instead of `echo ...`.

## Usage
1. `cd` into the sourcelib directory and run `nix develop` in the terminal.
2. All the required tools should now be available for use and you should be able to `make`, `make flash` and `make clean`.
