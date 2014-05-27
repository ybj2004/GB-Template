del *.aux /s
del *.bak /s
del *.log /s
del *.bbl /s
del *.blg /s
del *.thm /s
del *.toc /s
del *.out /s
del *.lot /s
del *.lof /s
del *.ind /s
del *.ilg /s
del *.idx /s
del *.xdy /s
del *.ist /s

xelatex --shell-escape GB-template
bibtex GB-template
xelatex --shell-escape GB-template
xelatex --shell-escape GB-template

del *.aux /s
del *.bak /s
del *.log /s
del *.bbl /s
del *.blg /s
del *.thm /s
del *.toc /s
del *.out /s
del *.lot /s
del *.lof /s
del *.ind /s
del *.ilg /s
del *.idx /s
del *.xdy /s
del *.ist /s


start GB-template.pdf