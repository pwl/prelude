;; (elpy-enable)

;; (require 'flycheck-mypy)

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-mode
  :config

  (setq lsp-idle-delay 0.5
        lsp-enable-symbol-highlighting t
        lsp-enable-snippet nil  ;; Not supported by company capf, which is the recommended company backend
        lsp-pyls-plugins-flake8-enabled t
        lsp-pyls-plugins-pydocstyle-enabled t
        lsp-pyls-plugins-pydocstyle-convention "numpy"
        lsp-pyls-plugins-pycodestyle-max-line-length 88
        lsp-pyls-plugins-jedi-completion-enabled t
        lsp-pyls-plugins-jedi-completion-fuzzy t
        ;; improves performance over nfs
        lsp-enable-file-watchers nil
        )
  (lsp-register-custom-settings
   '(
     ("pylsp.plugins.pyls_mypy.enabled" t t)
     ;; hangs when editing files over NFS
     ("pylsp.plugins.pyls_mypy.live_mode" nil t)
     ("pylsp.plugins.pyls_black.enabled" t t)
     ("pylsp.plugins.pyls_isort.enabled" t t)

     ;; Disable these as they're duplicated by flake8
     ("pylsp.plugins.pycodestyle.enabled" nil t)
     ("pylsp.plugins.mccabe.enabled" nil t)
     ("pylsp.plugins.pyflakes.enabled" nil t)
     ))

  :hook
  ((python-mode . lsp))
  )


;; this is slow for some reason
(add-hook 'python-mode-hook
          ( lambda () ( add-hook 'before-save-hook
                   'lsp-format-buffer ) ) )

;; (add-hook 'python-mode-hook
;;           ( lambda () ( add-hook 'before-save-hook
;;                                  'blacken-buffer) ) )

;; (custom-set-variables
;;  '(flycheck-python-flake8-executable "python3")
;;  '(flycheck-python-pycompile-executable "python3")
;;  '(flycheck-python-pylint-executable "python3")
;;  '(flycheck-python-mypy-executable "mypy")
;;  '(flycheck-python-mypy-args '("--ignore-missing-imports"))
;;  '(flycheck-disabled-checkers '(python-pylint))
;;  '(importmagic-python-interpreter "python3")
;;  '(elpy-rpc-python-command "python3")
;;  '(elpy-rpc-virtualenv-path 'system)
;; '(blacken-line-length 88)
;;  )


;; ;; (require 'company-box)
;; ;; (add-hook 'company-mode-hook 'company-box-mode)
