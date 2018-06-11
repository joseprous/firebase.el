;;; firebase.el --- Run firebase CLI commands

;;; Commentary:

;; Run firebase CLI commands

;;; Code:

(defun firebase-run-async (command)
  (with-output-to-temp-buffer "*firebase*"
    (async-shell-command command
                   "*firebase*"
                   "*Messages*")
    (pop-to-buffer "*firebase*")))

(defun firebase-deploy-all ()
  (interactive)
  (firebase-run-async "firebase deploy"))

(defun firebase-deploy (feature)
  (firebase-run-async (concat "firebase deploy --only " feature)))

(defun firebase-deploy-hosting ()
  (interactive)
  (firebase-deploy "hosting"))

(defun firebase-deploy-functions ()
  (interactive)
  (firebase-deploy "functions"))

(defun firebase-deploy-database ()
  (interactive)
  (firebase-deploy "database"))

(defun firebase-deploy-storage ()
  (interactive)
  (firebase-deploy "storage"))

(defun firebase-deploy-firestore ()
  (interactive)
  (firebase-deploy "firestore"))

(provide 'firebase)
;;; firebase.el ends here
