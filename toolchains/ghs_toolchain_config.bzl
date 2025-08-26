load("@rules_cc//cc:defs.bzl", "cc_common")
load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
     "tool_path", "feature", "flag_group", "flag_set")
load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "artifact_name_pattern")

def _impl(ctx):
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier    = "ghs",
        host_system_name        = "local",
        target_system_name      = "local",
        target_cpu              = "arm",  # or the target CPU you're using with GHS
        target_libc             = "unknown",
        compiler                = "ghs",  # or the compiler executable name for GHS
        abi_version             = "unknown",
        abi_libc_version        = "unknown",
        tool_paths = [
            tool_path(name = "gcc",     path = "D:/ghs/comp_202014/ccthumb"),
            tool_path(name = "ld",      path = "D:/ghs/comp_202014/ccthumb"),
            tool_path(name = "ar",      path = "D:/ghs/comp_202014/ccthumb"),
            tool_path(name = "strip",   path = "D:/ghs/comp_202014/ccthumb"),
            tool_path(name = "cpp",     path = "D:/ghs/comp_202014/ccthumb"),
            tool_path(name = "nm",      path = "D:/ghs/comp_202014/ccthumb"),
            tool_path(name = "objdump", path = "D:/ghs/comp_202014/ccthumb"),
        ],
        cxx_builtin_include_directories = [
            "D:/ghs/comp_202014/include",
            "D:/ghs/comp_202014/ansi",
        ],
    )

#Ashish F1 : When this file gets call it comes here, it checks rule here for which our implementation is defined as above 
# with def _impl(ctx):so need to check there 
# Here _impl returns a CcToolchainConfigInfo object this tells bazel tool to compile and link source files and linker file 
# call ccarm.exe 

ghs_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "linker_flags": attr.string_list(default = ["-o", "%{output_execpath}"]),
    },
    provides = [CcToolchainConfigInfo],
)