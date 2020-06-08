(elpy-enable)

(require 'flycheck-mypy)

(custom-set-variables
 '(flycheck-python-flake8-executable "python3")
 '(flycheck-python-pycompile-executable "python3")
 '(flycheck-python-pylint-executable "python3")
 '(flycheck-python-mypy-executable "python3")
 '(flycheck-python-mypy-args '("--ignore-missing-imports"))
 '(importmagic-python-interpreter "python3")
 )



(add-hook 'python-mode-hook (lambda ()
                              ;; (importmagic-mode)
                              ;; (flycheck-select-checker 'python-mypy)
                              ;; (add-hook 'before-save-hook 'pyimpsort-buffer)
                              ;; (add-hook 'before-save-hook 'importmagic-fix-imports)
                              (add-hook 'before-save-hook 'blacken-buffer nil 'make-it-local)
                              ))
