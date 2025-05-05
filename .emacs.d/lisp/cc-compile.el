(defun user/c-compile ()
  "Function to compile main.c. Not meant to be run anywhere else"
  (interactive)
  (if (and (file-directory-p "src") (file-directory-p "include"))
      (shell-command "gcc main.c src/* -Iinclude. -o main")
    (shell-command "gcc main.c -o main")))

(defun user/c++-compile ()
  "Function to compile main.cpp. Not meant to be run anywhere else"
  (interactive)
  (if (and (file-directory-p "src") (file-directory-p "include"))
      (shell-command "gcc main.cpp src/* -Iinclude. -o main")
    (shell-command "gcc main.cpp -o main")))

(defun user/c-compile-and-run ()
  "Function to compile and run main.c. Not meant to be run anywhere else"
  (interactive)
  (if (and (file-directory-p "src") (file-directory-p "include"))
      (shell-command "gcc main.c src/* -Iinclude. -o main && ./main")
    (shell-command "gcc main.c -o main && ./main")))

(defun user/c++-compile-and-run ()
  "Function to compile and run main.cpp. Not meant to be run anywhere else"
  (interactive)
  (if (and (file-directory-p "src") (file-directory-p "include"))
      (shell-command "gcc main.cpp src/* -Iinclude. -o main && ./main")
    (shell-command "gcc main.cpp -o main && ./main")))
