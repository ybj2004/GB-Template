# GB-Template

用于起草中华人民共和国国家标准的 LaTeX 模板。本项目已针对 TeX Live 2026 翻新，提供 XeLaTeX、latexmk、Biber、中文索引和 VSCode 构建配置。

## 规范依据

- [GB/T 1.1—2020《标准化工作导则 第1部分：标准化文件的结构和起草规则》](<references/GBT+1.1-2020 标准化工作导则 第1部分：标准化文件的结构和起草规则.pdf>)：文件结构、要素和编排格式。
- GB/T 7714—2025《信息与文献 参考文献著录规则》：参考文献著录，使用本机 biblatex 的 `gb7714-2025` 样式。

模板实现常用结构和版式，不替代对具体技术内容的审查，也不等同于官方出版认证。

## 环境要求

- TeX Live 2026，包含 `xelatex`、`latexmk`、`biber`、`biblatex-gb7714-2015`（其中提供 `gb7714-2025`）和 `zhmakeindex`。
- Python 3.10 或更高版本，仅使用标准库。
- Windows 宋体和黑体。其他操作系统需要根据本机字体调整 ctex 字体配置。
- 可选：VSCode 与 LaTeX Workshop。

所有命令都应能从 PATH 找到。**构建不需要 `--shell-escape`。**

## 构建

### Windows 批处理

```bat
make.bat
```

清理生成文件：

```bat
make.bat clean
```

### 命令行

```bash
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error GB-template
```

清理生成文件：

```bash
latexmk -C GB-template
```

`latexmkrc` 会自动完成 XeLaTeX、Biber、中文索引生成和索引后处理。`buildindex.py` 按顺序调用 `zhmakeindex` 与 `adjustind.py`，任一步骤失败都会中断构建。

### VSCode

项目已包含 `.vscode/settings.json`。安装 LaTeX Workshop 后：

- `Ctrl+Alt+B`：构建；
- `Ctrl+Alt+V`：打开 PDF；
- 保存 `.tex` 文件时自动构建。

## 项目结构

```text
GB-template.tex       示例主文档和封面参数
GB-template.cls       文档类、版式与参考文献配置
body/                 前言、引言、正文和附录示例
figures/              图片资源
references/           GB/T 1.1—2020 规范文件
bibfile.bib           参考文献数据库
gb-idxstyle.mst       中文索引样式
latexmkrc             latexmk 索引规则
buildindex.py         索引构建入口
adjustind.py          UTF-8 索引后处理
make.bat              Windows 构建入口
```

## 模板使用

封面参数在 `GB-template.tex` 中设置：

```tex
\ICS{ICS 号}
\CCS{CCS 号}
\biaozhunhao{GB/T XXXXX—XXXX}
\daitibiaozhunhao{代替文件编号}
\name{文件名称}
\enname{英文名称}
\conformity{与国际标准一致性程度的标识}
\department{发布部门}
\fabudate{XXXX-XX-XX}
\shishidate{XXXX-XX-XX}
```

旧命令 `\fenlei` 仍可作为 `\CCS` 的兼容别名。

正文结构示例：

```tex
\begin{document}
\input{preamble.tex}  % 前言和可选的引言
\mainmatter
\input{basic-use.tex} % 范围、规范性引用文件和术语条目
\input{structure.tex} % 层次、列项和其他结构要素
\input{elements.tex}  % 图、表、公式、注、示例和引用
\appendix\autoclearpage
\input{appendix.tex}
\end{document}
```

- `\begin{preamble}{前言}...\end{preamble}`：编写前言；将参数改为 `引言` 可编写引言。
- `\gchapter{标题}`：规范性附录。
- `\zchapter{标题}`：资料性附录。
- `\index{词语}`：加入索引。
- 图、表和公式在正文中连续编号，附录中按附录编号重新编号。

### 章、条、段和列项

正文有标题章的编号和标题上下各空一行；有标题条上下各空半行。段首缩进两个汉字，段间不额外增加空白。前言、引言、目次和附录使用各自的版式。

- `\stdclause{条文}`：无标题条，编号后接排条文。
- `stdlist`：破折号列项，嵌套时使用间隔号。
- `stdenum`：字母编号列项，嵌套时使用数字编号。
- `stdsymbols`：符号、缩略语和公式释文清单。

第一层列项的标记/内容及回行位于第 2/5 个汉字位，第二层位于第 4/7 个汉字位。`body/structure.tex` 包含长列项和嵌套列项示例。

### 术语条目

```tex
\begin{term}{中文术语}{English equivalent}
定义正文。
\stdexample{术语条目中的示例。}
\stdnote{术语条目中的注，置于示例之后。}
\termsource{GB/T XXXXX—XXXX，条目编号，有修改}
\end{term}
```

`term` 自动生成条目编号。条目编号单独占一行；中文术语与英文对应词在下一行缩进两个汉字。来源按“定义—示例—注—来源”的顺序放置；无修改时省略“有修改”。

默认使用 `\section` 级编号。分组术语可指定其他级别，例如 `\begin{term}[subsection]{标准化文件}{standardizing document}` 生成 `3.1.1` 形式的编号。`body/basic-use.tex` 按 GB/T 1.1—2020 第 3 章给出了完整示例。

### 注、示例及其他表述

- `\stdnote{内容}`：单个注；`\stdnote[1]{内容}`：带编号注。
- `\stdexample{内容}`：单个示例；`\stdexample[1]{内容}`：带编号示例。
- `\stdexampleframe{内容}`：置于线框内的示例。
- `\stdunits{单位为毫米}`：图或表的单位陈述。
- `\stdfootnotetext{a}{内容}`：图脚注或表脚注。
- `\importantnotice{注意}{内容}`：重要提示，也可使用“危险”“警告”等等级词。
- 普通正文继续使用 `\footnote{内容}`、`\label`、`\ref`、`\eqref` 和 `\cite`。

表格外框、表头下框线以及表注/表脚注区域使用 1 磅实线。`body/elements.tex` 包含多列数字表、分图、长公式和 100 行跨三页 `longtable` 示例；续页重复表编号、单位陈述和表头，每页均保留底框。

## 参考文献

文档类使用 biblatex 和 Biber，并加载项目根目录的 `bibfile.bib`。正式写作时使用 `\cite{条目键}` 引用文献。

示例主文档末尾保留了 `\nocite{*}`，用于展示数据库中的全部条目；正式文件可删除该行，仅输出实际引用的文献。修改 `.bib` 文件后直接重新运行上述构建命令即可。

## 许可证

见 [LICENSE](LICENSE)。
