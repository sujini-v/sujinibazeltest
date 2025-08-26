load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
"tool_path", "feature", "flag_group", "flag_set", "artifact_name_pattern", "action_config", "tool")

load("@rules_cc//cc:defs.bzl", "cc_common")

artifact_name_patterns = [
    artifact_name_pattern(
        category_name = "executable",
        prefix = "",
        extension = ".exe",
    ),
    artifact_name_pattern(
        category_name = "static_library",
        prefix = "lib",
        extension = ".lib",
    ),
]

custom_archive_action = action_config(
    action_name = "link_static_library",
    enabled = True,
    tools = [tool(path = "D:/ghs/comp_202014/ccthumb")],
    flag_sets = [
        flag_set(
            flag_groups = [
                flag_group(flags = ["-rcsD"]),
                flag_group(flags = ["%{output_file}"]),
                flag_group(flags = ["%{input_file}"]),
            ],
        ),
    ],
)

def _impl(ctx):
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "ghs",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = "arm",
        target_libc = "unknown",
        compiler = "ghs",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = [
            tool_path(name = "gcc", path = "D:/ghs/comp_202014/ccthumb"),
            tool_path(name = "ld", path = "D:/ghs/comp_202014/ccthumb"),
            tool_path(name = "ar", path = "D:/ghs/comp_202014/ccthumb"),
            tool_path(name = "strip", path = "D:/ghs/comp_202014/ccthumb"),
            tool_path(name = "cpp", path = "D:/ghs/comp_202014/cxthumb"),
            tool_path(name = "nm", path = "D:/ghs/comp_202014/ccthumb"),
            tool_path(name = "objdump", path = "D:/ghs/comp_202014/ccthumb"),
        ],
        artifact_name_patterns = artifact_name_patterns,
        features = [
            feature(name = "static_linking_mode", enabled = True),
            feature(
                name = "default_linker_flags",
                enabled = True,
                flag_sets = [
                    flag_set(
                        actions = ["c-link"],
                        flag_groups = [
                            flag_group(flags = ["-entry:main", "-map", "-xlink"]),
                        ],
                    ),
                ],
            ),
        ],
        action_configs = [custom_archive_action],
        cxx_builtin_include_directories = [
            "D:/ghs/comp_202014/include",
            "D:/ghs/comp_202014/ansi",
        ],
    )

ghs_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "linker_flags": attr.string_list(default = ["-o", "%{output_execpath}"]),
    },
    provides = [CcToolchainConfigInfo],
)
