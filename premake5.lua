project "GLAD"
    kind "StaticLib"
    staticruntime "on"

    language "C"

    targetdir (cwd .. "/bin/" .. outputdir .. "/%{prj.name}")
    objdir (cwd .. "/bin-obj/" .. outputdir .. "/%{prj.name}")

    files {
        "include/glab/glad.h",
        "include/KHR/khrplatform.h",
        "src/glad.c"
    }

    includedirs {
        "include"
    }

    filter "system:windows"
        --buildoptions { "/MT" } TODO remove if works
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
