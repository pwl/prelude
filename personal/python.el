(require 'flycheck-mypy)

(add-to-list 'flycheck-disabled-checkers 'python-flake8)
(add-to-list 'flycheck-disabled-checkers 'python-pylint)

(custom-set-variables
 '(flycheck-python-flake8-executable "python3")
 '(flycheck-python-pycompile-executable "python3")
 '(flycheck-python-pylint-executable "python3")
 '(flycheck-python-mypy-executable "mypy")
 '(importmagic-python-interpreter "python3")
 )



(add-hook 'python-mode-hook (lambda ()
                              (importmagic-mode)
                              (flycheck-select-checker 'python-mypy)
                              (add-hook 'before-save-hook 'pyimport-remove-unused)
                              (add-hook 'before-save-hook 'importmagic-fix-imports)
                              (add-hook 'before-save-hook 'blacken-buffer)
                              ))
