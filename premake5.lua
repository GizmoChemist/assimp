project "assimp"
	kind "StaticLib"
	language "C++"

	targetdir  ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"code/**.h",
		"code/**.cpp",
		"include/assimp/**.h"
		"include/assimp/**.cpp"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"
		
	filter { "system:windows", "configurations:Release" }
		buildoptions "/MT"
