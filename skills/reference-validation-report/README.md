# reference-validation-report

`reference-validation-report` 是一个面向 LaTeX 论文参考文献审计的 Codex skill。

它做两件事：

1. 自动核验参考文献是否能命中权威来源，并检查关键字段是否一致。
2. 生成中文版《参考文献验证报告》PDF，适合给作者或编辑做二次人工复核。

这个目录既可以作为仓库内脚本工具直接运行，也可以复制到本地 Codex skill 目录中使用。

## 目录结构

```text
reference-validation-report/
├─ SKILL.md
├─ README.md
├─ agents/
│  └─ openai.yaml
├─ references/
│  └─ format-spec.md
└─ scripts/
   ├─ generate_reference_validation_report.py
   ├─ run_reference_validation_pipeline.py
   └─ verify_references.py
```

## 这个 skill 做什么

它优先面向这类任务：

- 检查论文参考文献里是否存在幻觉引用、伪造引用、链接错指、元数据错配
- 给 LaTeX 论文生成中文参考文献真实性检测报告
- 在投稿前快速梳理哪些条目已经确认、哪些条目仍需人工复核

当前核验逻辑对以下关键字段更严格：

- 条目类型：`@article` / `@inproceedings` / `@techreport` 等
- 标题
- 作者
- 会议或期刊
- 年份
- DOI

以下字段采用提醒但不默认降级的策略：

- 页码
- volume / number / issue
- URL 缺失但 DOI 已正确

## 适用输入

已实测支持：

1. 标准 `.bib + .bbl + .tex`
2. Elsevier 风格 `\bibitem[...]{key}` 的 `.bbl`
3. `.tex` 中内联 `thebibliography + \bibitem`

## 依赖

- Python 3.10+
- `requests`
- 本地 Chrome 或 Edge

安装 Python 依赖：

```powershell
pip install requests
```

说明：

- PDF 通过本地浏览器 headless 打印生成，因此如果机器上没有可用的 Chrome/Edge，HTML 能生成，但 PDF 会失败。
- 这个 skill 不依赖 `bibtexparser`、`pybtex`、`rapidfuzz` 等额外库。

## 直接运行

### 一键完整流程

```powershell
$env:PYTHONUTF8='1'
python .\skills\reference-validation-report\scripts\run_reference_validation_pipeline.py `
  --project-dir "C:\path\to\paper" `
  --tex "main.tex" `
  --bib "refs.bib" `
  --bbl "main.bbl" `
  --paper-title "Paper Title" `
  --venue "ACM Computing Surveys (CSUR)" `
  --verification-date "2026-07-02" `
  --output-dir "C:\path\to\paper\output\pdf"
```

### 分两步运行

先核验：

```powershell
$env:PYTHONUTF8='1'
python .\skills\reference-validation-report\scripts\verify_references.py `
  --project-dir "C:\path\to\paper" `
  --tex "main.tex" `
  --bib "refs.bib" `
  --bbl "main.bbl" `
  --venue "ACM Computing Surveys (CSUR)" `
  --verification-date "2026-07-02" `
  --output "C:\path\to\paper\output\pdf\reference_validation_report_final.verification.json"
```

再出报告：

```powershell
$env:PYTHONUTF8='1'
python .\skills\reference-validation-report\scripts\generate_reference_validation_report.py `
  --project-dir "C:\path\to\paper" `
  --tex "main.tex" `
  --bbl "main.bbl" `
  --venue "ACM Computing Surveys (CSUR)" `
  --verification-date "2026-07-02" `
  --output-dir "C:\path\to\paper\output\pdf" `
  --verification-json "C:\path\to\paper\output\pdf\reference_validation_report_final.verification.json"
```

## 作为 Codex skill 使用

把整个目录复制到本地：

```text
C:\Users\<你的用户名>\.codex\skills\reference-validation-report
```

然后在 Codex 中可用类似提示词触发：

```text
Use $reference-validation-report to generate a Chinese reference validation report PDF for this LaTeX paper.
```

`SKILL.md` 里定义的是 agent 的工作流程，`README.md` 里定义的是人怎么安装、怎么运行、哪里会失败。

## 输出文件

默认会生成：

- `reference_validation_report_final.verification.json`
- `reference_validation_report_final.html`
- `reference_validation_report_final.pdf`

其中：

- `verification.json` 是结构化核验结果，也是最值得人工抽查的中间产物。
- `html` 是 PDF 的源模板，适合调样式。
- `pdf` 是最终交付物。

## 状态语义

- `confirmed`：找到了足够权威的来源，且关键字段没有明显冲突。
- `pending`：找到了来源，但关键字段存在差异，必须人工复核。
- `missing`：没有找到足够可靠的命中，不能当成已确认真实。

## 核验来源优先级

当前优先使用：

- DOI / Crossref
- arXiv 官方 API
- 官方出版页或官方会议页

辅助使用：

- 标题级 Crossref 搜索
- 官方站内搜索结果页再回落到详情页

不把以下站点单独当成最终权威结论：

- Semantic Scholar 聚合页
- Google Scholar 结果页
- 各类非官方镜像站

这些来源可以帮助定位，但不应直接充当“已确认无误”的最终证据。

## 已知缺陷

这套 skill 现在已经能做真实核验，但还不是“任何论文 100% 全自动零误判”。

目前仍然容易遇到这些问题：

- 非标准 `.bst` / `.bbl` 可能导致解析不完整
- `biblatex` / `biber` 风格输出不一定兼容
- 老论文、冷门期刊、小众出版社可能缺少稳定公开元数据接口
- 同一工作存在 arXiv / workshop / journal 多版本时，自动流程未必能判断你真正想引用哪个版本
- 内联 `\bibitem` 是自由文本时，抽取标题、venue、作者的准确率显著低于结构化 BibTeX
- 如果本地条目标题本身就写错，但又恰好能搜到相近论文，仍可能出现误命中风险

## 常见失败场景

### 1. 全部或大量 `missing`

常见原因：

- `.bbl` 没生成
- `thebibliography` 里是高度自由文本
- 网络超时
- DOI 本身写错
- 标题抽取失败

建议先看：

- `verification.json`
- 是否真的有 `.bbl`
- 单条文献标题在浏览器里是否能查到

### 2. PDF 没生成

常见原因：

- 本机没有可调用的 Chrome 或 Edge
- 浏览器 headless 打印失败
- 路径里有权限或转义问题

### 3. 文献真实但状态成了 `pending`

这通常不是 bug，而是说明至少有一个关键字段和权威来源不一致，比如：

- 本地写成了 `@inproceedings`，实际是 `@article`
- 题名不一致
- 作者顺序或作者列表明显不一致
- venue 填错
- DOI 指向了另一篇文献

## 诚实性边界

这个 skill 默认遵守以下规则：

- 没核验过，不输出“全部真实”
- 只要存在 `pending` 或 `missing`，结论就必须保守
- 只要关键元数据有冲突，就写入“二、引用信息问题”
- 不伪造证据链接，不把聚合页包装成官方证据

## 人工已核查时的快速旁路

如果用户已经明确说明“所有参考文献都已人工逐条核查，只是现在急需一份全通过报告”，可以使用：

```powershell
$env:PYTHONUTF8='1'
python .\skills\reference-validation-report\scripts\run_reference_validation_pipeline.py `
  --project-dir "C:\path\to\paper" `
  --tex "main.tex" `
  --bib "refs.bib" `
  --bbl "main.bbl" `
  --paper-title "Paper Title" `
  --venue "Target Venue" `
  --verification-date "2026-07-02" `
  --output-dir "C:\path\to\paper\output\pdf" `
  --manual-audited-all-confirmed
```

注意：

- 这个模式不会联网逐条真查
- 它会直接把所有条目标成 `confirmed`
- 它只适合“人工已经核完，只差报告”的场景

## 建议的人机协作方式

最稳妥的流程是：

1. 先跑正常核验流程
2. 人工重点复核 `pending` 和 `missing`
3. 修正 `.bib` 或 `.tex`
4. 重新生成最终报告

如果作者自己已经逐条人工核对完，再使用旁路模式生成全通过版即可。

