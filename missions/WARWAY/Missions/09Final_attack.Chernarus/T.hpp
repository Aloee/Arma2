class RscHTML {
  idc = -1;
  type = 9;
  style = 0x02;
  
  x = 1-safezoneW/2;y = 1.15;w = 1;h = 4.3;
  
  filename = "war.html";
  text="";
  
  colorBackground[] = {1,1,1,0};
  colorBold[] = {1, 0, 0, 1};
  colorLink[] = {0, 0, 0.1, 1};
  colorLinkActive[] = {1, 0, 0, 1};
  colorPicture[] = {1, 1, 1, 0.2};
  colorPictureBorder[] = {1, 0, 0, 0};
  colorPictureLink[] = {0, 0, 1, 0};
  colorPictureSelected[] = {0, 1, 0, 0.2};
  colorText[] = {1, 1, 1, 1};
  prevPage = "";
  nextPage = "";
	class H1 {font = "Zeppelin33Italic";fontBold = "EtelkaMonospaceProBold";sizeEx = 0.05;};
	class H2 {font = "Zeppelin32";fontBold = "Zeppelin33";sizeEx = 0.08;};
	class H3 {font = "Zeppelin32";fontBold = "Zeppelin33";sizeEx = 0.025;};
	class H4 {font = "Zeppelin32";fontBold = "Zeppelin33";sizeEx = 0.0275;};
	class H5 {font = "Zeppelin32";fontBold = "Zeppelin33";sizeEx = 0.03;};
	class H6 {font = "Zeppelin32";fontBold = "Zeppelin33";sizeEx = 0.0325;};
	class P  {font = "Zeppelin33Italic";fontBold = "EtelkaMonospaceProBold";sizeEx = 0.045;};
};

class RscText {
  idc = -1;
  type = 0;
  style = 0;
  colorBackground[] = {0, 0, 0, 1};
  colorText[] = {0, 0, 0, 1};
  font = "TahomaB";
  sizeEx = 0;
  h = 0.04;
  text = "";
};