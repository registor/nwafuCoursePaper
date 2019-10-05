%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% nwafucoursepaper - 西北农林科技大学科技类及IT类课程论文模板
%% nangeng@nwafu.edu.cn
%% 2019年10月
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nwafucoursepaper}[October, 2019 LaTeX cls for NWAFU Course Papers]
\LoadClass[a4paper,zihao=-4,scheme = chinese]{ctexart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 其它需要的宏包
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{etoolbox}% 为命令和环境打补丁的宏包
\RequirePackage{enumerate}% 调整列表格式
\RequirePackage{amsmath,mathrsfs,amsfonts} % 数学相关
\RequirePackage{booktabs}% 三线表格
\RequirePackage{colortbl}% 彩色表格
\RequirePackage{multirow,makecell}% 表格行合并，单元格处理
\RequirePackage{multicol}% 多栏
\RequirePackage{ulem}% 下划线

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 命令行窗口及代码排版(自己开发的宏包)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{boxie}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 插图标注宏包(修改为标注框可以换行)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz-imglabels}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 流程图宏包(自己开发)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz-flowchart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% hyperref settings
%% 超链接设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
  bookmarksnumbered,
  colorlinks,
  linkcolor={black},
  citecolor={black},
  urlcolor={black}
}

\RequirePackage[open,openlevel=0,atend]{bookmark}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% graphicx settings
%% 图片设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\graphicspath{{./figs/}{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% geometry settings
%% 页面设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}
\geometry{
  textwidth=138mm,
  textheight=215mm,
  left=27mm,
  %% or
  %% inner=23mm,
  right=27mm,
  %% or
  %% outer=18mm,
  top=25.4mm, bottom=25.4mm,
  headheight=2.17cm,
  headsep=4mm,
  footskip=12mm,
  heightrounded,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% titlesec
%% 标题设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
\RequirePackage{zhnumber}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 排版摘要
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\makeabstract{  
  \nwafu@make@abstract@cn
}

\RequirePackage{environ}
% 内部命令
\newcommand\nwafu@label@abstract{摘要}
\newcommand\nwafu@label@keywords{关键词}
\newcommand\nwafu@label@keywordsep{; }
% 摘要环境与内容提取
\newcommand{\nwafu@@abstract}[1]{\long\gdef\nwafu@abstract{#1}}
\renewenvironment{abstract}{\Collect@Body\nwafu@@abstract}{}
% 定义列表提取命令
\def\nwafu@define@list#1#2{
  \define@key{nwafu}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname nwafu@#1\endcsname{}
  \expandafter\gdef\csname nwafu@#1@pdf\endcsname{}
  \expandafter\gdef\csname #1\endcsname##1{
    \@for\reserved@a:=##1\do{
      \expandafter\ifx\csname nwafu@#1\endcsname\@empty\else
        \expandafter\g@addto@macro\csname nwafu@#1\endcsname{%
          \ignorespaces #2}
        \expandafter\g@addto@macro\csname nwafu@#1@pdf\endcsname{,}
      \fi
      \expandafter\expandafter\expandafter\g@addto@macro%
        \expandafter\csname nwafu@#1\expandafter\endcsname\expandafter{\reserved@a}
    }
    \expandafter\gdef\csname nwafu@#1@pdf\endcsname{##1}
  }
}
\nwafu@define@list{keywords}{\nwafu@label@keywordsep}

% 关键字处理
\newbox\nwafu@kw
\newcommand{\nwafu@put@kw}[2]{%
  \begingroup
  \setbox\nwafu@kw=\hbox{#1}
  \noindent\hangindent\wd\nwafu@kw\hangafter1
  \box\nwafu@kw#2\par
  \endgroup
}
% 排版中文摘要
\newcommand\nwafu@make@abstract@cn{
  \noindent\rule{\textwidth}{.5pt}\\%[1ex]
  \begingroup    
    \setlength\parindent{2\ccwd}\songti\indent
    {\heiti\zihao{-4} \makebox[\widthof{\nwafu@label@keywords}][s]{\nwafu@label@abstract}：}
    {\songti\zihao{5}\nwafu@abstract}
  \endgroup

  \vspace{2ex}

  \begingroup
    \setlength\parindent{2\ccwd}\songti\indent
    {\heiti\zihao{-4} \nwafu@label@keywords{}：}
    {\songti\zihao{5}\nwafu@keywords}
    %\nwafu@put@kw{\heiti\zihao{-4}\nwafu@label@keywords{}：}{\songti\zihao{5}\nwafu@keywords}    
  \endgroup\\[-1ex]
  \rule{\textwidth}{.5pt}
}

%\renewenvironment{abstract}{\noindent\rule{\textwidth}{.5pt}\\[2ex] \centering\begin{minipage}{.97\textwidth}{\zihao{-4}\sffamily\bfseries\abstractname}\\}
%{\par\noindent\end{minipage}\\[2ex] \rule{\textwidth}{.5pt}}

%% section
\titleformat{\section}
[hang]
{\sffamily}
{\centering\zihao{4}\bfseries \chinese{section}、}%\thesection
{1pt}
{\zihao{4}\bfseries}

%% subsection
\titleformat{\subsection}
[hang]
{\sffamily}
{\zihao{4}\bfseries\thesubsection\enspace}
{1pt}
{\zihao{4}\bfseries\filright}

%% subsubsection
\titleformat{\subsubsection}
[hang]
{\sffamily}
{\zihao{-4}\bfseries\thesubsubsection\enspace}
{1pt}
{\zihao{-4}\bfseries\filright}

\titlespacing{\section}{0pt}{2.5ex plus 1ex minus .2ex}{1.3ex plus .2ex}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% head and foot
%% 页眉页脚
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\RequirePackage{zhnumber}

\pagestyle{fancy}
\fancyhf{}
\renewcommand\headrulewidth{.5pt}
\renewcommand\footrulewidth{0pt}
%\futurelet\TMPheadrule\def\headrule{{\color{violet}\TMPheadrule}}

\renewcommand{\sectionmark}[1]{\markright{#1}}

\fancyhead[L]{\kaishu{\rightmark}}
\fancyhead[R]{\thepage}

% 中文行距调整
\RequirePackage{zhlineskip}

%% captions
\RequirePackage[singlelinecheck=false]{caption}
\DeclareCaptionFont{kai}{\kaishu}
\captionsetup[table]{belowskip=0pt,aboveskip=5pt,labelfont=kai,textfont=kai}
\captionsetup[figure]{belowskip=0pt,aboveskip=5pt,format=hang,labelfont=kai,textfont=kai}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 重定义强调字体的代码，
%% 解决默认强调字体是italic，中文用楷体代替，
%% 在此设置为加粗，注意需要使用etoolbox宏包
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\let\origemph\emph
\newcommand*\emphfont{\normalfont\bfseries}
\DeclareTextFontCommand\@textemph{\emphfont}
\newcommand\textem[1]{%
  \ifdefstrequal{\f@series}{\bfdefault}
    {\@textemph{\CTEXunderline{#1}}}
    {\@textemph{#1}}%
}
\RenewDocumentCommand\emph{s o m}{%
  \IfBooleanTF{#1}
    {\textem{#3}}
    {\IfNoValueTF{#2}
      {\textem{#3}\index{#3}}
      {\textem{#3}\index{#2}}%
     }%
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 解决中英文混排文字超出边界问题
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\sloppy 

\endinput
%% End of file `nwafucoursepaper.cls'.
