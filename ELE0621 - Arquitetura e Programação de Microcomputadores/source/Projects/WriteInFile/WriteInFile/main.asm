INCLUDE \masm32\include\masm32rt.inc

.DATA
    szFileName byte 'MyFile.txt',0
    text BYTE 'oiaaaaaaaaaaaaaassssssssssssssddddddddddd',0
    ;size WORD 10d
.DATA?
    hFile  HANDLE ?
    nBytes WORD ?

.CODE

_main PROC


    push edx
    INVOKE CreateFile,offset szFileName,GENERIC_WRITE,FILE_SHARE_READ,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL
    mov hFile,eax
    lea edx,text
    INVOKE  WriteFile,hFile,edx,1000,offset nBytes,NULL
    INVOKE  CloseHandle,hFile
    INVOKE  ExitProcess,0
_main ENDP
END _main