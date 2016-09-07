%%
%% This is file `bitthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% bitthesis.dtx  (with options: `class')
%%
%% Copyright (C) 2016 by japinli <japinli@hotmail.com>
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
\RequirePackage{kvoptions}
%%=======声明选项：bit@opt 用于设置论文类型及打印方式===========================
\SetupKeyvalOptions{family=bit@opt,prefix=bit@opt@,setkeys=\kvsetkeys}
%\DeclareBoolOption[false]{bachelor}
\DeclareBoolOption[false]{master}
\DeclareBoolOption[false]{doctor}
\DeclareBoolOption[false]{pdf}
\DeclareComplementaryOption{print}{pdf}
%%============bit@page 用于设置文档分页样式====================================
\SetupKeyvalOptions{family=bit@pae,prefix=bit@page@,setkeys=\kvsetkeys}
\DeclareBoolOption[false]{oneside}
\DeclareComplementaryOption{twoside}{oneside}
\DeclareBoolOption[false]{openany}
\DeclareComplementaryOption{openright}{openany}
%\DeclareBoolOption[true]{pageouter}
%\DeclareComplementaryOption{pagecenter}{pageouter}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}

%%===================处理bit@opt 选项，判断论文类型，若没指定默认使用硕士研究生论文模板
\ProcessKeyvalOptions{bit@opt}
  \ifbit@opt@doctor\relax\else
    \bit@opt@mastertrue
  \fi
%================================

%\ifbit@opt@pdf
    %\bit@page@onesidetrue
   % \bit@page@pageouterfalse
%\fi
%%%==================将选项交给ctexbook 处理=======================================
\ifbit@page@openany
    \PassOptionsToClass{openany}{ctexbook}
\fi
\ifbit@page@oneside
    \PassOptionsToClass{oneside}{ctexbook}
\fi
%%========================载入ctexbook 文档类，并设置纸张大小、编码格式及字号===================
\LoadClass[a4paper, cs4size, UTF8]{ctexbook}
%%=========================================加载常用宏=========================================
\RequirePackage{ifxetex}
%\RequirePackage{xparse}
%\RequirePackage{amsmath}
\RequirePackage{tgcursor}
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\RequirePackage[shortlabels]{enumitem}
%\RequirePackage{CJKfntef}
\RequirePackage{array}

%\RequirePackage[numbers,super,compress]{natbib}
%%============================设置西文字体，中文字体由ctex 自动设置=============================
%\setmainfont{Times New Roman}
%\setsansfont{Arial}
%\setmonofont{Courier New}
%\newCJKfontfamily{\hwxk}{STXingkai}
%%======超链接与书签========
\RequirePackage{hyperref}
\hypersetup{
  CJKbookmarks=true,
  bookmarksopen=true,
  bookmarksnumbered=true,
  bookmarksopenlevel=1,
  pdfborder= 0 0 0,
  unicode=true,
  linktoc=all,
  allcolors=black,
  colorlinks=true,
}
%%=====================生成整数倍汉字宽度的空格，默认为1================================
\newcommand{\zhspace}[1][1]{\hspace{#1\ccwd}}
%%======================生成空的下划线，内部使用======================================
\newcommand{\bit@underline}[2][6em]{
  \hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt\relax
}
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
%\bit@define@term{stuid}                    % 学生学号
\bit@define@term{classified}               % 中文分类号
\bit@define@term{udc}                      % UDC编号
\bit@define@term{secret}                   % 密级
%%==============引用geometry 宏包设置纸张和页面========================
\RequirePackage[top=35mm,headsep=10mm,footskip=7mm,bottom=25mm,left=27mm,right=27mm,paper=a4paper]{geometry} %设置版面:上3.5cm，下2.5cm，左2.7cm，右2.7cm，页眉2.5cm，页脚1.8cm，装订线0cm
%% ====================定义几个常用的数学常量符号=====================================
\newcommand{\me}{\mathrm{e}} %定义 对数常数e，虚数符号i,j以及微分算子d为直立体。
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}
%%=====================使用titlesec 宏包设置页眉页脚==========================
%\RequirePackage[pagestyles]{titlesec}

%%===================页眉标题宏============================
\ifbit@opt@doctor
\newcommand{\bit@zh@thesis@name}{北京理工大学博士学位论文}
%\newcommand{\bit@en@thesis@name}{BIT}
\else
\newcommand{\bit@zh@thesis@name}{北京理工大学硕士学位论文}
%\newcommand{\bit@en@thesis@name}{BIT}
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
  \fancyhead[C]{\ifbit@opt@master\zihao{5}\songti\bit@header@title
                \else\zihao{5}\songti\bit@header@title\fi}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0pt}}

%==================================对于openright 选项，必须保证章⾸页右开，且如果前章末页⽆内容须清空其页眉页脚。===================
\let\bit@cleardoublepage\cleardoublepage
\newcommand{\bit@clearemptydoublepage}{%
	\clearpage{\pagestyle{bit@empty}\bit@cleardoublepage}}
\let\cleardoublepage\bit@clearemptydoublepage
%%==========================设置模板打印方式=====

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
\renewcommand\backmatter{%
  \@mainmattertrue
   \pagestyle{bit@headings}
   }

%%===============================设置带圆圈的标准=============================================
\usepackage{tikz}
\usepackage{etoolbox}
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep = 1pt]
    (char) {\phantom{\ifblank{#1}{#2}{#1}}};%
    \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}
%%===================设置全文行距及段落行距==========================
\setlength{\baselineskip}{22bp}
%%============================设置标题格式=================================================
\ctexset{chapter/name={第,章},
  chapter/number={\arabic{chapter}},
  chapter/format={\bfseries\centering\zihao{3}\heiti},
  %aftername={\quad{}} %章序号与章名间空一个汉字符
  chapter/beforeskip={8pt},
  chapter/afterskip={12pt},
  }
  \ctexset{section={
	format={\raggedright\bfseries\heiti\zihao{4}},
%	beforeskip=12bp,
	%afterskip=12bp,
	}
}
% ==========设置二节标题格式========================================
%黑体小四加粗顶左，单倍行距，序号与题目间空一个汉字符
\ctexset{subsection={
   format={\bfseries\heiti\raggedright\zihao{-4}},
   beforeskip=8bp,
   afterskip=12bp,
	}
}
% 设置三节标题格式：黑体小四居左书写，单倍行距，序号与题目间空一个汉字符
\ctexset{subsubsection={
      format={\heiti\raggedright\zihao{-4}},
      beforeskip=12bp,
      afterskip=12bp,
	}
}

%%==========================竖排书脊=================================================还没想好方法

%\NewDocumentCommand{\shuji}{O{\bit@ctitle} O{\thu@cauthor}}{%
  %\newpage\thispagestyle{empty}\heiti\zihao{3}\ziju{0.4}%
  %\noindent\hfill\rotatebox[origin=lt]{-90}{\makebox[\textheight]{#1\hfill#2}}}

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
%定义目录相关设置
\newcommand{\bit@toc@leaders}{\titlerule*[.5pc]{$\cdot$}}
\newcommand{\bit@chap@font}{\songti}
\newcommand{\bit@chap@size}{\zihao{4}}
\newcommand{\bit@sect@font}{\songti}
\newcommand{\bit@sect@size}{\zihao{-4}}
\newcommand{\bit@subs@font}{\songti}
\newcommand{\bit@subs@size}{\zihao{-4}}
\newcommand{\bit@chap@toc@indent}{0bp}
\newcommand{\bit@sect@toc@indent}{2\ccwd}
\newcommand{\bit@subs@toc@indent}{4\ccwd}
%============设置目录格式====================
\titlecontents{chapter}
              [\bit@chap@toc@indent]
              {\bit@chap@size\bit@chap@font}
              {\thecontentslabel\hspace*{.5em}}
              {}{\bit@toc@leaders\contentspage}
\titlecontents{section}
              [\bit@sect@toc@indent]
              {\bit@sect@size\bit@sect@font}
              {\thecontentslabel\hspace*{.5em}}
              {}{\bit@toc@leaders\contentspage}
\titlecontents{subsection}
              [\bit@subs@toc@indent]
              {\bit@subs@size\bit@subs@font}
              {\thecontentslabel\hspace*{.5em}}
              {}{\bit@toc@leaders\contentspage}
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
  %\vspace*{.5cm}
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
  \bit@make@statement
  \setcounter{page}{1}
  \frontmatter
}

%=============研究生中文扉页==========================
\newcommand{\bit@zh@titlepage}{
\thispagestyle{empty}
  \begin{titlepage}
    \heiti\zihao{5}
    \begin{flushleft}
    \begin{tabular}{lp{7cm}}
      \heiti 中文分类号： & \bit@classified    \\
      \heiti UDC分类号： & \bit@udc        \\
    \end{tabular}
    \end{flushleft}
    \vskip 2cm
   % \zihao{4}\heiti \bit@zhdegree
    \vskip 2cm
    \zihao{-2}\heiti \bit@zhtitle
    \vskip 2cm
    %\zihao{3}\heiti \bit@zhauthor
    \vskip 4cm
    \zihao{-3}\heiti
    \begin{tabular}{rc}
      \makebox[12em][l]{作者姓名：}              & \bit@zhauthor    \\
      \makebox[12em][l]{学 院 名称：}            & \bit@zhacademy      \\
      \makebox[12em][l]{指 导 教 师：}           & \bit@zhadvisor    \\
      \makebox[12em][l]{答辩委员会主席：}         & \bit@zhchairman    \\
      \makebox[12em][l]{申 请 学 位 ：}          & \bit@zhdegree    \\
      \makebox[12em][l]{学科专业 ：}             & \bit@zhmajor    \\
       \makebox[12em][l]{学位授予单位  ：}       & \bit@zhschool    \\
      \makebox[12em][l]{论文答辩日期：}          & \bit@zhdate       \\
    \end{tabular}
  \end{titlepage}
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
    \begin{tabular}{rl}
     \makebox[12em][l]{Candidate Name：}              & \bit@enauthor    \\
     \makebox[12em][l]{School or Department:}            & \bit@enacademy      \\
     \makebox[12em][l]{Faculty Mentor:}              & \bit@enadvisor    \\
     \makebox[12em][l]{Chair, Thesis Committee：}         & \bit@enchairman    \\
     \makebox[12em][l]{Degree Applied:  }          & \bit@endegree    \\
     \makebox[12em][l]{Major：}             & \bit@enmajor    \\
     \makebox[12em]{Degree by:}       & \bit@enschool    \\
     \makebox[12em][l]{The Date of Defence：}          & \bit@endate       \\
    \end{tabular}
  \end{titlepage}
  \cleardoublepage
}


\newenvironment{zhabstract}{
    \chapter[摘要]{摘要}
    \
  }{}
  \newenvironment{enabstract}{
    \chapter[Abstract]{Abstract}
    \fontsize{12bp}{20bp}\selectfont
  }{}

\newcommand{\zhkeywords}[2][\zihao{5}]{
    \par\phantom{关键词}\par\noindent
    {
      #1\textbf{关键词：}#2
    }
  }


  \newcommand{\enkeywords}[2][\zihao{5}]{
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
  font = {fontsize, bf},
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

%==========总结环境================
\newenvironment{summary}
{ \setcounter{secnumdepth}{-2}
	\chapter{总结}

}{}
\newenvironment{ack}{
  \chapter{致谢}
  \setcounter{secnumdepth}{-2}
}{}
\newenvironment{publications}{
  \chapter{攻读学位期间取得的研究成果}
  \setcounter{secnumdepth}{-2}
}{}

%%=========================载入其他常用宏包=========================================
\RequirePackage{booktabs}
\RequirePackage{longtable}
%\bibliographystyle{GBT7714-2005NLang}
\endinput
%%
%% End of file `bitthesis.cls'.
