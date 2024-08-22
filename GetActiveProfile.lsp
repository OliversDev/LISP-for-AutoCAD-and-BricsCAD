;;; Returns active profile name
;;; Author: Oliver Wackenreuther
;;; www.website.com
;;; Version 1.0, Date 2024-08-22
(defun c:OW:GetActiveProfile ( / actprofile)
	(vl-load-com)
	(setq acadobject (vlax-get-Acad-Object))
	(setq acadprefs (vla-get-preferences acadobject))
	(setq acadprofiles (vla-get-profiles acadprefs))
	(setq actprofile (vla-get-ActiveProfile acadprofiles))
	(princ (strcase actprofile))
)