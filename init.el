
(setq inhibit-splash-screen t)

;; 开启服务器模式
(server-mode 1)

;; 设置代码补全
(setq tab-always-indent 'complete)
;; (icomplete-mode t)

;; 自动补全括号
(electric-pair-mode t)

;; emacs-lisp语法函数
;;(setq name "lightmon")
;;(message name)
;;(defun func()
;;  (interactive)
;;  (message "hello, %s" name)
;;  )
;;(setq name "233")
;;(func)
;;(global-set-key (kbd "<f1>") 'func)

;; 启动时自动最大化
;; (toggle-frame-maximized)

;; 开启上方工具栏
;; (tool-bar-mode 1)

;; 开启右侧滚动框
;; (scroll-bar-mode 1)

;; 光标变细
;;(setq cursor-type 'bar)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~Administrator/.emacs.d/init.el"))
;; 将函数open-init-file绑定到<f2>键上
(global-set-key (kbd "<f2>") 'open-init-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(keycast company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 绑定查找函数定义快捷键
(global-set-key (kbd "C-h C-f") 'find-function)

;; 自带包管理安装company插件，开启company模式
(global-company-mode 1)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-n") 'company-select-previous)

;; 更改显示字体大小
(set-face-attribute 'default nil :height 130)

;; 让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; 包管理镜像站
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line

;; 防止反复调用package-refresh-contents会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;; modeline上显示我的所有的按键和执行的命令
(package-install 'keycast)
(keycast-mode-line-mode t)

;; 增强minibuffer补全
(package-install 'vertico)
(vertico-mode t)
