//============================================================================
// Name        : patch_reg.cpp
// Author      : 
// Version     :
// Copyright   : This is badly written not indented but free...   :)
// Description : Simple tool to write registry key/value
//============================================================================

#include <iostream>
#include <Windows.h>
#include "resources.h"


using namespace std;

void writeKey(){

	HKEY hkey;
	    DWORD dwDisposition;
	    if(RegCreateKeyEx(HKEY_CURRENT_USER,
	      TEXT("Software\\NAME\\KEY"),
	      0, NULL, 0,
	      KEY_WRITE, NULL,
	      &hkey, &dwDisposition) == ERROR_SUCCESS)
	    {



	    	if (RegSetValueEx(hkey, TEXT("VALUE_NAME"), 0, REG_SZ, (LPBYTE)"VALUE", strlen("VALUE")*sizeof(char)) != ERROR_SUCCESS)
	    	{
	    		cout <<"Unable to set registry value value_name";
	    	}
	    	else
	    	{
	//    		cout << "OK success ;)" << endl;
	    	}

	    	RegCloseKey(hkey);
	    	}
	    	else
	        MessageBox(NULL,"error","",0);
			}



void DeleteMe()
{
  HANDLE hfl;
  DWORD len, d, v;
  char buff[268], szexe[272], szbat[272];
  len = GetTempPath(264, buff);
  if(buff[len-1] != '\\') buff[len++] = '\\';
  buff[len] = 't'; buff[len+1] = '.'; buff[len+2] = 'b';
  buff[len+3] = 'a'; buff[len+4] = 't'; buff[len+5] = 0;

  hfl = CreateFile(buff, GENERIC_WRITE, 0, 0,
                      CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);

  if(hfl == INVALID_HANDLE_VALUE) return;
  *((DWORD*) szbat) = 0x206C6564;

  len = GetShortPathName(buff, szbat+4, 264) + 4;
  *((DWORD*) szexe) = 0x6F686365;
  *((DWORD*) (szexe+4)) = 0x66666F20;
  *((WORD*) (szexe+8)) = 0x0A0D;

  WriteFile(hfl, szexe, 10, &v, 0);

  GetModuleFileName(0, buff, 264);
  *((DWORD*) szexe) = 0x206C6564;
  d = GetShortPathName(buff, szexe+4, 264) + 4;
  szexe[d] = 13; szexe[d+1] = 10;

  WriteFile(hfl, szexe, d+2, &v, 0);

  WriteFile(hfl, szbat, len, &v, 0);

  CloseHandle(hfl);

  *((DWORD*) szexe) = 0x6E65706F;

  szexe[4] = 0; szbat[len+4] = 0;

  ShellExecute(0, szexe, szbat+4, 0, 0, SW_HIDE);
}


int main()
{
	FreeConsole();
    writeKey();
	MessageBox(NULL,"Key written !","",0);
	DeleteMe();
	return 0;
}

