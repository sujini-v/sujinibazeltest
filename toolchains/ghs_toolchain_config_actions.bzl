#load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "tool_path")
load("@rules_cc//cc:defs.bzl", "cc_common")
load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
     "tool_path", "feature", "flag_group", "flag_set", "action_config", "tool")
load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "artifact_name_pattern")

artifact_name_patterns = [
    artifact_name_pattern(
        category_name = "executable",
        prefix = "",
        extension = ".exe",  # or the extension required for your GHS toolchain
    ),
]

def _impl(ctx):
    action_configs = [
        action_config(
            action_name = "archive",
            tools = [tool_path(name = "ar", path = "D:/ghs/comp_202014/ccthumb.exe")],
            flag_sets = [
                flag_set(
                    flag_groups = [
                        flag_group(
                            flags = ["-r","-c","-s","-D", "%{output_file}", "%{input_files}"],
                        ),
                    ],
                ),
            ],
        ),
        action_config(
            action_name = "c-compile",
            tools = [tool_path(name = "gcc", path = "D:/ghs/comp_202014/ccthumb.exe")],
            flag_sets = [
                flag_set(
                    flag_groups = [
                        flag_group(
                            flags = ["-c", "%{input_file}", "-o", "%{output_file}"],
                        ),
                    ],
                ),
            ],
        ),
        action_config(
            action_name = "c-link-executable",
            tools = [tool_path(name = "ld", path = "D:/ghs/comp_202014/ccthumb.exe")],
            flag_sets = [
                flag_set(
                    flag_groups = [
                        flag_group(
                            flags = ["-o", "%{output_file}", "%{input_files}"],
                        ),
                    ],
                ),
            ],
        ),
    ]
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        artifact_name_patterns = artifact_name_patterns,
        toolchain_identifier = "ghs",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "arm64",  # or the target CPU you're using with GHS
        target_libc = "unknown",
        #linkopts = ["-Tdummy.ld"],
        compiler = "ghs",  # or the compiler executable name for GHS
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = [
            tool(path = "D:/ghs/comp_202014/ccthumb",),
            tool(path = "D:/ghs/comp_202014/ccthumb",),
            tool(path = "D:/ghs/comp_202014/ccthumb",),
            tool(path = "D:/ghs/comp_202014/ccthumb",),
            tool(path = "D:/ghs/comp_202014/ccthumb",),
            tool(path = "D:/ghs/comp_202014/ccthumb",),
            tool(path = "D:/ghs/comp_202014/ccthumb",),
        ],
        action_configs = action_configs,
#        features = [
#           feature(
#               name = "default_compile_flags",
#               enabled = True,
#               flag_sets = [
#                   flag_set(
#                       actions = ["c-compile"],
#                       flag_groups = [
#                           flag_group(flags = ["-c"]),  # Use the -c flag for compilation
#                       ],
#                   ),
#               ],
#           ),
#           feature(
#               name = "default_linker_flags",
#               enabled = True,
#               flag_sets = [
#                   flag_set(
#                       actions = ["c-link-executable"],
#                       flag_groups = [
#                           flag_group(flags = ["-entry:main", "-map", "-xlink",  "-ld=dummy.ld",])  # or the flags required for your GHS toolchain
#                       ],
#                   ),
                
#               ],
#           ),
#           feature(
#               name = "default_archive_flags",
#               enabled = True,
#               flag_sets = [
#               flag_set(
#                   actions = ["c-archive"],
#                   flag_groups = [
#                       flag_group(flags = ["rcsD"]),
#                       ],
#               ),
#               ],
#           ),
#       ],
        cxx_builtin_include_directories = [
            "D:/ghs/comp_202014/include",
            "D:/ghs/comp_202014/ansi",
            "D:/ghs/comp_202014/lib/arm64",
        ],
    )

ghs_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "linker_flags": attr.string_list(default = ["-o", "%{output_execpath}", "-Tdummy.ld"]),
    },
    provides = [CcToolchainConfigInfo],
)

