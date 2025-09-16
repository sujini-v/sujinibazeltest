load("@rules_cc//cc:defs.bzl", "cc_common")
load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
     "tool_path", "feature", "flag_group", "flag_set")
load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "artifact_name_pattern")
 #register_toolchains("//toolchains:ghs_toolchain_entry")
def _impl(ctx):
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "ghs",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "arm",  # or the target CPU you're using with GHS
        target_libc = "unknown",
        compiler = "ghs",  # or the compiler executable name for GHS
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = [
            # tool_path(name = "gcc", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            # tool_path(name = "ld", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            # tool_path(name = "ar", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            # tool_path(name = "strip", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            # tool_path(name = "cpp", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            # tool_path(name = "nm", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            # tool_path(name = "objdump", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            tool_path(name = "gcc", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            tool_path(name = "ld", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            tool_path(name = "ar", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            tool_path(name = "strip", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            tool_path(name = "cpp", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            tool_path(name = "nm", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),
            tool_path(name = "objdump", path = "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ccthumb"),

        ],
        cxx_builtin_include_directories = [
            "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//include",
            "https://github.com/sujini-v/sujinighscomplier/tree/GHSfloat/ghs/comp_202014//ansi",
        ],
    )

ghs_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "linker_flags": attr.string_list(default = ["-o", "%{output_execpath}"]),
    },
    provides = [CcToolchainConfigInfo],
)

