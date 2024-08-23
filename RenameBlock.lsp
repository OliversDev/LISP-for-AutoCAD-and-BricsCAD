;;; RenameBlock: Command lets user know if block exists
;;; Run this in the command line (RenameBlock "oldName" "newName")
;;; Author: Oliver Wackenreuther
;;; www.website.com
;;; Version 1.0, Date 2024-08-15
(defun OW:RenameBlock (oldName newName / blk)
	(setq blk (tblsearch "BLOCK" oldName))
	(if blk
		(progn
			(command "_.rename" "block" oldName newName)
			(princ (strcat "\nBlock renamed from " oldName " to " newName))
		)
		(princ (strcat "\nBlock " oldName " does not exist."))
	)
	(princ)
)