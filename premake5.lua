project "GLAD"
    kind "StaticLib"
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
        buildoptions { "/MT" } 
        systemversion "latest"
        staticruntime "On"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"