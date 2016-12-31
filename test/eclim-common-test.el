;;; command-tests.el --- Tests for sequences.el

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Tests for eclim.el

;;; Code:

(require 'el-mock)
; el-mock requires this
(require 'cl)

(ert-deftest java-accepted-filename-p-test ()
  (should (equal (eclim--accepted-filename-p "test.java") t)))

(ert-deftest javascript-accepted-filename-p-test ()
  (should (equal (eclim--accepted-filename-p "test.js") t)))

(ert-deftest xml-accepted-filename-p-test ()
  (should (equal (eclim--accepted-filename-p "test.xml") t)))

(ert-deftest ruby-accepted-filename-p-test ()
  (should (equal (eclim--accepted-filename-p "test.rb") t)))

(ert-deftest groovy-accepted-filename-p-test ()
  (should (equal (eclim--accepted-filename-p "test.groovy") t)))

(ert-deftest php-accepted-filename-p-test ()
  (should (equal (eclim--accepted-filename-p "test.php") t)))

(ert-deftest c-accepted-filename-p-test ()
  (should (equal (eclim--accepted-filename-p "test.c") t)))

(ert-deftest cc-accepted-filename-p-test ()
  (should (equal (eclim--accepted-filename-p "test.cc") t)))

(ert-deftest scala-accepted-filename-p-test ()
  (should (equal (eclim--accepted-filename-p "test.scala") t)))

(ert-deftest invalid-accepted-filename-p-test ()
  (should-not (equal (eclim--accepted-filename-p "test.xyz") t)))

(ert-deftest file-managed-p-test ()
  (should (equal (eclim--file-managed-p) nil)))

(ert-deftest file-managed-p-test ()
  (should (equal (eclim--file-managed-p) nil)))

(ert-deftest file-managed-p-test ()
  (with-mock
   (stub eclim-project-name => "eclim_proj")
   (should (equal (eclim--file-managed-p "file.java") "eclim_proj"))))

(ert-deftest accepted-p-test ()
  (with-mock
   (stub eclim-project-name => "eclim_proj")
   (should (equal (eclim--accepted-p "file.java") "eclim_proj"))))

(provide 'eclim-common-test)
;;; eclim-common-test ends here
