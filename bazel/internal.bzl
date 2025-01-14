"""
This module contains internal helpers that should not be used outside of the
scripts in the `bazel/` directory.
"""

def redpanda_copts():
    """
    Add common options to redpanda targets.

    Returns:
      Options to be added to target.
    """

    # TODO(bazel) Bazel prefers -iquote "path" style includes in many cases. However,
    # our source tree uses bracket <path> style for dependencies. We need a way
    # to bridge this gap until we decide to fully switch over to Bazel at which
    # point this hack can be removed. To deal with this we add a `-I` parameter
    # for the include path of dependencies that are causing issues.
    copts = []
    copts.append("-Iexternal/abseil-cpp~")
    copts.append("-Iexternal/re2~")

    copts.append("-Werror")
    copts.append("-Wall")
    copts.append("-Wextra")
    copts.append("-Wno-missing-field-initializers")
    copts.append("-Wimplicit-fallthrough")

    return copts
