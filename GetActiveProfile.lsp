;;; Returns active profile name
;;; Author: Oliver Wackenreuther
;;; www.website.com
;;; Version 1.0, Date 2024-08-22
(defun c:OW:GetActiveProfile( / actprofile)
	(vl-load-com)
	; get reference to the application object
	(setq acadobject (vlax-get-Acad-Object))
	; get reference to the preference object
	(setq acadprefs (vla-get-preferences acadobject))
	; get reference to the preferencesProfile object
	(setq acadprofiles (vla-get-profiles acadprefs))
	; get active profile
	(setq actprofile (vla-get-ActiveProfile acadprofiles))
	;(princ (strcase actprofile))
)