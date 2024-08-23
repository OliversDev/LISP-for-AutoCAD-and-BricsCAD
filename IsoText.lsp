;;; IsoText: Allows user to change text rotation and oblique angle to a predefined setting to achieve isometric text
;;; Author: Oliver Wackenreuther
;;; www.website.com
;;; Version 1.0, Date 2024-08-23
(defun c:OW:IsoText (/ ss ent ename eData option rotation oblique)
	(vl-load-com)
	(setq ss (ssget '((0 . "TEXT,MTEXT")))) ; Select text objects
	(if ss
		(progn
			(setq option (getint "\nChoose option: 1 for 30 Up, 2 for 30 Flat, 3 for -30 Up, 4 for -30 Flat: "))
			(cond
				((= option 1) (setq rotation (/ (* pi 30) 180) oblique (/ (* pi 30) 180))) ; 30 Up
				((= option 2) (setq rotation (/ (* pi 30) 180) oblique (/ (* pi 330) 180))) ; 30 Flat
				((= option 3) (setq rotation (/ (* pi -30) 180) oblique (/ (* pi -30) 180))) ; -30 Up
				((= option 4) (setq rotation (/ (* pi -30) 180) oblique (/ (* pi -330) 180))) ; -30 Flat
				(t (princ "\nInvalid option."))
			)
			(if (and rotation oblique)
				(repeat (sslength ss)
					(setq ent (ssname ss 0))
					(setq ename (vlax-ename->vla-object ent))
					(vla-put-rotation ename rotation)
					(vla-put-obliqueAngle ename oblique)
					(ssdel ent ss)
				)
			)
		)
	)
	(princ)
)