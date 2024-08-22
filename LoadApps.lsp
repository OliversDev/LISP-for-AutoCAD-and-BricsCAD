;;; LoadApps: startup file for loading various program files
;;; Author: Oliver Wackenreuther
;;; www.website.com
;;; Version 1.0, Date 2024-08-15
(setq globalLispPath "C:\\LISPFILEPATH\\")
(setq globalDllPath "C:\\DLLFILEPATH\\")

(defun OW:LoadLisp (/ lispList file)
    ;List of LISP files
    (setq lispList
        '("LispFileName1.lsp"
          "LispFileName2.lsp"
          "LispFileName3.lsp"
          )
    )
    ;Loop through each file and load it
    (foreach file lispList
        (if (/= (findfile (strcat globalLispPath file)) nil)
            (command "._netload" (strcat globalLispPath file))
            (alert (strcat "Unable to load " file " it was not found in " globalLispPath))
        )
    )
)

(defun OW:LoadNet (/ dllList file)
    ;List of DLL assembly files
    (setq dllList
        '("NetFileName1.dll"
          "NetFileName2.dll"
          "NetFileName3.dll"
          )
    )
    ;Loop through each file and load it
    (foreach file dllList
        (if (/= (findfile (strcat globalDllPath file)) nil)
            (command "._netload" (strcat globalDllPath file))
            (alert (strcat "Unable to load " file " it was not found in " globalDllPath))
        )
    )
)