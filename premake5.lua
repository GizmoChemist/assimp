project "zlib"
	kind "StaticLib"
	language "C++"
	cppdialect "C++14"
	warnings "Off"
	location "contrib/zlib"
	
	targetdir ("bin/"     .. outputdir .. "/")
	objdir    ("bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs
	{
		"./",
		"include",
		"code",
		"contrib/zlib"
	}
	
	files
	{
		"contrib/zlib/*.c",
		"contrib/zlib/*.h",
	}
	
	defines
	{
		"ASSIMP_BUILD_NO_M3D_IMPORTER",
		"ASSIMP_BUILD_NO_M3D_EXPORTER",
		"ASSIMP_BUILD_NO_VRML_IMPORTER"
	}
	
	filter "system:windows"
		systemversion "latest"
		staticruntime "On"
		buildoptions "/MD"

project "assimp"
	kind "SharedLib"
	language "C++"
	cppdialect "C++17"
	warnings "Off"

	targetdir ("bin/"     .. outputdir .. "/")
	objdir    ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	links { "zlib" }
	
	includedirs
	{
		"./",
		"include",
		"code",
		"contrib",
		
		"contrib/zlib",
		"contrib/pugixml/src",
		"contrib/utf8cpp/source",
		"contrib/rapidjson/include",
		"contrib/unzip",
		"contrib/openddlparser/include",
	}
	
	files 
	{
		"code/**.h",
		"code/**.cpp",
		"code/**.c",
		"include/**.h",
		"include/**.cpp",
		
		"contrib/clipper/clipper.cpp",
		"contrib/clipper/clipper.hpp",
		
		"contrib/Open3DGC/**.h",
		"contrib/Open3DGC/**.hpp",
		"contrib/Open3DGC/**.cpp",
		"contrib/Open3DGC/**.inl",
		
		"contrib/openddlparser/**.h",
		"contrib/openddlparser/**.cpp",
		
		"contrib/poly2tri/poly2tri/common/shapes.cc",
		"contrib/poly2tri/poly2tri/common/shapes.h",
		"contrib/poly2tri/poly2tri/common/utils.h",
		
		"contrib/poly2tri/poly2tri/sweep/*.h",
		"contrib/poly2tri/poly2tri/sweep/*.cc",
		
		"contrib/pugixml/src/**.hpp",
		"contrib/pugixml/src/**.cpp",
		
		"contrib/stb/stb_image.h",
		
		"contrib/unzip/*.h",
		"contrib/unzip/*.c",
		
		"contrib/zip/*.h",
		"contrib/zip/*.c"
	}
	
	defines
	{
		"ASSIMP_BUILD_NO_IFC_IMPORTER",
		"ASSIMP_BUILD_NO_IFC_EXPORTER",
		
		"ASSIMP_BUILD_NO_3MF_IMPORTER",
		"ASSIMP_BUILD_NO_3MF_EXPORTER",
		
		"ASSIMP_BUILD_DLL_EXPORT",
		"ASSIMP_BUILD_NO_M3D_IMPORTER",
		"ASSIMP_BUILD_NO_M3D_EXPORTER",
		"ASSIMP_BUILD_NO_VRML_IMPORTER",
		
		"ASSIMP_BUILD_NO_C4D_IMPORTER",
		"ASSIMP_BUILD_NO_USD_IMPORTER",
		"MINIZ_USE_UNALIGNED_LOADS_AND_STORES=0",
		"ASSIMP_IMPORTER_GLTF_USE_OPEN3DGC=1",
		"RAPIDJSON_HAS_STDSTRING=1",
		"RAPIDJSON_NOMEMBERITERATORCLASS",
		"OPENDDLPARSER_BUILD"
	}
	
	filter "system:windows"
		systemversion "latest"
		staticruntime "On"
		buildoptions "/MD"