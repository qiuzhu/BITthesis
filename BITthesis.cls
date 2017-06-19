%%
%% This is file `bitthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% bitthesis.dtx  (with options: `class')
%%
%% Copyright (C) 2016 by wweibit@163.com
%%
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3 of this license or (at your option) any later
%% version. The latest version of this license is in:
%%
%%    http://www.latex-project.org/lppl.txt
%%
%% and version 1.3 or later is part of all distributions of
%% LaTeX version 2005/12/01 or later.
%%
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{BITthesis}
    [2016/08/21 v0.0.2 bit Thesis Template]
\def\BITthesis{\textsc{BIT}\textsc{thesis}}
\newif\ifbit@master\bit@masterfalse
\newif\ifbit@doctor\bit@doctorfalse
\newif\ifbit@istwoside\bit@istwosidefalse
\DeclareOption{twoside}{\bit@istwosidetrue}
\DeclareOption{master}{\bit@mastertrue}
\DeclareOption{doctor}{\bit@doctortrue}
\DeclareOption*{\PackageWarning{BITthesis}{Unknown Option '\CurrentOption'}}
%% 将选项传递给 ctexbook 类
%% 用户至少要提供一个选项：指定论文类型。
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\ifbit@istwoside
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto]{ctexbook}
\fi

%%=========================================加载常用宏=========================================


%这几个宏包用于提升LATEX 2"的命令定义和命令处理性能
\RequirePackage{expl3}
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{calc}
\RequirePackage{ifxetex}
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\RequirePackage[shortlabels]{enumitem}
\setlist{noitemsep}
\RequirePackage{array}
\RequirePackage{fontspec}
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage[bottom,perpage,hang,symbol*]{footmisc}
\RequirePackage{subfigure}
\RequirePackage{float}
\RequirePackage{metalogo}

%==============删除默认模板（book.cls ）在章之间引入的垂直间隔。要放在hyperref 之前才会生效。===============
\patchcmd{\@chapter}{\addtocontents{lof}{\protect\addvspace{10\p@}}}{}{}{} % lof
\patchcmd{\@chapter}{\addtocontents{lot}{\protect\addvspace{10\p@}}}{}{}{} % lot
%%============================设置西文字体，中文字体由ctex 自动设置=============================
%%===========linux系统下需要下载和安装相应的宋体和ms字体=================
%\setCJKmainfont{SimSun}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
\providecommand{\cs}{\relax}
\renewcommand{\cs}[1]{\textbackslash#1}
%%=====================生成整数倍汉字宽度的空格，默认为1================================
\newcommand{\zhspace}[1][1]{\hspace{#1\ccwd}}
%%======================生成空的下划线，内部使用======================================
\def\bit@underline[#1]#2{%
	\CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\bitunderline{\@ifnextchar[\bit@underline\CTEXunderline}
%%=====================声明“作者姓名”等项目的命令======================================
\def\bit@define@term#1{
  \expandafter\gdef\csname #1\endcsname##1{
    \expandafter\gdef\csname bit@#1\endcsname{##1}
  }
  \csname #1\endcsname{}
}
\bit@define@term{zhtitle}                  % 中文论文标题
\bit@define@term{entitle}                  % 英文论文标题
\bit@define@term{zhdegree}                 % 中文申请学位类型
\bit@define@term{endegree}                 % 英文申请学位类型
\bit@define@term{zhauthor}                 % 作者中文姓名
\bit@define@term{enauthor}                 % 作者英文姓名
\bit@define@term{zhadvisor}                % 指导教师中文姓名
\bit@define@term{enadvisor}                % 指导教师英文姓名
\bit@define@term{zhchairman}               %中文答辩委员会主席
\bit@define@term{enchairman}                %英文答辩主席
\bit@define@term{zhacademy}                % 学院中文名
\bit@define@term{enacademy}                % 学院英文名
\bit@define@term{zhmajor}                  % 专业中文名
\bit@define@term{enmajor}                  % 专业英文名
\bit@define@term{zhschool}                 %学院授予单位（北京理工大学）
\bit@define@term{enschool}                 %英文同上
\bit@define@term{zhdate}                   % 中文答辩日期
\bit@define@term{endate}                   % 英文答辩日期
\bit@define@term{classified}               % 中文分类号
\bit@define@term{udc}                      % UDC编号
\bit@define@term{secret}                   % 密级
%%====================超链接与书签===========================
\RequirePackage{hyperref}
\definecolor{darkblue}{rgb}{0.0,0.0,0.3}
\definecolor{schrift}{RGB}{0,73,114}
\definecolor{blueRef}{RGB}{12,127,172}
\definecolor{navyblue}{RGB}{0,0,128}
\hypersetup{
	CJKbookmarks=true,
	bookmarksopen=true,
	bookmarksnumbered=true,
	bookmarksopenlevel=1,
	pdfborder= 0 0 0,
    pdfauthor = {\bit@zhauthor},
    pdftitle = {\bit@zhtitle},
	  unicode=true,
    backref=true,
	  linktoc=all,
	  colorlinks=true,
    citecolor=navyblue,
    filecolor=cyan,
    linkcolor=navyblue,
    linkbordercolor=navyblue,
    urlcolor=blue,
}
%%==============引用geometry 宏包设置纸张和页面========================
%\RequirePackage[top=35mm,headheight=10mm,footskip=7mm,bottom=25mm,left=27mm,right=27mm,paper=a4paper]{geometry} %设置版面:上3.5cm，下2.5cm，左2.7cm，右2.7cm，页眉2.5cm，页脚1.8cm，装订线0cm
\usepackage[%
paper=a4paper,%
top=3.5cm,% 上 3.5cm %
bottom=2.5cm,% 下 2.5cm %
left=2.7cm,% 左 2.7cm %
right=2.7cm,% 右 2.7cm %
headheight=1.0cm,% 页眉 2.5cm %
footskip=0.7cm% 页脚 1.8cm %
]{geometry} % 页面设置 %

%%=====================使用titlesec 宏包设置页眉页脚==========================
%\RequirePackage[pagestyles]{titlesec}

%%===================页眉标题宏============================
\ifbit@doctor
\newcommand{\bit@zh@thesis@name}{北京理工大学博士学位论文}
\else
\newcommand{\bit@zh@thesis@name}{北京理工大学硕士学位论文}
\fi
\newcommand{\bit@header@title}{\bit@zh@thesis@name}
%==================页眉字号=================
\newcommand{\bit@header@size}{\zihao{5}}
%================页眉页脚字体=============
\newcommand{\bit@header@font}{\songti}
%%=============引入facnyhdr宏设置页眉页脚====================
\RequirePackage{fancyhdr}
\fancypagestyle{bit@empty}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}
%======正文页眉页脚=================
\fancypagestyle{bit@headings}{%
  \fancyhf{}
  \fancyfoot[C]{\songti\zihao{5} ~{\thepage}~}
  \fancyhead[C]{\ifbit@master\zihao{5}\songti\bit@header@title
                \else\zihao{5}\songti\bit@header@title\fi}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0pt}}

%==================================对于openright 选项，必须保证章页右开，且如果前章末页内容须清空其页眉页脚。===================
\let\bit@cleardoublepage\cleardoublepage
\newcommand{\bit@clearemptydoublepage}{%
	\clearpage{\pagestyle{bit@empty}\bit@cleardoublepage}}
\let\cleardoublepage\bit@clearemptydoublepage
 %================修该frontmatter 的页码为大写罗马格式，并调整页面风格===============
\renewcommand{\frontmatter}{
 \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{bit@headings}
}
%=======================修改mainmatter 的页码为阿拉伯格式，并调整页面风格========================
\renewcommand{\mainmatter}{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{bit@headings}
}
%=================修改backmatter===============================================================
%\renewcommand\backmatter{%
  %\@mainmattertrue
   %\pagestyle{bit@headings}
   %}

%%===============================设置带圆圈的标准=============================================
\usepackage{tikz}
\usepackage{etoolbox}
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep = 1pt]
    (char) {\phantom{\ifblank{#1}{#2}{#1}}};%
    \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}
%%===================设置全文行距及段落行距==========================
%\setlength{\baselineskip}{22bp}
\RequirePackage{setspace}
\setstretch{1.523}
%%============================设置标题格式=================================================
\ctexset{chapter={
      name = {第,章},
      number = {\arabic{chapter}},
      format = {\bfseries \heiti \centering \zihao{3}},
      pagestyle = {bit@headings},
      beforeskip = 28bp,
      afterskip = 32bp,
      fixskip = true,
  }
}
 \ctexset{section={
	format={\raggedright \bfseries \heiti \zihao{4}},
	beforeskip = 28bp plus 1ex minus .2ex,
	afterskip = 24bp plus .2ex,
  fixskip = true,
	}
}
% ==========设置二节标题格式========================================
%黑体小四加粗顶左，单倍行距，序号与题目间空一个汉字符
\ctexset{subsection={
   format = {\bfseries \heiti \raggedright \zihao{-4}},
   beforeskip =28bp,
   afterskip = 24bp,
   fixskip = true,
	}
}
% 设置三节标题格式：黑体小四居左书写，单倍行距，序号与题目间空一个汉字符
\ctexset{subsubsection={
      format={\heiti \raggedright \zihao{-4}},
      beforeskip=28bp,
      afterskip=24bp,
      fixskip=true,
	}
}


%%==================添加目录索引====================
\newcommand{\bit@pdf@contentsname}{目录}
\let\bit@save@tableofcontents=\tableofcontents
\renewcommand{\tableofcontents}{
  \if@openright\cleardoublepage\else\clearpage\fi
  \pdfbookmark[0]{\bit@pdf@contentsname}{bittoc}
  \bit@save@tableofcontents
}
\renewcommand{\contentsname}{目录}
\RequirePackage{titletoc}
%==================定义目录相关设置===================
\titlecontents{chapter}[0pt]{\vspace{0.25\baselineskip} \songti \zihao{4}}
{\thecontentslabel\quad}{}
{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[2em]{\songti \zihao{-4}}
{\thecontentslabel\quad}{}
{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[4em]{\songti \zihao{-4}}
{\thecontentslabel\quad}{}
{\hspace{.5em}\titlerule*{.}\contentspage}

%\textit{\RequirePackage[titles,subfigure]{tocloft}
%\setlength{\cftbeforechapskip}{1mm}
%\cftsetindents{chapter}{0em}{1.5em}
%\cftsetindents{section}{1.5em}{2.2em}
%\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
%\renewcommand{\cftchapfont}{\zihao{4}\sffamily\heiti}
%\renewcommand{\cftsecfont}{\zihao{-4}\sffamily\heiti}
%\renewcommand{\cftsubsecfont}{\zihao{-4}}}

%===================================学位论文独创性声明================================
\newcommand{\bit@declare@text}{
  本人郑重声明：所提交的学位论文是我本人在指导教师的指导下进行的研究工作获得的研究成果。尽我所知，文中除特别标注和致谢的地方外，学位论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得北京理工大学或其它教育机构的学位或证书所使用过的材料。与我一同工作的合作者对此研究工作所做的任何贡献均已在学位论文中作了明确的说明并表示了谢意。\par 特此申明。
}
\newcommand{\bit@warranty@text}{
  本人完全了解北京理工大学有关保管、使用学位论文的规定，其中包括：\circled{1}学校有权保管、并向有关部门送交学位论文的原件与复印件；\circled{2}学校可以采用影印、缩印或其它复制手段复制并保存学位论文；\circled{3}学校可允许学位论文被查阅或借阅；\circled{4}学校可以学术交流为目的,复制赠送和交换学位论文；\circled{5}学校可以公布学位论文的全部或部分内容（保密学位论文在解密后遵守此规定）。
}
%===================原创性声明页面布局=========================
\newcommand{\bit@make@statement}{
\thispagestyle{empty}
\begin{titlepage}
  \pdfbookmark[0]{声明}{statement}
  \begin{center}
    \heiti\zihao{3}\textbf{研究成果声明}
  \end{center}
  \vskip .1cm
  \par\zihao{4}\bit@declare@text
  \begin{center}
  \vskip .1cm
  \hspace{4.5cm}签\qquad 名：\makebox[26.5mm]{} 日期：\makebox[3em]{}
  \end{center}
  \vskip 2cm
  \begin{center}
    \heiti\zihao{3}\textbf{关于学位论文使用权的说明}
  \end{center}
  \vskip .5cm
  \par\zihao{4}\bit@warranty@text
  \begin{center}
  \vskip .16cm
   \hspace{4.5cm}签\qquad 名：\makebox[26.5mm]{}日期：\makebox[26.5mm]{}
   \vskip .4cm
   \hspace{4.5cm}导师签名：\makebox[26.5mm]{}日期：\makebox[26.5mm]{}
  \end{center}
  \end{titlepage}
}

%%=====================重定义\maketitle，调用\bit@maketile 生成扉页===================

\newcommand{\makecover}{%
  \pdfbookmark[0]{封面}{titlepage}
  \bit@zh@titlepage
  \bit@en@titlepage
  \makeVerticalTitle
  \bit@make@statement
  \setcounter{page}{1}
  \frontmatter
}

%=============研究生中文扉页==========================
\newcommand{\bit@zh@titlepage}{
	\thispagestyle{empty}
	\begin{center}
		\vspace*{72mm}
		{\heiti\zihao{-2}\bit@zhtitle}
		\vskip 45mm
		{\heiti\zihao{-2}\bit@zhauthor}
		\vskip 8mm
		{\songti\zihao{4}\bit@zhdate}
	\end{center}
	\clearpage
	\newpage
	\cleardoublepage
   \thispagestyle{empty}

  {
  	{\heiti \zihao{5} \noindent 中文分类号:} \bit@classified \\
  	{\heiti \zihao{5} UDC分类号:}  \bit@udc
  }
    \begin{center}
    	\vskip \stretch{0.8}
    	{\heiti\zihao{-2}\bit@zhtitle}
    	\vskip \stretch{1}

    	{\fangsong\zihao{4}}
    	\def\tabcolsep{1pt}
    	\def\arraystretch{1.2}

    {\zihao{-3}\heiti
    \begin{tabular}{l p{1mm} c}
      {作\,者\,姓\,名：} & & \bit@underline[180pt]{\bit@zhauthor}    \\
      {学\, 院 \,名\,称：} & &\bit@underline[180pt]{\bit@zhacademy}      \\
      {指 \,导 \,教 \,师：} & & \bit@underline[180pt]{\bit@zhadvisor}   \\
      {答辩委员会主席：} & & \bit@underline[180pt]{\bit@zhchairman}   \\
      {申\, 请 \,学 \,位:} & & \bit@underline[180pt]{\bit@zhdegree}   \\
      {学\,科\,专\,业 ：} & & \bit@underline[180pt]{\bit@zhmajor }  \\
      {学位授予单位 ：} & & \bit@underline[180pt]\bit@zhschool    \\
      {论文答辩日期：} & & \bit@underline[180pt]{\bit@zhdate}      \\
    \end{tabular}}
  \end{center}
  \vskip \stretch{0.5}
  \clearpage
}

%==================研究生英文扉页===========================
\newcommand{\bit@en@titlepage}{
	\cleardoublepage
  \begin{titlepage}
    \vspace*{1cm}
    \centering
    \vskip .5cm
    \zihao{-2}\bit@entitle
    \vskip 5cm
    \zihao{-3}
    \begin{tabular}{lc}
     {Candidate Name：}                & \bit@underline[180pt]{\bit@enauthor}    \\
     {School or Department:}           &  \bit@underline[180pt]{\bit@enacademy}      \\
     {Faculty Mentor:}                 & \bit@underline[180pt]{\bit@enadvisor}    \\
    {Chair, Thesis Committee：}        & \bit@underline[180pt]{\bit@enchairman}    \\
     {Degree Applied:  }               & \bit@underline[180pt]\bit@endegree    \\
     {Major：}                         & \bit@underline[180pt]{\bit@enmajor }  \\
     {Degree by:}      				         & \bit@underline[180pt]{\bit@enschool}    \\
    {The Date of Defence：}            & \bit@underline[150pt]{\bit@endate }      \\
    \end{tabular}

  \end{titlepage}
  \cleardoublepage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 书脊：
% |学位论文的书脊用黑体三号，上方写论文题目，下方写“北京理工大学”，
% |论文题目与“北京理工大学”间距2cm；
% |论文题目距上边界、“北京理工大学”距下边界均为5cm。 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeVerticalTitle}{
	\cleardoublepage
	\thispagestyle{empty}
	\vspace*{10mm}
	\begin{center}
				\setstretch{1.1}
        \heiti \zihao{3}
				\begin{minipage}{1em}
				      {\heiti \zihao{3} \bit@zhtitle}
					     \vskip 28mm
               \vfill
				      {\heiti \zihao{3} \bit@zhschool}
				\end{minipage}
	\end{center}
	\clearpage
	\if@twoside
	\thispagestyle{empty}
	\cleardoublepage
	\fi
}
%====================== 摘要==============================================================
\newenvironment{zhabstract}{
    \chapter[摘要]{摘要}
  }{}
  \newenvironment{enabstract}{
    \chapter[Abstract]{Abstract}
   % \fontsize{12bp}{20bp}\selectfont
  % \setstretch{1.39}
  \linespread{1.39}\selectfont
  }{}


 \newcommand{\zhkeywords}[1]{%
   \vspace{2ex}\noindent{\heiti \zihao{5} 关键词：} {\zihao{5}#1}}


  \newcommand{\enkeywords}[2][]{
    \par\phantom{keywords}\par\noindent
    {
      #1\textbf{KEY WORDS: }#2
    }
  }
%%===========================设置图表标题选项==========================
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\zihao{5}}
\captionsetup{
  font = {fontsize},
  labelfont={color=navyblue},
  labelsep = zhspace,
}
\captionsetup[table]{
  position = top,
  aboveskip = 6bp,
  belowskip = 6bp,
}
\numberwithin{table}{chapter}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\captionsetup[figure]{
  position = bottom,
  aboveskip = 6bp,
  belowskip = 6bp,
}
\graphicspath{{./}{figures/}}
\numberwithin{figure}{chapter}
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
%===========让浮动对象缺省值更宽松=================
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

%===========================================参考文献======================================

\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}

\pretocmd{\bibliography}{%
\clearpage\phantomsection\addcontentsline{toc}{chapter}{\bit@bib@name}}{}{}
%==参考文献使用五号字，同时优化参考文献占用的空间
\AtBeginDocument{%
	\pretocmd{\bibliography}{\begingroup\zihao{5}}{}{}
	\apptocmd{\bibliography}{\endgroup}{}{}
	}%AtBeginDocument
 \renewcommand\@biblabel[1]{\zihao{5}[#1]}
\renewenvironment{thebibliography}[1]
{\chapter*{\bit@bib@name
	 \@mkboth{\bit@bib@name}{}}%
	 \list{\@biblabel{\@arabic\c@enumiv}}%
{\settowidth\labelwidth{\@biblabel{#1}}%
 \leftmargin\labelwidth
\advance\leftmargin\labelsep
 \setlength{\parsep}{1mm}
\setlength{\labelsep}{0.5em}
 \setlength{\itemsep}{0.05pc}
 \setlength{\listparindent}{0in}
\setlength{\itemindent}{0in}
\setlength{\rightmargin}{0in}
\@openbib@code
\usecounter{enumiv}%
\let\p@enumiv\@empty
\renewcommand\theenumiv{\@arabic\c@enumiv}}%
 \sloppy
 \clubpenalty4000
 \@clubpenalty\clubpenalty
\widowpenalty4000%
\sfcode`\.\@m
 }{%
\def\@noitemerr
 {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist \vskip.2in}
%%======================各种自定义标签=======================
\def\bit@label@summary{结论}
\def\bit@label@publications{攻读学位期间发表的论文与研究成果清单}
\def\bit@bib@name{参考文献}
\def\bit@label@thanks{致谢}
%==========自定义环境定义=============================
%%===================================================%%
%\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}
%==============论文成果发表页==================================
\newenvironment{publications}[1]
     {\chapter{\bit@label@publications}%
      \@mkboth{\MakeUppercase\bit@label@publications}
              {\MakeUppercase\bit@label@publications}%
         \zihao{5}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}
%===================致谢=========================
\renewenvironment{thanks}
  {\chapter{\bit@label@thanks}\label{last}
  \fangsong
  }
  {}
%===============总结====================================
\newenvironment{summary}
{\chapter*{\bit@label@summary\markboth{\bit@label@summary}{}}\addcontentsline{toc}{chapter}{\bit@label@summary}
}{}
%%%============================术语=====================
\newcommand{\bit@denotation@name}{主要符号对照表}
\newenvironment{denotation}[1][2.5cm]{
    \chapter{\bit@denotation@name} % no tocline
    \noindent\begin{list}{}%
    {\vskip-30bp\zihao{-4}
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1} % 标签盒子宽度
     \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
     \setlength{\itemindent}{0cm} % 标签缩进量
     \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm} % 段落间距
     \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0cm} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
   }}{\end{list}}
%%=========================载入其他常用宏包=========================================
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{tabularx}
\RequirePackage[version=4]{mhchem}
\RequirePackage{siunitx}
\RequirePackage{mathtools}
\newtagform{blue}{\color{navyblue}(}{)}
\usetagform{blue}
%\bibliographystyle{GBT7714-2005NLang}
\endinput
%%
%% End of file `bitthesis.cls'.
