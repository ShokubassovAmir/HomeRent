ace.define("ace/snippets/tex",["require","exports","module"],function(e,t,n){"use strict";t.snippetText="#PREAMBLE\n#newcommand\nsnippet nc\n	\\newcommand{\\${1:cmd}}[${2:opt}]{${3:realcmd}}${4}\n#usepackage\nsnippet up\n	\\usepackage[${1:[options}]{${2:package}}\n#newunicodechar\nsnippet nuc\n	\\newunicodechar{${1}}{${2:\\ensuremath}${3:tex-substitute}}}\n#DeclareMathOperator\nsnippet dmo\n	\\DeclareMathOperator{${1}}{${2}}\n\n#DOCUMENT\n# \\begin{}...\\end{}\nsnippet begin\n	\\begin{${1:env}}\n		${2}\n	\\end{$1}\n# Tabular\nsnippet tab\n	\\begin{${1:tabular}}{${2:c}}\n	${3}\n	\\end{$1}\nsnippet thm\n	\\begin[${1:author}]{${2:thm}}\n	${3}\n	\\end{$1}\nsnippet center\n	\\begin{center}\n		${1}\n	\\end{center}\n# Align(ed)\nsnippet ali\n	\\begin{align${1:ed}}\n		${2}\n	\\end{align$1}\n# Gather(ed)\nsnippet gat\n	\\begin{gather${1:ed}}\n		${2}\n	\\end{gather$1}\n# Equation\nsnippet eq\n	\\begin{equation}\n		${1}\n	\\end{equation}\n# Equation\nsnippet eq*\n	\\begin{equation*}\n		${1}\n	\\end{equation*}\n# Unnumbered Equation\nsnippet \\\n	\\[\n		${1}\n	\\]\n# Enumerate\nsnippet enum\n	\\begin{enumerate}\n		\\item ${1}\n	\\end{enumerate}\n# Itemize\nsnippet itemize\n	\\begin{itemize}\n		\\item ${1}\n	\\end{itemize}\n# Description\nsnippet desc\n	\\begin{description}\n		\\item[${1}] ${2}\n	\\end{description}\n# Matrix\nsnippet mat\n	\\begin{${1:p/b/v/V/B/small}matrix}\n		${2}\n	\\end{$1matrix}\n# Cases\nsnippet cas\n	\\begin{cases}\n		${1:equation}, &\\text{ if }${2:case}\\\\\n		${3}\n	\\end{cases}\n# Split\nsnippet spl\n	\\begin{split}\n		${1}\n	\\end{split}\n# Part\nsnippet part\n	\\part{${1:part name}} % (fold)\n	\\label{prt:${2:$1}}\n	${3}\n	% part $2 (end)\n# Chapter\nsnippet cha\n	\\chapter{${1:chapter name}}\n	\\label{cha:${2:$1}}\n	${3}\n# Section\nsnippet sec\n	\\section{${1:section name}}\n	\\label{sec:${2:$1}}\n	${3}\n# Sub Section\nsnippet sub\n	\\subsection{${1:subsection name}}\n	\\label{sub:${2:$1}}\n	${3}\n# Sub Sub Section\nsnippet subs\n	\\subsubsection{${1:subsubsection name}}\n	\\label{ssub:${2:$1}}\n	${3}\n# Paragraph\nsnippet par\n	\\paragraph{${1:paragraph name}}\n	\\label{par:${2:$1}}\n	${3}\n# Sub Paragraph\nsnippet subp\n	\\subparagraph{${1:subparagraph name}}\n	\\label{subp:${2:$1}}\n	${3}\n#References\nsnippet itd\n	\\item[${1:description}] ${2:item}\nsnippet figure\n	${1:Figure}~\\ref{${2:fig:}}${3}\nsnippet table\n	${1:Table}~\\ref{${2:tab:}}${3}\nsnippet listing\n	${1:Listing}~\\ref{${2:list}}${3}\nsnippet section\n	${1:Section}~\\ref{${2:sec:}}${3}\nsnippet page\n	${1:page}~\\pageref{${2}}${3}\nsnippet index\n	\\index{${1:index}}${2}\n#Citations\nsnippet cite\n	\\cite[${1}]{${2}}${3}\nsnippet fcite\n	\\footcite[${1}]{${2}}${3}\n#Formating text: italic, bold, underline, small capital, emphase ..\nsnippet it\n	\\textit{${1:text}}\nsnippet bf\n	\\textbf{${1:text}}\nsnippet under\n	\\underline{${1:text}}\nsnippet emp\n	\\emph{${1:text}}\nsnippet sc\n	\\textsc{${1:text}}\n#Choosing font\nsnippet sf\n	\\textsf{${1:text}}\nsnippet rm\n	\\textrm{${1:text}}\nsnippet tt\n	\\texttt{${1:text}}\n#misc\nsnippet ft\n	\\footnote{${1:text}}\nsnippet fig\n	\\begin{figure}\n	\\begin{center}\n	    \\includegraphics[scale=${1}]{Figures/${2}}\n	\\end{center}\n	\\caption{${3}}\n	\\label{fig:${4}}\n	\\end{figure}\nsnippet tikz\n	\\begin{figure}\n	\\begin{center}\n	\\begin{tikzpicture}[scale=${1:1}]\n		${2}\n	\\end{tikzpicture}\n	\\end{center}\n	\\caption{${3}}\n	\\label{fig:${4}}\n	\\end{figure}\n#math\nsnippet stackrel\n	\\stackrel{${1:above}}{${2:below}} ${3}\nsnippet frac\n	\\frac{${1:num}}{${2:denom}}\nsnippet sum\n	\\sum^{${1:n}}_{${2:i=1}}{${3}}",t.scope="tex"});                (function() {
                    ace.require(["ace/snippets/tex"], function(m) {
                        if (typeof module == "object" && typeof exports == "object" && module) {
                            module.exports = m;
                        }
                    });
                })();
            