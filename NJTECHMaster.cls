% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{NJTECHMaster}[2016/04/15 4.1 Wuhan University Thesis Template for Master Candidate]

\newif\iflib\libfalse
\DeclareOption{forlib}{\libtrue}
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\newif\ifsmd\smdfalse
\DeclareOption{smd}{\smdtrue}
\newif\ifentitle\entitlefalse
\DeclareOption{entitle}{\entitletrue}
\ProcessOptions

%% 引用ctexbook: 小4,1.5倍行距
%\LoadClass[UTF8,zihao=-4,linespread=1.7]{ctexbook}%1.5+0.2行间距

 \iflib
 \LoadClass[UTF8,zihao=-4,linespread=1.7,a4paper,twoside,openany]{ctexbook}
 \else
 \LoadClass[UTF8,zihao=-4,linespread=1.7,a4paper,twoside]{ctexbook}
 \fi

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
%------------------------ Page layout ----------------------------------
\RequirePackage{fancyhdr,hyperref}
\hypersetup{pdfencoding=auto}  %%% 邓东升修改
\hypersetup{citecolor=magenta,linkcolor=blue}
\RequirePackage[top=2.54truecm,bottom=2.54truecm,left=3.18truecm,right=3.18truecm,
            %includehead,%includefoot,
           xetex]{geometry}    % 页面设置%

\newtoks\fenleihao      %中图分类号
\newtoks\bianhao         %学校编号
\newtoks\UDC             %《国际十进制分类法UDC》的类号
\newtoks\miji            %密级
\newtoks\Cmajor          %学科专业中文名
\newtoks\Cspeciality      %二级学科名称（专硕为工程硕士）
\newtoks\Edate           %英文日期
\newtoks\Etitle          %英文题目
\newtoks\spine         %侧边书脊栏
\newtoks\Eauthor         %作者英文名
\newtoks\Esupervisor     %指导教师英文名
\newtoks\Csupervisor     %指导教师中文名

%===============================================页眉设置=====================================================%
\renewcommand{\headrulewidth}{0.5pt}    %在页眉下画一个0.5pt宽的分隔线
\renewcommand{\footrulewidth}{0pt}      % 在页脚不画分隔线。

\let\ps@oldplain\ps@plain

\fancyhf{}  %清除以前对页眉页脚的设置
\fancyhead[CE]{\zihao{5}\kaishu \leftmark}   %偶数页页眉居中位置的设置. 不填则为空.
\fancyhead[CO]{\zihao{5}\kaishu 硕士学位论文}    %L,C,R 是左中右; O,E 是奇偶. 可以自己组合调整.
 \fancyfoot[C]{-\,\thepage\,-}                     %页面下侧的设置. 大括号内置空, 表示什么也不填. 反之, 没有此命令的话, 会在页脚出现页码
 
 \fancypagestyle{onlytitle}{%可弃用
\fancyhf{}  %清除以前对页眉页脚的设置
\fancyhead[CE]{\zihao{5}\kaishu \leftmark}   %偶数页页眉居中位置的设置. 不填则为空.
\fancyhead[CO]{\zihao{5}\kaishu \leftmark}    %L,C,R 是左中右; O,E 是奇偶. 可以自己组合调整.
\fancyfoot[C]{-\,\thepage\,-}                     %页面下侧的设置. 大括号内置空, 表示什么也不填. 反之, 没有此命令的话, 会在页脚出现页码
 }

 \fancypagestyle{toc}{%目录的页眉单独处理以解决sb学校目录字号和其他一级标题不一致的问题
	\fancyhf{}  %清除以前对页眉页脚的设置
	\fancyhead[CE]{\zihao{5}\kaishu 目{\quad}录}   %偶数页页眉居中位置的设置. 不填则为空.
	\fancyhead[CO]{\zihao{5}\kaishu 硕士学位论文}    %L,C,R 是左中右; O,E 是奇偶. 可以自己组合调整.
	\fancyfoot[C]{-\,\thepage\,-}                     %页面下侧的设置. 大括号内置空, 表示什么也不填. 反之, 没有此命令的话, 会在页脚出现页码
}
 
 \newcommand{\fancyfancy}{\fancypagestyle{plain}{%
  \fancyhf{}
   \fancyhead[CE]{\zihao{5}\kaishu \leftmark }  %偶数页页眉居中位置的设置. 不填则为空.
 \fancyhead[CO]{\zihao{5}\kaishu 硕士学位论文}    %L,C,R 是左中右; O,E 是奇偶. 可以自己组合调整.
 \fancyfoot[C]{-\,\thepage\,-} }} 


%%%=== 封面 ===%%%
\newgeometry{top=3truecm,bottom=2.9truecm,left=2.8truecm,right=2.5truecm,xetex}%单独设置页边距保证边注位置
\def\maketitle{%
  \null
  \thispagestyle{empty}%
  \vspace*{-2cm}
  \begin{center}\leavevmode
    {\songti \zihao{5}%
    \begin{tabular}{lp{3cm}p{5cm}lp{3cm}l}
      \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{分\hfill 类\hfill 号}} & {}\hfill\raisebox{-0.5ex}[0pt]{\the\fenleihao}\hfill{} &  &
      \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{密\hfill 级}} & {}\hfill\raisebox{-0.5ex}[0pt]{\the\miji}\hfill{} & \\ \cline{2-2}\cline{5-5}
      \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{U\hfill D\hfill C} } & {}\hfill\raisebox{-0.5ex}[0pt]{\the\UDC}\hfill{}      &  &
      \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{编\hfill 号}} & {}\hfill\raisebox{-0.5ex}[0pt]{\the\bianhao}\hfill{}   & \\ \cline{2-2}\cline{5-5}
    \end{tabular}
    }
    \par
    \vspace*{15mm} %插入空白
    {\songti \zihao{2} % 学校logo
    \includegraphics[width=0.6\textwidth]{NJTech-Text-BW.eps}
   %****大学
    %\marginpar[\hfill \parbox{1em}{ \kaishu \zihao{-4} \the\spine}]{} \reversemarginpar
    \vspace{1cm}
    \\[3mm]   \ifsmd  \heiti \zihao{1} 专业学位硕士论文\else \heiti \zihao{1} 硕士学位论文\fi}\\
    \vspace{1cm}
    {\heiti \zihao{-2}  \@title \par}\reversemarginpar \marginpar[\hfill \parbox{1em}{ \kaishu \zihao{-4}
    	\ifentitle
    	\the\spine
    	\else
    	\@title
    	\fi
    }]{}
    %\vspace{1cm}
     \vfill
     \marginpar[\hfill \parbox{1em}{\kaishu \zihao{-4} 南京工业大学}]{}
     %\marginpar[\hfill \parbox{1em}{\kaishu *\quad*\quad*\quad*大学\zihao{-4}}]{}
    {\heiti\zihao{4}
    \ifsmd 
    \begin{tabular}{cp{3cm}c}
      \raisebox{-3ex}[0pt]{\makebox[3cm][s]{研\hfill 究\hfill 生\hfill 姓\hfill 名: }} & {\heiti {}\raisebox{-3ex}[0pt]{\@author}\hfill{}} & \\[3ex]
      \raisebox{-3ex}[0pt]{\makebox[3cm][s]{导\hfill 师\hfill 姓\hfill 名: }} & {\heiti
      {}\raisebox{-3ex}[0pt]{\the\Csupervisor}\hfill{}} & \\[3ex] % \cline{2-2}
  	  \raisebox{-3ex}[0pt]{\makebox[3cm][s]{申\hfill 请\hfill 学\hfill 位\hfill  级\hfill  别: }} & {\heiti {}\raisebox{-3ex}[0pt]{专业学位硕士}\hfill{}}  & \\[3ex]
  	  \raisebox{-3ex}[0pt]{\makebox[3cm][s]{专\hfill 业\hfill 学\hfill 位\hfill 类\hfill  别: }} & {\heiti {}\raisebox{-3ex}[0pt]{\the\Cspeciality}\hfill{}}  & \\[3ex]
      \raisebox{-3ex}[0pt]{\makebox[3cm][s]{领\hfill 域\hfill 名\hfill 称: }} & {\heiti {}\raisebox{-3ex}[0pt]{\the\Cmajor}\hfill{}} &
      \\[3ex]
     \end{tabular}    
    \else  
    \begin{tabular}{cp{3cm}c}
      \raisebox{-3ex}[0pt]{\makebox[3cm][s]{研\hfill 究\hfill 生\hfill 姓\hfill 名: }} & {\heiti {}\raisebox{-3ex}[0pt]{\@author}\hfill{}} & \\[3ex]
      \raisebox{-3ex}[0pt]{\makebox[3cm][s]{导\hfill 师\hfill 姓\hfill 名: }} & {\heiti
      	{}\raisebox{-3ex}[0pt]{\the\Csupervisor}\hfill{}} & \\[3ex] % \cline{2-2}
      \raisebox{-3ex}[0pt]{\makebox[3cm][s]{申\hfill 请\hfill 学\hfill 位\hfill  级\hfill  别: }} & {\heiti {}\raisebox{-3ex}[0pt]{专业学位硕士}\hfill{}}  & \\[3ex]
      \raisebox{-3ex}[0pt]{\makebox[3cm][s]{一\hfill 级\hfill 学\hfill 科\hfill 名\hfill  称: }} & {\heiti {}\raisebox{-3ex}[0pt]{\the\Cmajor}\hfill{}}  & \\[3ex]
      \raisebox{-3ex}[0pt]{\makebox[3cm][s]{二\hfill 级\hfill 学\hfill 科\hfill 名\hfill  称:  }} & {\heiti {}\raisebox{-3ex}[0pt]{\the\Cspeciality}\hfill{}} &
      \\[3ex]
     \end{tabular}
     \fi
    }
    \par
    \vspace{25mm}
    {
      {\songti \zihao{-4}  \@date \par}%
    }
  \end{center}%
  \null
\newgeometry{top=2.54truecm,bottom=2.54truecm,left=3.18truecm,right=3.18truecm,xetex}%正文页边距
  \iflib
  \else
  \newpage
  \thispagestyle{empty}
  \cleardoublepage
  \fi
  }


%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{摘{\quad}要}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{ {\noindent \textbf{\songti\zihao{5} \cnkeywordsname \qquad}}#1}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{ {\noindent \bfseries\zihao{-4}\enkeywordsname{\quad}}#1}
\newcommand\enkeywordsname{KEYWORDS}

\newenvironment{cnabstract}{
    \newpage
    
    \chapter[\cnabstractname]{\songti\zihao{-3}{\cnabstractname}}   %%%终于解决了书签乱码的问题 2005-04-12.huangzh
    \songti\zihao{-4}
    \@afterheading}
    {\par}

\newenvironment{enabstract}{
    \newpage
    \chapter[\enabstractname]{\zihao{4}{\enabstractname}}
    \songti\zihao{-4}
    \@afterheading}
    {\par}
%%------------------------常用宏包-----------------------------------
\RequirePackage{amsmath,amssymb}% AMSLaTeX宏包.
\RequirePackage[amsmath,thmmarks]{ntheorem}
\RequirePackage{graphicx}                 % 图形
\RequirePackage{color,xcolor}             %支持彩色
\RequirePackage{cite} % 参考文献引用, 得到形如 [3-7] 的样式.
\RequirePackage{url}
\RequirePackage{enumerate}
\RequirePackage{marginnote}%边注，为得到封面的竖排封面使用
\RequirePackage{txfonts}
\RequirePackage{bm}%times new roman字体包
\RequirePackage{titletoc}
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage{algpseudocode}
\RequirePackage{verbatim}
\RequirePackage{multirow}
\RequirePackage{subfigure}
\RequirePackage{float}
\RequirePackage{setspace}
%\RequirePackage{ccmap}
%\RequirePackage{amsmath}
%\RequirePackage{gbt7714}
%\RequirePackage{indentfirst}



%%----------------------- Theorems -----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent0em
%\theorempreskip{0pt}
%\theorempostskip{0pt}
%\theoremseparator{\hspace{1em}}
\theoremnumbering{arabic}
%\theoremsymbol{} %定理结束时自动添加的标志
\renewcommand{\theequation}{\thechapter-\arabic{equation}} % set caption label style to 1-1
\newtheorem{theorem}{\hspace{2em}定理}[section]
\newtheorem{definition}{\hspace{2em}定义}[section]
\newtheorem{lemma}{\hspace{2em}引理}[section]
\newtheorem{corollary}{\hspace{2em}推论}[section]
\newtheorem{proposition}{\hspace{2em}性质}[section]
\newtheorem{example}{\hspace{2em}例}[section]
\newtheorem{remark}{\hspace{2em}注}[section]

\theoremstyle{nonumberplain}
\theoremheaderfont{\heiti}
\theorembodyfont{\normalfont \rm \songti}
\theoremindent0em \theoremseparator{\hspace{1em}}
\theoremsymbol{$\square$}
\newtheorem{proof}{\hspace{2em}证明}
\renewcommand{\algorithmicensure}{\textbf{Output:}}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\ALG@name}{算法}
\counterwithin{algorithm}{chapter}
\renewcommand{\thealgorithm}{\thechapter-\arabic{algorithm}}


%%%---  Publications -------------------------------
\newenvironment{publications}[1]
  {\renewcommand\bibname{}\begin{thebibliography}{#1}}
  {\end{thebibliography}}

%%%--- \upcite ----------------------------------------
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}  %自定义新命令\upcite, 使文献引用以上标出现


%%%--- 允许算法跨页 ----------------------------------------
% -------------------------允许算法跨页-------------
\makeatletter
\newenvironment{breakablealgorithm}
{% \begin{breakablealgorithm}
		\vspace*{5mm} %插入空白
		\begin{center}
			\refstepcounter{algorithm}% New algorithm
			\hrule height.8pt depth0pt \kern2pt% \@fs@pre for \@fs@ruled
			\renewcommand{\caption}[2][\relax]{% Make a new \caption
				{\raggedright\textbf{\ALG@name~\thealgorithm} ##2\par}%
				\ifx\relax##1\relax % #1 is \relax
				\addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##2}%
				\else % #1 is not \relax
				\addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##1}%
				\fi
				\kern2pt\hrule\kern2pt
			}
		}{% \end{breakablealgorithm}
		\kern2pt\hrule\relax% \@fs@post for \@fs@ruled
	\end{center}
\vspace*{8mm} %插入空白
}
\makeatother


%目录格式设置
%\chapter[\cnabstractname]{\zihao{-3}{\cnabstractname}
\titlecontents{chapter}[5em]{\heiti \zihao{4}}{\contentslabel{4em}}{\hspace*{-4em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}

\titlecontents{section}[3.5em]{\songti \zihao{4}}{\contentslabel{2em}}{\hspace*{-4em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}

\titlecontents{subsection}[5.2em]{\songti \zihao{4}}{\contentslabel{2.5em}}{\hspace*{-4em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}

%%%%%%%--判断是否需要彩色链接-----------------------------
  \iflib
 % \hypersetup{allcolors=black}
   \hypersetup{
  	colorlinks=true,
  	allcolors=black
  }
  \else
  \fi
%%%%%%%-------------------------------------------------
%%%%%%%--判断是否需要彩色链接-----------------------------
  \ifprint
 % \hypersetup{allcolors=black}
 \hypersetup{
 	colorlinks=true,
 	allcolors=black
 }
  \else
  \fi
%%%%%%%-------------------------------------------------
%%%===  suppress extra inter-line spacing in \list environments
\makeatletter \setlength\partopsep{0pt}
\def\@listI{\leftmargin\leftmargini
            \parsep 0pt
            \topsep \parsep
            \itemsep \parsep}
\@listI
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listiv{\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listv{\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listvi{\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
%
% Change default margins for \list environments
\setlength\leftmargini   {2\ccwd} \setlength\leftmarginii
{\leftmargini} \setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini} \setlength\leftmarginv
{\ccwd} \setlength\leftmarginvi  {\ccwd} \setlength\leftmargin
{\leftmargini} \setlength\labelsep      {.5\ccwd}
\setlength\labelwidth    {\leftmargini}
%
\setlength\listparindent{2\ccwd}
% Change \listparindent to 2\ccwd in \list
\def\list#1#2{\ifnum \@listdepth >5\relax \@toodeep
     \else \global\advance\@listdepth\@ne \fi
  \rightmargin \z@ \listparindent2\ccwd \itemindent \z@
  \csname @list\romannumeral\the\@listdepth\endcsname
  \def\@itemlabel{#1}\let\makelabel\@mklab \@nmbrlistfalse #2\relax
  \@trivlist
  \parskip\parsep \parindent\listparindent
  \advance\linewidth -\rightmargin \advance\linewidth -\leftmargin
  \advance\@totalleftmargin \leftmargin
  \parshape \@ne \@totalleftmargin \linewidth
  \ignorespaces}

\makeatother
%---------------------------------------------------
\renewcommand{\contentsname}{\zihao{-3}目\quad 录}
\newcommand\acknowledgement{\backmatter\chapter[致谢]{\ziju{2}致谢}}
\newcommand\project{\backmatter\chapter[攻读硕士学位期间参加的科研项目]{攻读硕士学位期间参加的科研项目}}
\newcommand\achievement{\backmatter\chapter[攻读硕士学位期间完成的学术成果]{攻读硕士学位期间完成的学术成果}}
\newcommand\awards{\backmatter\chapter[攻读硕士学位期间获得的奖项]{攻读硕士学位期间获得的奖项}}
 
%%% ---- 章节标题设置 ----- %%%%
\CTEXsetup[nameformat={\songti\zihao{3}\bfseries\raggedright\textbf},titleformat={\songti\zihao{3}\bfseries\centering},%
                 number={\arabic{chapter}},name={第,章},beforeskip={-5ex},afterskip={1.0ex}]{chapter}
\CTEXsetup[format+={\songti\zihao{4}\raggedright},beforeskip={1.0ex},afterskip={1.0ex}]{section}
\CTEXsetup[format={},nameformat={\songti\zihao{-4}\songti\raggedright},titleformat={\zihao{-4}\songti\raggedright},beforeskip={1.0ex},afterskip={1.0ex}]{subsection}
%\CTEXsetup[format+={\zihao{-4}\songti\raggedright}]{subsection}
\CTEXsetup[format={\songti\zihao{-4}\kaishu\raggedright}]{subsubsection}
\CTEXoptions[bibname={参考文献}]
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{4}
\RequirePackage[font=small,textfont=rm]{caption}
\captionsetup[table]{labelsep=space}
\captionsetup[figure]{labelsep=space}
\renewcommand{\thetable}{\thechapter-\arabic{table}} % set caption label style to 1-1
\renewcommand{\thefigure}{\thechapter-\arabic{figure}} % set caption label style to 1-1
\setlength{\abovecaptionskip}{0cm} 
\setlength{\belowcaptionskip}{0cm}

\setlength\abovedisplayskip{100pt}
\setlength\belowdisplayskip{100pt}

\makeatletter
\def\cleardoublepage{\clearpage
	\if@twoside % 双面打印
	\ifodd\c@page % 不存在 \ifeven 命令；\c@page 是页码
	\else
	\hbox{}\thispagestyle{empty}\newpage % 此行是唯一改动的地方
	\if@twocolumn % 两列
	\hbox{}\newpage
	\fi
	\fi
	\fi}
\makeatother

%%%=== 图片路径=== %%%
\graphicspath{{figures/}}        % 图片放在 figures 文件夹.

\allowdisplaybreaks
\endlinechar `\^^M
\endinput
