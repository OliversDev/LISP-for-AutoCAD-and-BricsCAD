;;; 3DText: Extrudes text entered by the user with variable height and thickness but static text style
;;; Author: Oliver Wackenreuther
;;; www.website.com
;;; Version 1.0, Date 2024-08-23
(defun c:OW:3DText (/ text height thickness pt)
	(setq text (getstring "\nEnter the text: "))
	(setq height (getreal "\nEnter the 2D text height: "))
	(setq thickness (getreal "\nEnter the thickness Z elevation: "))
	(setq pt (getpoint "\nSpecify the insertion point: "))
	(command "_.-style" "3DTextStyle" "Arial" height 0.0 0.0 "N" "N" "N")
	(command "_.text" pt height 0.0 text)
	(setq textEntity (entlast))
	(command "_.extrude" textEntity "" thickness)
	(princ)
)