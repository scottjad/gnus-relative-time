;;; Author: Scott Jaderholm <myfirstname at mylastname dot com>
;;; 2012
;;; License: GPL 3

;;; Usage:
;;; Add %u&relative-time; to your gnus-summary-line-format.

;;; Example:
;;; (setq-default gnus-summary-line-format
;;;   "%U%R%z %2t %(%* %s%B%-60=  %-20,20a %u&relative-time;%)\n)")

(defun jsj-relative-time (seconds)
  (cond ((< seconds 120) (format  "%3d secs" seconds))
        ((< seconds (* 60 60 2)) (format "%3d mins" (/ seconds 60)))
        ((< seconds (* 60 60 24 2)) (format "%3d hours" (/ seconds (* 60 60))))
        ((< seconds (* 60 60 24 14)) (format "%3d days" (/ seconds (* 60 60 24))))
        ((< seconds (* 60 60 24 61)) (format "%3d weeks" (/ seconds (* 60 60 24 7))))
        ((< seconds (* 60 60 24 (* 2 365))) (format "%3d months" (/ seconds (* 60 60 24 30))))
        (t (format "%3d years" (/ seconds (* 60 60 24 365))))))

(defun gnus-user-format-function-relative-time (headers)
  "foo"
  (let ((seconds (time-to-seconds (time-subtract (current-time)
                                                 (gnus-date-get-time (aref headers 3))))))
    (pretty-time seconds)))
