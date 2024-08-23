;;; Returns active profile name
;;; Author: Francine Zimmermann
;;; https://forums.augi.com/showthread.php?145542-AutoCAD-LT-LARGE-file-size/page2
;;; Sourced Date 2024-08-22
(defun gc:GetDictEntries (dict / result) 
  	(and (= (type dict) 'ENAME) (setq dict (entget dict)))
  	(while (setq dict (vl-member-if (function (lambda (x) (= (car x) 3))) (cdr dict))) 
   		(setq result (cons (cons (cdar dict) (cdadr dict)) result))
  	)
  	(reverse result)
)

(defun c:RemoveAEC () 
  	(foreach dict (gc:GetDictEntries (namedobjdict)) 
    	(if (wcmatch (car dict) "*AEC*") 
     		(foreach entry
         		(gc:GetDictEntries (cdr dict)) 
        		(entdel (cdr entry))
      		)
      		(entdel (cdr dict))
    	)
  	)
  	(princ)
)