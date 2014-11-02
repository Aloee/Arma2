private ['_weapons','_box'];

if (!isServer) exitWith {};

_box = _this select 0;

clearWeaponCargo _box;
clearMagazineCargo _box;

_weapons =        ['M9','M9SD','Makarov','MakarovSD','revolver_EP1','Sa61_EP1',
                   'Colt1911','UZI_EP1','UZI_SD_EP1','KSVK','m107',
                   'm107_TWS_EP1','M110_NVG_EP1','M110_TWS_EP1','M24_des_EP1','M24',
                   'M40A3','SVD_des_EP1','SVD','SVD_CAMO','SVD_NSPU_EP1',
                   'Huntingrifle','DMR','M4SPR','m8_sharpshooter','M4A3_RCO_GL_EP1',
                   'M4A1','M16A2GL','M16A2','M14_EP1','LeeEnfield','G36C',
                   'G36_C_SD_eotech','G36a','G36K','MG36','G36C_camo',
                   'G36_C_SD_camo','G36a_camo','G36K_camo','MG36_camo','FN_FAL_ANPVS4',
                   'FN_FAL','AKS_74_pso','AKS_74_NSPU','AKS_74_kobra','AKS_74_GOSHAWK',
                   'AKS_74','AK_47_S','AK_47_M','AK_74_GL_kobra','AK_74_GL','AK_74',
                   'SCAR_L_CQC_CCO_SD','SCAR_L_CQC','SCAR_L_CQC_EGLM_Holo','SCAR_L_STD_EGLM_RCO',
                   'SCAR_L_STD_EGLM_TWS','SCAR_L_STD_HOLO','SCAR_L_STD_Mk4CQT','Sa58P_EP1','Sa58V_EP1',
                   'Sa58V_RCO_EP1','Sa58V_CCO_EP1','AK_107_kobra','AK_107_GL_kobra','AK_107_GL_pso',
                   'AK_107_pso','AKS_74_UN_kobra','bizon','bizon_silenced','M1014','m16a4',
                   'M16A4_GL','M16A4_ACG_GL','m16a4_acg','M4A1_HWS_GL','M4A1_HWS_GL_camo',
                   'M4A1_HWS_GL_SD_Camo','M4A1_RCO_GL','M4A1_Aim','M4A1_Aim_camo','M4A1_AIM_SD_camo',
                   'MP5A5','MP5SD','Saiga12K','VSS_vintorez','m8_carbine','m8_carbineGL',
                   'm8_compact','Mk_48','M240','M249','Pecheneg','PK','RPK_74','m8_SAW','m240_scoped_EP1',
                   'M249_EP1','M249_m145_EP1','M249_TWS_EP1','M60A4_EP1','Mk_48_DES_EP1'];

_ammo  = ['64Rnd_9x19_Bizon','30Rnd_545x39_AKSD','7Rnd_45ACP_1911','20Rnd_556x45_Stanag',
          '5x_22_LR_17_HMR','75Rnd_545x39_RPK','30Rnd_9x19_MP5','100Rnd_556x45_BetaCMag',
          '15Rnd_9x19_M9SD','30Rnd_556x45_G36SD','200Rnd_556x45_M249','30Rnd_762x39_AK47',
          '8Rnd_B_Saiga12_74Slug','20Rnd_762x51_DMR','8Rnd_9x18_Makarov','30Rnd_556x45_StanagSD',
          '5Rnd_762x51_M24','30Rnd_545x39_AK','30Rnd_9x19_MP5SD','64Rnd_9x19_SD_Bizon',
          '30Rnd_556x45_G36','10Rnd_127x99_m107','8Rnd_B_Beneli_74Slug','20Rnd_9x39_SP5_VSS',
          '30Rnd_556x45_Stanag','8Rnd_9x18_MakarovSD','100Rnd_762x54_PK','10Rnd_762x54_SVD',
          '100Rnd_762x51_M240','15Rnd_9x19_M9','5Rnd_127x108_KSVK','10Rnd_9x39_SP5_VSS','20Rnd_B_765x17_Ball'];

{
_box addWeaponCargo [_x,1];
} forEach _weapons;

{
_box addMagazineCargo [_x,12];
} forEach _ammo;