#!/usr/bin/env gosh

(define CYR2LAT (make-hash-table 'string=?))

(hash-table-put! CYR2LAT "А" "a")
(hash-table-put! CYR2LAT "а" "a")
(hash-table-put! CYR2LAT "Б" "b")
(hash-table-put! CYR2LAT "б" "b")
(hash-table-put! CYR2LAT "В" "v")
(hash-table-put! CYR2LAT "в" "v")
(hash-table-put! CYR2LAT "Г" "g")
(hash-table-put! CYR2LAT "г" "g")
(hash-table-put! CYR2LAT "Д" "d")
(hash-table-put! CYR2LAT "д" "d")
(hash-table-put! CYR2LAT "Е" "e")
(hash-table-put! CYR2LAT "е" "e")

(define (cyr2lat char)
  (hash-table-get CYR2LAT char char))

(define (main args)
  (for-each (lambda (arg)
    (format #t "~A\n" arg)
    (let ((in (open-input-string arg)))
      (let loop ((ch (read-char in)))
        (cond ((eof-object? ch) (newline))
              (else
                (format #t "~A" (cyr2lat (x->string ch)))
                (loop (read-char in))))))) args))
