/*
Array structure:
	1. standart model
	2. varriants [needed part, new model]
*/

weaponsShirtAdd = [
//PM
	["Makarov",[["makarovSilencer","MakarovSD"]]],
	
//M9
	["M9",[["m9Silencer","M9SD"]]],
	
//AKS_74_U
	["AKS_74_U", [["aks74uSilencer","AKS_74_UN_kobra"]]], //aks74u silencer
	
//Ak74
	["AK_74", [["CSKobra","AKS_74_kobra"], ["PSO1","AKS_74_pso"], ["GP25","AK_74_GL"]]], //ak74 calimator ak74 pso ak74 gl
	
//Ak107
	["AK_107_kobra", [["PSO1","AK_107_pso"], ["GP25","AK_107_GL_kobra"]]], //ak107 pso ak107 gl
	["AK_107_pso", [["GP25","AK_107_GL_pso"]]],
	["AK_107_GL_kobra", [["PSO1","AK_107_GL_pso"]]],

//Bizon
	["Bizon", [["bizonSilencer","bizon_silenced"]]], //bizon silencer
	
//G36
	["G36C", [["SDeotech","G36_C_SD_eotech"]]], //g36 calimator
	
//M4A1
	["M4A1", [["Aim","M4A1_Aim"]]], //m4a1 calimator
	
//M4A1_camo  
	["M4A1_Aim_camo", [["M4A1CamoSilencer","M4A1_AIM_SD_camo"]]],
	["M4A1_HWS_GL_camo", [["M4A1CamoSilencer","M4A1_HWS_GL_SD_Camo"]]],
	
//M8_Carabine 
	["M8_carbine", [["m8GL","M8_carbineGL"]]], //m8 gl

//m16a2
	["M16A2", [["m16GL","M16A2GL"]]], //m16 gl

//m16a4
	["M16A4", [["ACG","M16A4_ACG"], ["m16GL","M16A4_GL"]]], 
	["M16A4_ACG", [["m16GL","M16A4_ACG_GL"]]], 

//mp5a5
	["MP5A5", [["MP5Silencer","MP5SD"]]],
	
//Pk
	["PK", [["1PN51","Pecheneg"]]]
];


/*
Array structure:
	1. standart model
	2. varriants [removeing part, new model]
*/

weaponsShirtRemove = [
//PM
	["MakarovSD",[["makarovSilencer","Makarov"]]],
	
//M9
	["M9SD",[["m9Silencer","M9"]]],
	
//AKS_74_U
	["AKS_74_UN_kobra", [["aks74uSilencer","AKS_74_U"]]],

//AK_74
	["AKS_74_kobra", [["CSKobra","AK_74"]]],
	["AKS_74_pso", [["PSO1","AK_74"]]],
	["AK_74_GL", [["GP25","AK_74"]]],
	
//Ak107
	["AK_107_pso", [["PSO1","AK_107_kobra"]]],
	["AK_107_GL_kobra", [["GP25","AK_107_GL_kobra"]]],
	["AK_107_GL_pso", [["GP25","AK_107_pso"], ["PSO1","AK_107_GL_kobra"]]],

//Bizon
	["bizon_silenced", [["bizonSilencer","Bizon"]]],
	
//G36
	["G36_C_SD_eotech", [["SDeotech","G36C"]]],
	
//M4A1
	["M4A1_Aim", [["Aim","M4A1"]]],
	
//M4A1_camo  
	["M4A1_AIM_SD_camo", [["M4A1CamoSilencer","M4A1_Aim_camo"]]],
	["M4A1_HWS_GL_SD_Camo", [["M4A1CamoSilencer","M4A1_HWS_GL_camo"]]],
	
//M8_Carabine 
	["M8_carbineGL", [["m8GL","M8_carbine"]]],

//m16a2
	["M16A2GL", [["m16GL","M16A2"]]], //m16 gl

//M16A4
	["M16A4_ACG", [["ACG","M16A4"]]],
	["M16A4_GL", [["m16GL","M16A4"]]], 
	["M16A4_ACG_GL", [["m16GL","M16A4_ACG"],["ACG","M16A4_GL"]]], 

//mp5a5
	["MP5SD", [["MP5Silencer","MP5A5"]]],
	
//Pecheneg
	["Pecheneg", [["1PN51","PK"]]]
];
