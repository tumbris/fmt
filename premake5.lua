project "lib_fmt"
    kind "StaticLib"
    language "C++"
    cppdialect(config.cppdialect)
    targetdir(config.workspace.target_dir)
    objdir(config.workspace.int_dir)

    files { config.workspace.lib_fmt.code_path .. "include/**.h" , config.workspace.lib_fmt.code_path .. "src/**.cc" }
    includedirs { config.include_dirs.lib_fmt }

    filter "configurations:Debug"
        local debug_defines = table.merge(config.workspace.defines.common, config.workspace.defines.debug)
        defines(debug_defines)
        symbols "On"

    filter "configurations:Release"
        local release_defines = table.merge(config.workspace.defines.common, config.workspace.defines.release)
        defines(release_defines)
        optimize "On"