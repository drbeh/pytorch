#!/bin/sh
set -eux

# Runs clang-format on allowlisted files.
# Requires a single argument, which is the <commit> argument to git-clang-format

# If you edit this allowlist, please edit the one in clang_format_all.py as well
find . -type f \
  -path './c10/*' -or \
  -path './ios/*' -or \
  -path './torch/csrc/jit/!(serialization/mobile_bytecode_generated.h)' -or \
  -path './torch/csrc/deploy/*' -or \
  -path './test/cpp/jit/*' -or \
  -path './test/cpp/tensorexpr/*' \
  | xargs tools/linter/git-clang-format --verbose "$1" --
