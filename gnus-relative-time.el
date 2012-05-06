;;; Author: Scott Jaderholm <myfirstname at mylastname dot com>
;;; 2012
;;; License: GPL 3

(defun gnus-user-format-function-relative-time (headers)
  "foo"
  (let ((seconds (time-to-seconds (time-subtract (current-time)
                                                 (gnus-date-get-time (aref headers 3))))))
    (cond ((< seconds 120) (format  "%3d secs" seconds))
          ((< seconds (* 60 60 2)) (format "%3d mins" (/ seconds 60)))
          ((< seconds (* 60 60 24 2)) (format "%3d hours" (/ seconds (* 60 60))))
          ((< seconds (* 60 60 24 14)) (format "%3d days" (/ seconds (* 60 60 24))))
          ((< seconds (* 60 60 24 61)) (format "%3d weeks" (/ seconds (* 60 60 24 7))))
          ((< seconds (* 60 60 24 (* 2 365))) (format "%3d months" (/ seconds (* 60 60 24 30))))
          (t (format "%3d years" (/ seconds (* 60 60 24 365)))))))

(setq-default  gnus-summary-line-format "%U%R%z %(%* %s%B%-60=  %-20,20f %u&relative-time;%)\n")
