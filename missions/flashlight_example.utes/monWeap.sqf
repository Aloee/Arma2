private ['_pWeapon','_sWeapon','_lastPriWeapon','_lastSecWeapon','_flashlightWeapons','_pWeaponCheck','_sWeaponCheck','_noLight'];


//array of weapons allowed to use flashlight. If you don't want weapons to use flashlight then simply remmove it from this array
 
_flashlightWeapons = ['JWC_FL_M9','JWC_FL_M9SD','JWC_FL_Makarov','JWC_FL_MakarovSD','JWC_FL_revolver_EP1','JWC_FL_Sa61_EP1',
                      'JWC_FL_Colt1911','JWC_FL_UZI_EP1','JWC_FL_UZI_SD_EP1','JWC_FL_KSVK','JWC_FL_m107',
                      'JWC_FL_m107_TWS_EP1','JWC_FL_M110_NVG_EP1','JWC_FL_M110_TWS_EP1','JWC_FL_M24_des_EP1','JWC_FL_M24',
                      'JWC_FL_M40A3','JWC_FL_SVD_des_EP1','JWC_FL_SVD','JWC_FL_SVD_CAMO','JWC_FL_SVD_NSPU_EP1',
                      'JWC_FL_Huntingrifle','JWC_FL_DMR','JWC_FL_M4SPR','JWC_FL_m8_sharpshooter','JWC_FL_M4A3_RCO_GL_EP1',
                      'JWC_FL_M4A1','JWC_FL_M16A2GL','JWC_FL_M16A2','JWC_FL_M14_EP1','JWC_FL_LeeEnfield','JWC_FL_G36C',
                      'JWC_FL_G36_C_SD_eotech','JWC_FL_G36a','JWC_FL_G36K','JWC_FL_MG36','JWC_FL_G36C_camo',
                      'JWC_FL_G36_C_SD_camo','JWC_FL_G36a_camo','JWC_FL_G36K_camo','JWC_FL_MG36_camo','JWC_FL_FN_FAL_ANPVS4',
                      'JWC_FL_FN_FAL','JWC_FL_AKS_74_pso','JWC_FL_AKS_74_NSPU','JWC_FL_AKS_74_kobra','JWC_FL_AKS_74_GOSHAWK',
                      'JWC_FL_AKS_74','JWC_FL_AK_47_S','JWC_FL_AK_47_M','JWC_FL_AK_74_GL_kobra','JWC_FL_AK_74_GL','JWC_FL_AK_74',
                      'JWC_FL_SCAR_L_CQC_CCO_SD','JWC_FL_SCAR_L_CQC','JWC_FL_SCAR_L_CQC_EGLM_Holo','JWC_FL_SCAR_L_STD_EGLM_RCO',
                      'JWC_FL_SCAR_L_STD_EGLM_TWS','JWC_FL_SCAR_L_STD_HOLO','JWC_FL_SCAR_L_STD_Mk4CQT','JWC_FL_Sa58P_EP1','JWC_FL_Sa58V_EP1',
                      'JWC_FL_Sa58V_RCO_EP1','JWC_FL_Sa58V_CCO_EP1','JWC_FL_AK_107_kobra','JWC_FL_AK_107_GL_kobra','JWC_FL_AK_107_GL_pso',
                      'JWC_FL_AK_107_pso','JWC_FL_AKS_74_UN_kobra','JWC_FL_bizon','JWC_FL_bizon_silenced','JWC_FL_M1014','JWC_FL_m16a4',
                      'JWC_FL_M16A4_GL','JWC_FL_M16A4_ACG_GL','JWC_FL_m16a4_acg','JWC_FL_M4A1_HWS_GL','JWC_FL_M4A1_HWS_GL_camo',
                      'JWC_FL_M4A1_HWS_GL_SD_Camo','JWC_FL_M4A1_RCO_GL','JWC_FL_M4A1_Aim','JWC_FL_M4A1_Aim_camo','JWC_FL_M4A1_AIM_SD_camo',
                      'JWC_FL_MP5A5','JWC_FL_MP5SD','JWC_FL_Saiga12K','JWC_FL_VSS_vintorez','JWC_FL_m8_carbine','JWC_FL_m8_carbineGL',
                      'JWC_FL_m8_compact','JWC_FL_Mk_48','JWC_FL_M240','JWC_FL_M249','JWC_FL_Pecheneg','JWC_FL_PK','JWC_FL_RPK_74',
                      'JWC_FL_m8_SAW','JWC_FL_m240_scoped_EP1','JWC_FL_M249_EP1','JWC_FL_M249_m145_EP1','JWC_FL_M249_TWS_EP1',
                      'JWC_FL_M60A4_EP1','JWC_FL_Mk_48_DES_EP1'];

_stdWeapons =        ['M9','M9SD','Makarov','MakarovSD','revolver_EP1','Sa61_EP1',
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

sleep 1.234;

  _noLight = true;

  _lastCurWeapon = '';

  while {true} do
  {
     _cWeapon = currentWeapon player;

     _cWeaponCheck = format ['JWC_FL_%1',_cWeapon];

     if ((_cWeapon != _lastCurWeapon) && (player hasWeapon 'jwc_tacticalFlashlight') && (_cWeaponCheck in _flashlightWeapons)) then
     {
              player removeWeapon _cWeapon;
              player addWeapon _cWeaponCheck;
              player selectWeapon _cWeaponCheck;
              _lastCurWeapon = primaryWeapon player;
              hint 'Flashlight attached';
              _noLight = false;
     };


     if !(player hasWeapon 'jwc_tacticalFlashlight') then
     {
        _noLight = true;
     };


     if (_noLight && _cWeapon in _flashlightWeapons) then
     {

        {
           _string = 'JWC_FL_';
           _check = format ['%1%2',_string,_x];
           if (_check == _cWeapon) then
           {
              player removeWeapon _cWeapon;
              player addWeapon _x;
              player selectWeapon _x;
              hint 'Flashlight detached';
           };
        } forEach _stdWeapons;

     };

     sleep 1;
   };