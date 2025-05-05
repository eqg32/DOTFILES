(defun user/cc-compile ()
  "Function to compile main file"
  (interactive)
  (cond
   ((file-exists-p "main.c") (funcall (lambda ()
					(if (and (file-directory-p "src") (file-directory-p "include"))
					    (shell-command "gcc main.c src/* -Iinclude -o main")
					  (shell-command "gcc main.c -o main")))))
   ((file-exists-p "main.cpp") (funcall (lambda ()
					(if (and (file-directory-p "src") (file-directory-p "include"))
					    (shell-command "gcc main.cpp src/* -Iinclude -o main")
					  (shell-command "gcc main.cpp -o main")))))
   (t (message "No file exists."))))

(defun user/cc-run ()
  "Function to run main"
  (interactive)
  (if (file-exists-p "main")
      (shell-command "./main")
    (message "No file exists.")))

(defun user/cc-run-with-input (input)
  "Function to run main"
  (interactive "sInput: ")
  (if (file-exists-p "main")
      (shell-command (format "echo %s | ./main" input))
    (message "No file exists.")))

(defun user/cc-run-with-args (args)
  "Function to run main"
  (interactive "sArguments: ")
  (if (file-exists-p "main")
      (shell-command (format "./main %s" args))
    (message "No file exists.")))
