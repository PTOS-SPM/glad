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

    filter "system:windows"
        buildoptions { "/MT" } 
        systemversion "latest"
        staticruntime "On"

        files
        {
            "src/win32_init.c",
            "src/win32_module.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.h",
            "src/win32_time.c",
            "src/win32_thread.h",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

        defines {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"