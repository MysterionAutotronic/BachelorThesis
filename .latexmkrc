$ENV{'PATH'} = "$ENV{HOME}/.venvs/latex/bin:$ENV{PATH}";
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %O %S';
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %O %S';
$xelatex  = 'xelatex  -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %O %S';