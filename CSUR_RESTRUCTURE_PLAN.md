# CSUR 主文 + 增刊重构方案

目标：把当前 83 页稿件重构为“**正文 35 页以内（含参考文献）+ 增刊承载扩展证据**”，同时保留完整性、严谨性和可追溯性。

适用对象：当前仓库中的 [main.tex](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\main.tex)。

---

## 0. 执行总则

### 0.1 核心目标

1. 正文只保留论证主链：`state object -> control surface -> coupling path -> evaluation boundary -> remaining gap`。
2. 增刊承接完整证据：长表、细矩阵、扩展案例、传播轨迹、更多系统对比、补充图。
3. 正文优先保留“机制综合”而不是“论文列表”。
4. 任何段落若主要功能是“补背景”而不是“推动主论点”，默认下沉到增刊。
5. 参考文献不删除，但正文引用要收敛到“支持论证所必需”的最小集合。

### 0.2 页数预算

- 正文引言：2.0 - 2.5 页
- Foundations：3.0 - 4.0 页
- 三个核心维度：每章 3.5 - 4.5 页
- Comparative Synthesis：2.0 - 3.0 页
- Design Implications：3.0 - 4.0 页
- Evaluation + Conclusion：2.0 - 3.0 页
- 参考文献：尽量控制在正文剩余空间内，正文文本最好先压到 23 - 26 页左右

### 0.3 每节统一改写模板

每个保留在正文的小节都尽量压成 4 个功能段：

1. `Local control problem`：这节到底在讨论什么控制问题。
2. `Mechanism grouping`：不要逐篇讲，按机制分组。
3. `Boundary/tradeoff`：这些机制在哪些边界上成立，在哪些边界上失效。
4. `Remaining gap`：这一节真正没解决的问题是什么。

### 0.4 句子级裁剪规则

#### 直接删除或下沉的句子类型

1. 罗列 4 篇及以上论文但没有高层总结的句子。
2. 同一段里连续出现多个系统名，只是在陈述“谁做了什么”。
3. 解释一个领域的历史沿革，但与本节控制问题无直接关系。
4. 主要功能是“说明我们读了很多论文”的句子。
5. 图注已经表达过、正文又重复解释一遍的句子。
6. 详细实现路径、工程组件、实验设定，但不影响主结论的句子。
7. 只是补充例子、没有改变本节论证方向的句子。

#### 必须保留的句子类型

1. 定义 state object 是什么。
2. 说明 runtime 实际能控制什么。
3. 解释为什么这个控制会传播到系统边界。
4. 点明文章真正优化或约束了哪个 evaluation boundary。
5. 明确还剩下什么系统缺口。
6. 把不同论文归并到一个机制类目下的综合句。

#### 允许压缩但不应删除的句子类型

1. 说明本节与前后两节关系的过渡句。
2. 用于引出图表的解释句。
3. 对读者可能误解的边界澄清句。

---

## 1. 章节-小节-修改动作-目标页数

| 章节 | 小节 | 修改动作 | 目标页数 | 原因 | 重要性 | 边界约束 | 优先级 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Introduction | 全章 | 保留主张、三轴结构、五元分析框架、贡献；压缩应用例子为 3 个代表场景 | 2.0-2.5 | 引言必须快速建立问题和贡献，不能先进入大规模文献铺陈 | 高 | 可说“为何 state 成为 runtime control 问题”；不能展开成多个 subfield 的历史综述 | P0 |
| Foundations: Scope, Model, and Taxonomy | Survey Protocol and Evidence Posture | 保留，压缩成方法说明 | 0.5-1.0 | 这是全文证据选择的合法性来源 | 高 | 可说“我们如何选文献”；不能写成长方法论文 | P0 |
| Foundations: Scope, Model, and Taxonomy | Positioning Relative to Existing Surveys | 保留对比结论，删掉长篇旁支 | 0.5-0.8 | 要证明本文相对已有 survey 的差异 | 高 | 可说“我们与既有 survey 的 comparison unit 不同”；不能逐篇展开所有相关 survey | P0 |
| Foundations: Scope, Model, and Taxonomy | Broader Literature Landscape | 大幅压缩，改为“历史根系 + 边界说明” | 0.8-1.2 | 这是最容易膨胀的背景段，必须收束 | 中高 | 可说“哪些传统构成边界”；不能写成完整文献编年史 | P0 |
| Foundations: Scope, Model, and Taxonomy | System Model: Where State Lives in a Runtime | 保留 | 0.6-0.8 | 这是后文所有分类的基础 | 高 | 可说 state 在 runtime 里如何被治理；不能引入新的顶层架构假设 | P0 |
| Foundations: Scope, Model, and Taxonomy | A Unifying View of Stateful Computing Systems | 保留，突出 propagation 视角 | 0.6-0.8 | 全文核心总框架 | 高 | 可说“stateful computing systems 的统一视角”；不能展开成多个重复例子 | P0 |
| Foundations: Scope, Model, and Taxonomy | Taxonomy of State Management Problems | 保留，压缩成定义性 taxonomy | 0.8-1.0 | 三轴结构是全文骨架 | 高 | 可说 access/execution/evolution 的关系；不能在此处塞入大量系统清单 | P0 |
| Core Dimensions of State Management | State Access and Scheduling | 保留为主干章，删除细碎列举 | 3.5-4.5 | 这是 state 管理最传统也最容易说散的一章 | 高 | 可说 observability、locality、recovery、elasticity 的耦合；不能变成“论文顺序回顾” | P0 |
| Core Dimensions of State Management | State-Aware Execution Optimization | 保留为主干章 | 3.5-4.5 | 这是从 state 到 end-to-end gain 的关键桥梁 | 高 | 可说 representation、execution path、quality boundary；不能把每个系统的实现细节都写全 | P0 |
| Core Dimensions of State Management | State Evolution and Reuse | 保留为主干章 | 3.5-4.5 | 这是将短期 state 与长期 memory 连起来的关键 | 高 | 可说 update/retention/retrieval/reuse 的闭环；不能写成模型或系统清单式综述 | P0 |
| Core Dimensions of State Management | Quantitative Propagation Trace: A Worked Example | 下沉到增刊，正文最多保留一句概述 | 0-0.3 | 详细推导占页数且对主论证不是必须 | 中 | 可说“传播视角如何工作”；不能保留完整计算链条 | P1 |
| Comparative Synthesis Across Domains | Comparative Criteria and Integration Principles | 保留，短写 | 0.5-0.8 | 这是把三轴落到跨域比较的入口 | 高 | 可说比较维度和整合原则；不能重复前文定义 | P0 |
| Comparative Synthesis Across Domains | Cross-Domain Comparative Synthesis | 保留，但只留跨域结论 | 1.0-1.5 | 需要给出“为什么这些领域其实在解同一类问题” | 高 | 可说跨 streaming / serving / retrieval / retention 的共同控制问题；不能逐域展开过长 | P0 |
| Comparative Synthesis Across Domains | Streaming and Transactional Dataflow Systems | 压缩 | 0.3-0.5 | 这一域是历史根系，不应抢正文中心 | 中 | 可说代表性机制；不能重述全部历史系统 | P1 |
| Comparative Synthesis Across Domains | Hardware-Conscious and Approximation-Aware Stateful Execution | 保留 | 0.4-0.6 | 这是 execution 轴的跨域证据 | 高 | 可说 stateful execution 的 boundary；不能扩写成硬件综述 | P0 |
| Comparative Synthesis Across Domains | LLM Serving and Short-Lived Memory Lifecycles | 保留 | 0.4-0.6 | 这是当前最强的现实驱动场景之一 | 高 | 可说 KV-cache / disaggregation / phase control；不能铺太多 serving 系统细节 | P0 |
| Comparative Synthesis Across Domains | Retrieval Memory and Vector-Index State Layers | 保留 | 0.4-0.6 | 这是 evolution 轴最强的实证支撑 | 高 | 可说 index maintenance / freshness / exposure；不能做成 ANN survey | P0 |
| Comparative Synthesis Across Domains | Continual Learning and Retention Governance | 保留 | 0.4-0.6 | 这是长期复用与遗忘治理的落点 | 中高 | 可说 budget / retention / reuse；不能扩展到全面 CL 综述 | P0 |
| Comparative Synthesis Across Domains | Comparative Mechanism Matrices | 整体下沉到增刊，正文最多保留一个精简表 | 0-0.5 | 大矩阵最占页数，且很容易稀释论证 | 中 | 正文只保留用于支撑主结论的极简对照；不能保留全量矩阵 | P0 |
| Design Implications for Stateful Runtimes | Cross-Cutting Design Principles | 保留，压缩为 4 条 | 0.8-1.0 | 必须把综述上升为设计原则 | 高 | 可说原则；不能展开为新架构论文 | P0 |
| Design Implications for Stateful Runtimes | A Design Space for Stateful Runtime Architectures | 保留，但每个维度只给一句定义和一句解释 | 0.8-1.0 | 需要从机制走向架构选择 | 高 | 可说 granularity / control-plane coupling / lifecycle / service-boundary；不能加长案例 | P0 |
| Design Implications for Stateful Runtimes | Failure Modes and Anti-Patterns | 保留 | 0.8-1.2 | 这是全文最有“审稿价值”的部分之一 | 高 | 可说 anti-pattern 及其缺失契约；不能变成过长例证串讲 | P0 |
| Design Implications for Stateful Runtimes | A Contract-Oriented Blueprint for Stateful Runtimes | 保留“蓝图概念”，细节下沉 | 0.8-1.0 | 这是全文最强的综合性产物 | 高 | 可说 blueprint layers；不能保留过细状态机或全部推导 | P0 |
| Design Implications for Stateful Runtimes | Cross-Domain Case Studies | 整体下沉到增刊 | 0-0.3 | case study 不应占主文页数 | 中 | 正文只可保留一句示意；不能展开三段完整案例 | P1 |
| Evaluation and Research Outlook | Evaluation Dimensions for Future Surveys and Systems | 保留 | 0.8-1.2 | 需要给出统一的评估语言 | 高 | 可说 steady-state / tail / quality / sustainability；不能变成指标大全 | P0 |
| Evaluation and Research Outlook | An Integrated Research Agenda | 保留但压缩 | 0.8-1.0 | 必须收束为未来方向 | 高 | 可说四个 pressure points；不能无限扩展成新研究方向清单 | P0 |
| Conclusion | 全章 | 保留，压到半页左右 | 0.4-0.6 | 结论只需重申主论点和主缺口 | 高 | 可说全文贡献与剩余缺口；不能新增信息 | P0 |

---

## 2. 图表与矩阵取舍规则

### 2.1 正文建议保留的图

| 图 | 处理方式 | 理由 | 约束 | 优先级 |
| --- | --- | --- | --- | --- |
| `fig:propagation` | 保留 | 全文总框架图，必须有 | 不能再增加过多说明文字 | P0 |
| `fig:poster-overview` | 保留或压缩保留 | 章节总览图，帮助读者理解结构 | 若版面紧张可缩小，不可删掉全部结构提示 | P1 |
| `fig:running-examples` | 保留 1 版 | 作为三个主轴的直观示意 | 只能保留最少实例，不能再扩充 | P1 |
| `fig:access-designspace` | 保留 | access/scheduling 章的核心图 | 图注要短，正文不要重复解释图中全部节点 | P0 |
| `fig:kvcache-lifecycle` | 保留 | execution 章的代表图 | 只保留关键生命周期，不要在正文再加大量延展 | P0 |
| `fig:retention-taxonomy` | 保留 | evolution 章的代表图 | 图注短化，正文只引用其要点 | P0 |
| `fig:cross-domain` | 保留 1 张 | 跨域 synthesis 的核心证据图 | 不能和多个矩阵重复表达同一件事 | P0 |
| `fig:execution-seams` | 保留 | 支撑 hardware/approximation 轴 | 不能把图变成第二套综述 | P1 |
| `fig:memory-planes` | 保留 | 支撑 memory governance 与 evolution 轴 | 只保留必要层次，不要过度解释 | P0 |
| `fig:antipattern-map` | 保留 | anti-pattern -> contract repair 的关键图 | 不能再增加过多分支 | P0 |
| `fig:blueprint-flow` | 保留 | blueprint 主图 | 细节必须收敛为 5 层 | P0 |
| `fig:disturbance-protocol` | 保留 | 评价体系的核心图 | 不可删，因为它支撑 evaluation 章 | P0 |

### 2.2 建议移到增刊的图

| 图 | 处理方式 | 理由 | 约束 | 优先级 |
| --- | --- | --- | --- | --- |
| `Quantitative Propagation Trace` 相关图 | 下沉 | 推导型图占页且非主线必需 | 增刊可保留完整版本 | P1 |
| `Cross-Domain Case Studies` 相关图 | 下沉 | case study 更适合增刊 | 正文只留一句入口 | P1 |
| 任何重复表达“生命周期/蓝图/矩阵”的补充图 | 下沉 | 避免同义重复 | 正文不得同时出现多个表达同一结论的重图 | P0 |

### 2.3 正文建议保留的列表/矩阵

| 矩阵/列表 | 处理方式 | 理由 | 约束 | 优先级 |
| --- | --- | --- | --- | --- |
| 三轴 taxonomy 列表 | 保留 | 这是全文结构骨架 | 只保留一版，不重复展示 | P0 |
| 五元分析框架列表 | 保留 | 这是全文的统一比较合同 | 不要扩成多个变体 | P0 |
| 极简跨域对照表 | 保留 1 张 | 用于证明跨域相似性 | 列数要少，不能变成长矩阵 | P0 |
| anti-pattern -> contract repair 对照列表 | 保留简版 | 支撑 design implications | 只保留最关键的几项 | P0 |

### 2.4 建议移到增刊的矩阵/列表

| 矩阵/列表 | 处理方式 | 理由 | 约束 | 优先级 |
| --- | --- | --- | --- | --- |
| `Comparative Mechanism Matrices` 全量表 | 下沉 | 页数消耗大且与正文重复度高 | 增刊保留全量，正文只保留摘要版 | P0 |
| `Evaluation-and-gap matrix` 全量表 | 下沉 | 更适合作为补充检索材料 | 正文只保留核心结论 | P0 |
| 详细 paper-by-paper lists | 下沉 | 会破坏 synthesis 语气 | 正文只保留机制分组 | P0 |
| 长版 literature landscape 清单 | 下沉 | 容易写成 related work 罗列 | 正文保留边界说明即可 | P0 |

---

## 3. 边界约束：能改什么，不能改什么

### 3.1 可以改

1. 可以删掉大段 paper-by-paper 叙述，只保留机制级综合。
2. 可以把长表、长图、长案例、长推导整体放进增刊。
3. 可以压缩 background 和 related-survey 部分。
4. 可以合并重复表达相同观点的段落。
5. 可以减少正文中的系统数量，但不能减少关键机制类型。
6. 可以把“完整证据”转移到增刊，只要正文论证链闭合。

### 3.2 不能改

1. 不能删掉三轴结构：`access / execution / evolution`。
2. 不能删掉五元分析框架。
3. 不能删掉正文中对“state as runtime control problem”的主论点。
4. 不能把正文改写成“论文摘要拼接”。
5. 不能把讨论范围缩到单一领域。
6. 不能让正文失去独立可读性。
7. 不能用增刊替代正文的核心论证。
8. 不能把 references 作为“节省正文”的唯一手段；正文本身也必须压缩。

---

## 4. 逐小节改写指令与前后对照

说明：

1. “删什么句子”是指优先删除或下沉到增刊的句子类型。
2. “留什么句子”是指正文必须保留的句子类型。
3. “改写模板”给出建议的重写方向，不是逐字替换文本。
4. “前后对照”展示的是句子功能的变化，不是唯一写法。

### 4.1 Introduction

#### `\section{Introduction}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 用最短篇幅建立问题、主张、三轴、贡献 |
| 该删什么句子 | 连续罗列多个应用场景和系统名的句子；对每个领域都给一个具体 state object 的长串举例；贡献里“同义改写”的重复句 |
| 该保留什么句子 | `state 已成为 runtime control problem`；三轴结构定义；五元框架入口；文章贡献 |
| 改写模板 | 第 1 段：state 为什么变成中心问题。第 2 段：为什么传统分解不够。第 3 段：三轴。第 4 段：贡献与文章结构。 |
| 前后对照 | 修改前：“streaming、edge、LLM serving、RAG、continual learning 各自列举一串 state 对象。” 修改后：“只保留 2-3 个场景作为代表，句尾用一句高层总结把它们收束到共同控制问题上。” |
| 不能改的点 | 不能删 propagation view；不能删三轴枚举；不能删 contribution paragraph |

### 4.2 Foundations: Scope, Model, and Taxonomy

#### `\section{Foundations: Scope, Model, and Taxonomy}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 交代范围、证据边界、统一模型和 taxonomy |
| 该删什么句子 | 仅仅在解释“我们读了哪些相关领域”的句子；不影响 taxonomy 的旁支历史描述 |
| 该保留什么句子 | scope、排除边界、五元框架的合法性、三轴 taxonomy 的定义句 |
| 改写模板 | 先给范围，再给证据规则，再给统一模型，再给 taxonomy。 |
| 前后对照 | 修改前：“范围、文献景观、survey 对比、系统背景混在一起。” 修改后：“每段只回答一个问题：看什么、为什么看、怎么比、怎么分类。” |
| 不能改的点 | 不能把 Foundations 删成只有 related work；不能丢掉 state schema / comparison scaffold |

#### `\subsection{Survey Protocol and Evidence Posture}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 证明选文标准与证据姿态 |
| 该删什么句子 | bibliometric 味道太重、但不影响你们 comparative protocol 的描述；“我们不是 exhaustive”的反复表述 |
| 该保留什么句子 | canonical / transfer / frontier 这类证据分层；为什么优先 stable venue；为什么按 control problem 组织 |
| 改写模板 | 1 段讲选文路径，1 段讲 evidence posture。 |
| 前后对照 | 修改前：“多句都在解释不是 exhaustive。” 修改后：“一句话声明非穷尽性，重点转到‘为什么这些文献足以支撑比较’。” |

#### `\subsection{Positioning Relative to Existing Surveys}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 说明这篇 survey 与已有 survey 的真正区别 |
| 该删什么句子 | 对每篇已有 survey 的细节复述 |
| 该保留什么句子 | comparison unit 不同、cross-domain ambition 不同、control problem 视角不同 |
| 改写模板 | 只保留“已有 survey 看什么，我们看什么，因此本文补哪里”。 |
| 前后对照 | 修改前：“多个 survey 各讲一段。” 修改后：“按 2-3 类已有 survey 聚类比较。” |

#### `\subsection{Broader Literature Landscape}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 只给历史根系和边界，不做全面景观综述 |
| 该删什么句子 | 每个相邻传统都展开 4-6 篇论文的句子；“证明这个领域也相关”的冗长句 |
| 该保留什么句子 | 为什么 stream/dataflow、transactional systems、serving systems、retrieval systems 分别贡献了某个核心控制问题 |
| 改写模板 | 每个子方向只保留“这个方向把什么 state seam 变得可见”。 |
| 前后对照 | 修改前：“像 mini-related work。” 修改后：“像边界说明。” |
| 不能改的点 | 不能把 literature landscape 完全删掉，因为需要说明跨域合法性 |

#### `\subsection{System Model: Where State Lives in a Runtime}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 搭建 state object 在 runtime 中的位置模型 |
| 该删什么句子 | 纯例子堆砌句；若一句话已经由图概括，则正文不重复 |
| 该保留什么句子 | state 如何成为观察、调度、更新、恢复的共同对象 |
| 改写模板 | 从“state 在哪里”过渡到“为什么它必须被治理”。 |

#### `\subsection{A Unifying View of Stateful Computing Systems}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 统一传播视角和系统类型 |
| 该删什么句子 | 重复解释 propagation 的句子 |
| 该保留什么句子 | “局部 mismatch 如何传播成系统级 instability”的定义句 |
| 改写模板 | 先给统一命题，再给 1-2 个跨域例子。 |

#### `\subsection{Taxonomy of State Management Problems}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 用最紧凑方式定义三轴和五元框架 |
| 该删什么句子 | taxonomy 周边的扩展讨论；代表系统类型的长版枚举 |
| 该保留什么句子 | 三轴定义；五元分析 scaffold；代表 system classes 的简短定位 |
| 改写模板 | 一段定义三轴，一段定义五元框架，一段说明 system classes 即可。 |
| 前后对照 | 修改前：“taxonomy + examples + classes 混杂。” 修改后：“taxonomy 是正文，classes 是简短注脚。” |

### 4.3 Core Dimensions of State Management

#### `\section{Core Dimensions of State Management}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 作为全文主干，三章都要写成“问题-机制-边界-缺口” |
| 该删什么句子 | chronological summary；同一机制下重复的论文摘要句 |
| 该保留什么句子 | 机制类目定义句；跨论文综合句；边界和 open gap 句 |
| 不能改的点 | 不能让三章失衡成“一章很长，两章很短”；不能让某章变成单一领域综述 |

#### `\subsection{State Access and Scheduling}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 讲清楚 observability、locality、recovery/elasticity 的共同控制问题 |
| 该删什么句子 | 对 stream systems 的过长历史串讲；某一系统的具体调度策略细节；与 access cost 无关的泛化表述 |
| 该保留什么句子 | hotspot visibility、cost model、ownership/migration/recovery coupling |
| 改写模板 | 从“看见 contention”写到“如何依据 cost scheduling”，最后写“为什么 recovery/elasticity 不能分开治理”。 |
| 前后对照 | 修改前：“从系统 A 到系统 B 的演化。” 修改后：“从不可见 contention 到可治理 state access 的机制演化。” |

#### `\subsubsection{From Invisible Contention to Observable State Access}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 单纯报告某系统减少 contention 的实验结果，但没有抽象出 observability seam |
| 该保留什么句子 | contention 从“现象”变成“可观测对象”的综合句 |

#### `\subsubsection{Cost Modeling Under Locality and Topology}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | NUMA、CPU、placement 的实现枝节 |
| 该保留什么句子 | locality/topology 改写 access cost 的边界句 |

#### `\subsubsection{Runtime Control, Recovery, and Stateful Governance}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | recovery 系统单独展开过长 |
| 该保留什么句子 | migration、replay、ownership transfer 本质上是同一治理问题 |

#### `\subsubsection{Open Challenges in Access Management}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 已在前文说过的挑战改写句 |
| 该保留什么句子 | 2-3 个最强缺口：typed observability、ownership contract、disturbance-aware control |

#### `\subsection{State-Aware Execution Optimization}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 证明“更快的局部执行”不等于“更好的 end-to-end service” |
| 该删什么句子 | 大段硬件或系统清单；每个 serving paper 的细节比较 |
| 该保留什么句子 | representation、execution path、quality boundary、KV lifecycle、closed-loop control |
| 改写模板 | 先否定 naive kernel-speedup view，再按 representation / lifecycle / quality 写。 |
| 前后对照 | 修改前：“compression、KV、approximation 各讲一块。” 修改后：“都服务于 state-aware execution 的统一边界问题。” |

#### `\subsubsection{Why Faster Kernels Do Not Guarantee Better Services}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 重复证明“局部优化不等于系统收益”的例子 |
| 该保留什么句子 | 这是整章总论点，必须保留清晰总括句 |

#### `\subsubsection{Energy, Compression, and Stateful Data Paths}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 某压缩框架的具体算子流程 |
| 该保留什么句子 | representation 决策如何改变 execution path 和 service boundary |

#### `\subsubsection{KV-Cache Management as a State-Execution Problem}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 长篇罗列 paged attention、Sarathi、SGLang、Prism、Jenga 等系统各自细节 |
| 该保留什么句子 | KV state 的 admit/place/mutate/transfer/reclaim 生命周期；phase-aware serving 的核心控制问题 |
| 前后对照 | 修改前：“LLM serving 文献清单。” 修改后：“短生命周期 state 的统一治理案例。” |

#### `\subsubsection{Approximation and Quality Boundaries}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | approximation 方法学细节 |
| 该保留什么句子 | 质量边界如何成为 stateful execution 的一部分 |

#### `\subsubsection{Toward Closed-Loop Execution Control}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 已在前几小节解释过的案例 |
| 该保留什么句子 | 为什么 execution control 需要与 telemetry、quality、movement 一起闭环 |

#### `\subsection{State Evolution and Reuse}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 把 update、retention、retrieval、reuse 统一为长期 state lifecycle |
| 该删什么句子 | 模型效果导向但不暴露 runtime state control 的描述 |
| 该保留什么句子 | budget、freshness、maintenance debt、reuse value、exposure policy |
| 改写模板 | 从更新压力写到 retention/budget，再写 retrieval/structured memory，最后回到与 access/execution 的桥接。 |

#### `\subsubsection{From Updates to Long-Horizon Memory}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | “memory 很重要”的泛化句 |
| 该保留什么句子 | 为什么 update 不是 isolated write，而是长期复用控制问题 |

#### `\subsubsection{Memory Budgets, Retention, and Sample Selection}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | continual learning 算法细节 |
| 该保留什么句子 | retention budget 与 future reuse value 的治理关系 |

#### `\subsubsection{Structured Memory and Dynamic Retrieval}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | RAG / ANN / planner papers 逐篇摘要 |
| 该保留什么句子 | freshness、index maintenance、exposure safety、planner-visible memory control |
| 前后对照 | 修改前：“retrieval memory 相关论文串讲。” 修改后：“动态 memory layer 的生命周期治理综合。” |

#### `\subsubsection{Bridging Evolution with Access and Execution}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 只在重复说三轴相关联 |
| 该保留什么句子 | evolution 选择如何反过来改写 access pressure 与 execution boundary |

#### `\subsection{Quantitative Propagation Trace: A Worked Example}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 正文中只留“一句解释 + 指向增刊” |
| 该删什么句子 | 详细 trace、公式、过程推导 |
| 该保留什么句子 | 为什么 propagation 不是修辞而是可分析的 |
| 处理方式 | 全量移至增刊 |

### 4.4 Comparative Synthesis Across Domains

#### `\section{Comparative Synthesis Across Domains}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 不再重复前文，而是提炼共同控制问题 |
| 该删什么句子 | 按领域再复述一遍前面三章内容 |
| 该保留什么句子 | 哪些机制在跨域可转移；哪些边界不可忽视 |
| 不能改的点 | 不能删掉 cross-domain synthesis 整章 |

#### `\subsection{Comparative Criteria and Integration Principles}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 前文已定义过的 taxonomy 句 |
| 该保留什么句子 | 为什么这套 comparative criteria 足以连接不同领域 |

#### `\subsection{Cross-Domain Comparative Synthesis}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 域内文献逐条重述 |
| 该保留什么句子 | “ownership / movement / lifecycle / maintenance debt” 这类跨域机制关键词 |
| 改写模板 | 每个域只保留 1 段：代表对象、代表机制、代表边界、代表缺口。 |

#### 各个域内 `\subsubsection{...}`

统一改写约束：

1. 每个域内小节控制在 1 段到 2 段。
2. 只保留代表性机制，不保留长清单。
3. 每节末尾必须有一句“该域对全文主论点贡献了什么”。

#### `\subsubsection{Comparative Mechanism Matrices}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 正文不保留全量矩阵 |
| 该删什么句子 | 对矩阵每一列的逐列解释 |
| 该保留什么句子 | “详见增刊矩阵；正文这里只保留最小摘要结论” |
| 处理方式 | 全量矩阵移至增刊，正文只保留极简摘要表或一句话总结 |

### 4.5 Design Implications for Stateful Runtimes

#### `\section{Design Implications for Stateful Runtimes}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 把综述结果提升为设计原则、反模式和蓝图 |
| 该删什么句子 | 再次复述文献事实，而不产出设计含义的句子 |
| 该保留什么句子 | principle、anti-pattern、contract、blueprint 的综合句 |

#### `\subsection{Cross-Cutting Design Principles}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 每条原则后跟太长的文献例子 |
| 该保留什么句子 | 四条原则的定义句与边界句 |
| 改写模板 | 每条原则 3-5 句即可：原则是什么、为何需要、主要风险是什么。 |

#### `\subsection{A Design Space for Stateful Runtime Architectures}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 各维度的长篇工程案例 |
| 该保留什么句子 | 维度定义、取舍边界、和本文三轴的对应关系 |

#### `\subsection{Failure Modes and Anti-Patterns}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 每个 anti-pattern 后跟多个重复案例 |
| 该保留什么句子 | anti-pattern 的抽象定义、为何常见、缺失了哪类 contract |
| 前后对照 | 修改前：“一个 anti-pattern 配很多实例。” 修改后：“一个 anti-pattern 配一句代表性例证和一句 contract repair。” |

#### `\subsection{A Contract-Oriented Blueprint for Stateful Runtimes}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | blueprint 的长版前提铺垫、状态机式细推导 |
| 该保留什么句子 | 五层 blueprint、contract flow、为什么现有系统还未闭环 |
| 改写模板 | 先声明这是 conceptual reference model，再用 5 层快速展开。 |
| 不能改的点 | 不能删 blueprint，因为这是全文最有原创收束力的部分 |

#### `\subsection{Cross-Domain Case Studies}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 正文中不展开 |
| 该删什么句子 | 三个 case study 的完整叙事 |
| 该保留什么句子 | 若需要，只留一句“增刊展示三个代表 case study” |
| 处理方式 | 整体下沉到增刊 |

### 4.6 Evaluation and Research Outlook

#### `\section{Evaluation and Research Outlook}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 给出统一评估语言和研究方向，不再补充综述主体内容 |
| 该删什么句子 | 与前文重复的机制综述句 |
| 该保留什么句子 | disturbance-oriented evaluation、四类评估维度、四个 forward pressure points |

#### `\subsection{Evaluation Dimensions for Future Surveys and Systems}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 每个指标的长解释；某类论文常见实验套路的细节枚举 |
| 该保留什么句子 | steady-state efficiency、tail behavior、state quality、operational sustainability |

#### `\subsection{An Integrated Research Agenda}`

| 项 | 内容 |
| --- | --- |
| 该删什么句子 | 扩张成“什么都值得做”的研究列表 |
| 该保留什么句子 | unified state observability、state-centric scheduling、memory middleware、end-to-end evaluation |
| 改写模板 | 每个 pressure point 1 段，结构统一：缺什么、为什么现在缺、下一步需要什么 contract。 |

### 4.7 Conclusion

#### `\section{Conclusion}`

| 项 | 内容 |
| --- | --- |
| 主要任务 | 用半页左右收束全文 |
| 该删什么句子 | 重新讲一遍各章节；新增 future work 列表 |
| 该保留什么句子 | 主论点、主框架、主缺口、判断标准 |
| 前后对照 | 修改前：“长总结。” 修改后：“简短结论 + 判断标准。” |

---

## 5. 逐小节的“前后对照”压缩模板

### 模板 A：论文罗列段改成机制综合段

- 修改前：
  - `System A does ...`
  - `System B improves ...`
  - `System C further reduces ...`
- 修改后：
  - `These systems treat <state object> as a runtime-managed object and expose <control surface>; they differ mainly in how they price <coupling path> and which <evaluation boundary> they protect.`

### 模板 B：长背景段改成边界说明段

- 修改前：
  - 长篇介绍某个相邻领域的发展、代表论文、历史上下文
- 修改后：
  - `This literature is relevant here only because it exposes <specific state seam>; beyond that boundary, it remains contextual rather than analytical core evidence.`

### 模板 C：长案例段改成正文一句 + 增刊指针

- 修改前：
  - 2-3 段完整叙述一个 case study
- 修改后：
  - `A detailed disturbance trace appears in the supplement; here we retain only the systems lesson: <one-sentence lesson>.`

### 模板 D：图重复解释改成图服务论点

- 修改前：
  - 正文把图中元素逐个复述一遍
- 修改后：
  - `Figure X is used only to make one claim visible: <claim>.`

---

## 6. 统一前后对照表（实际改稿时逐步填充）

说明：

1. 这张表不是现在一次性写完，而是**每次实际改写 `main.tex` 后立即补一行**。
2. 一行对应一个“可检查的改动单元”，建议粒度为：`1 个 subsection` 或 `1 组相邻自然段`。
3. “修改前摘要”不是粘全文，而是概括原段功能和主要问题。
4. “修改后摘要”写成改后的论证功能，不写成流水账。
5. 如果某部分整体下沉到增刊，也在表里登记，便于团队追踪。

### 6.1 对照表字段说明

| 列名 | 填写要求 |
| --- | --- |
| 状态 | `未开始 / 进行中 / 已完成 / 已下沉增刊` |
| 章节 | 对应 `main.tex` 的 section 名 |
| 小节 | 对应 `main.tex` 的 subsection / subsubsection 名；若无则写“全节” |
| 位置 | 可写行号范围、段落标识，或“本节前两段”这类稳定定位 |
| 修改前摘要 | 原文主要写了什么，主要问题是什么 |
| 主要问题 | 从“罗列过多 / 重复解释 / 背景过长 / 脱离主论点 / 图文重复 / 应下沉增刊”中选 1-3 个 |
| 修改动作 | `压缩 / 合并 / 重写 / 下沉增刊 / 保留不动 / 改图注 / 缩表` |
| 修改后摘要 | 改完后这一段/节在正文中承担什么论证功能 |
| 保留内容 | 明确保留了哪些机制、论点、图、关键文献群 |
| 删除/下沉内容 | 明确删掉或移到增刊的内容 |
| 原因 | 为什么这么改，优先强调页数、论证性、避免重复、跨域综合等原因 |
| 边界约束 | 这次改动中哪些东西不能动 |
| 关联图表/矩阵 | 关联 `fig:*`、table、matrix 名称；若无写 `无` |
| 目标页数影响 | 预期减少或增加多少正文篇幅，可写“约 -0.3 页” |
| 实际结果 | 改完后再填：是否达到预期、是否还需二次压缩 |
| 负责人 | 谁改的 |
| 日期 | 修改日期 |

### 6.2 前后对照总表

| 状态 | 章节 | 小节 | 位置 | 修改前摘要 | 主要问题 | 修改动作 | 修改后摘要 | 保留内容 | 删除/下沉内容 | 原因 | 边界约束 | 关联图表/矩阵 | 目标页数影响 | 实际结果 | 负责人 | 日期 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 已完成 | Introduction | 全节 | `main.tex` 引言前 6 段 | 原文用 5 类系统分别举例，场景与 state object 列举较密；贡献段也有少量重复强调 | 罗列过多、背景过长 | 压缩 + 合并 | 改为 3 个代表场景，并在段末统一收束到“governable state”这一共同问题；贡献段收紧为一组清晰判断 | 三轴入口、propagation view、contribution paragraph、`fig:propagation` | edge analytics 的细例、重复的对象列举 | 强化开篇论证并减少页数，同时不牺牲跨域广度 | 保留三轴、propagation view、contribution paragraph | `fig:propagation` | 约 -0.3 至 -0.4 页 | 已完成第一轮压缩，后续仍可结合整稿再压一轮 | Codex | 2026-06-28 |
| 已完成 | Foundations: Scope, Model, and Taxonomy | Survey Protocol and Evidence Posture | `main.tex` 对应 3 段 | 原文已较紧凑，但与前文 scope 有轻微重复 | 轻微重复 | 轻压缩 | 保留 comparative protocol、stable venue、evidence posture 三层结构 | evidence posture 与选文合法性 | 无实质下沉，仅收紧表达 | 这一节本来就是方法合法性来源，不宜重写过多 | 保留 evidence posture 与选文合法性 | 无 | 约 0 页 | 已完成轻量收紧，暂不继续压 | Codex | 2026-06-28 |
| 已完成 | Foundations: Scope, Model, and Taxonomy | Positioning Relative to Existing Surveys | `main.tex` 对应整节 | 原文先逐篇 survey 介绍，再展开差异，篇幅偏长 | 背景过长、罗列过多 | 压缩 + 合并 | 改为“已有 survey 覆盖哪些切片，我们的 comparison unit 为何不同”的集中说明，并把 storage/cache survey 压成边界案例 | 与已有 survey 的差异定位、cross-domain ambition | 各类 survey 的长篇逐一展开 | 防止这一节变成 related-work mini survey | 保留与已有 survey 的差异定位 | 无 | 约 -0.2 至 -0.3 页 | 已完成第一轮压缩 | Codex | 2026-06-28 |
| 已完成 | Foundations: Scope, Model, and Taxonomy | Broader Literature Landscape | `main.tex` 五个子小节 | 原文每个传统都带较多具体系统，容易膨胀成 literature tour | 背景过长、罗列过多 | 压缩 + 合并 | 改成“每个传统暴露了什么 runtime seam”的短版边界说明 | 四类主传统与 analytical boundary | 部分系统级长列举 | 收紧背景，让后文三轴成为主舞台 | 只保留边界说明，不删跨域合法性 | 无 | 约 -0.4 至 -0.6 页 | 已完成第一轮压缩，后续如版面仍紧张可继续减引 | Codex | 2026-06-28 |
| 已完成 | Foundations: Scope, Model, and Taxonomy | System Model: Where State Lives in a Runtime | `main.tex` 对应整节 | 原文模型完整，但对“何为 managed state”的定义在正文和 keybox 中重复出现 | 重复解释 | 压缩 + 合并 | 保留 runtime tuple、代表性 system classes 和多形态 state 定义，同时把重复的三条件定义收束为指向 keybox 的一句话 | state 在 runtime 中的统一模型、`tab:state-system-model`、formal sketch | 重复展开的 managed-state 三条件解释 | 减少重复而不动正文底座 | 保留 state 在 runtime 中的统一模型 | `tab:state-system-model` | 约 -0.2 至 -0.3 页 | 已完成第一轮压缩 | Codex | 2026-06-28 |
| 已完成 | Foundations: Scope, Model, and Taxonomy | A Unifying View of Stateful Computing Systems | `main.tex` 对应整节 | 原文定义充分，但“什么是 state”“为什么会传播”两部分有可压缩空间，且与前文 system model 有少量功能重叠 | 重复解释、背景略长 | 压缩 + 合并 | 保留 persistent/semi-persistent state 定义与 propagation 视角，把跨层传播逻辑压成更紧凑的两段 + 一组公式/box | state 定义、propagation 视角、公式、keybox | 过细的例子和重复的层间解释 | 收紧 Foundations 末端，避免进入 Core Dimensions 前过度铺垫 | 保留 propagation 作为全文统一分析框架 | keybox | 约 -0.2 页 | 已完成第一轮压缩 | Codex | 2026-06-28 |
| 已完成 | Foundations: Scope, Model, and Taxonomy | Taxonomy of State Management Problems | `main.tex` taxonomy 主段 + scaffold + classes | 原文 taxonomy、scaffold、classes 三块都对，但段间略分散，classes 稍长 | 轻微重复、篇幅偏散 | 压缩 + 合并 | 把 taxonomy 收束为“按控制问题而非按应用标签分类”，保留五元框架与代表类目，但减少解释冗余 | `tab:taxonomy`、五元框架、`tab:scaffold`、representative classes、`fig:poster-overview` | taxonomy 与 classes 间的重复展开 | 让 Foundations 以更清晰的分类合同结束 | 保留三轴 taxonomy、五元 scaffold、代表 system classes | `tab:taxonomy`, `tab:scaffold`, `fig:poster-overview` | 约 -0.2 至 -0.3 页 | 已完成第一轮压缩；代表类目后续如仍超页可再减 | Codex | 2026-06-28 |
| 已完成 | Core Dimensions of State Management | State Access and Scheduling | `main.tex` 对应整节 | 原文机制很全，但长系统串讲明显，尤其 recovery / governance 段列举过密 | 罗列过多、背景过长 | 压缩 + 合并 | 保留 observability、cost surface、ownership-transfer contract、open challenges 四条主线，把大量系统压成机制簇 | `fig:access-designspace`、ownership-transfer contract、open challenges | workflow / checkpoint / serving scheduler 的长列表化展开 | 这一节应呈现“访问治理问题”，而不是跨多个社区的 literature tour | 保留 observability/locality/recovery/ownership 主线 | `fig:access-designspace` | 约 -0.7 至 -1.0 页 | 已完成第一轮压缩；后续可继续减引用密度 | Codex | 2026-06-28 |
| 已完成 | Core Dimensions of State Management | State-Aware Execution Optimization | `main.tex` KV 与 execution 前半节 | 原文 KV 小节最强，但也最容易清单化；多组 serving papers 逐层展开过长 | 罗列过多、重复解释 | 压缩 + 合并 | 保留六类控制面：orchestration / layout / representation / tiering / disaggregation / sharing，并将系统归并到几簇机制中 | `fig:kvcache-lifecycle`、stateful data path、KV lifecycle closure gap | 多个 serving 系统的逐篇历史叙述 | 强化“KV cache 是 state-management problem”这一主论点，同时节省页数 | 保留 KV lifecycle、phase asymmetry、tiering、sharing 主线 | `fig:kvcache-lifecycle` | 约 -0.8 至 -1.1 页 | 已完成第一轮压缩；后续需与整个 execution 节一起再看平衡 | Codex | 2026-06-28 |
| 已完成 | Core Dimensions of State Management | State Evolution and Reuse | `main.tex` structured memory + bridge + worked example 入口 | 原文 retrieval memory 小节文献很丰富，但容易变成 retrieval survey；worked example 过长 | 罗列过多、应下沉增刊 | 压缩 + 合并 + 下沉增刊 | 保留 memory middleware、retrieval policy、index structure、maintenance boundary 四条主线；worked example 改成正文短摘要 + 增刊指针 | `fig:retention-taxonomy`、memory middleware gap、worked-example 摘要 | retrieval 文献逐篇串讲、worked example 的长数字推导 | 避免 evolution 章被 retrieval 文献主导，并为增刊预留完整数值跟踪 | 保留 retrieval memory 作为 runtime substrate 的主论点 | `fig:retention-taxonomy` | 约 -0.9 至 -1.3 页 | 已完成第一轮压缩；后续若补增刊可直接迁走详细 trace | Codex | 2026-06-28 |
| 未开始 | Foundations: Scope, Model, and Taxonomy | A Unifying View of Stateful Computing Systems | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 保留 propagation 统一视角 | `fig:propagation` | 待填 | 待填 | 待填 | 待填 |
| 未开始 | Foundations: Scope, Model, and Taxonomy | Taxonomy of State Management Problems | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 保留三轴与五元框架 | taxonomy 列表/表 | 待填 | 待填 | 待填 | 待填 |
| 未开始 | Core Dimensions of State Management | State Access and Scheduling | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 保留 observability/locality/recovery 的主线 | `fig:access-designspace` | 待填 | 待填 | 待填 | 待填 |
| 未开始 | Core Dimensions of State Management | State-Aware Execution Optimization | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 保留 execution boundary 主线 | `fig:kvcache-lifecycle`, `fig:execution-seams` | 待填 | 待填 | 待填 | 待填 |
| 未开始 | Core Dimensions of State Management | State Evolution and Reuse | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 保留 update/retention/retrieval/reuse 主线 | `fig:retention-taxonomy`, `fig:memory-planes` | 待填 | 待填 | 待填 | 待填 |
| 未开始 | Core Dimensions of State Management | Quantitative Propagation Trace: A Worked Example | 待填 | 待填 | 待填 | 下沉增刊 | 待填 | 一句主结论 | 详细 trace 与推导 | 节省正文页数且不破坏主论证 | 正文至多保留一句入口 | 相关 worked-example 图 | 待填 | 待填 | 待填 | 待填 |
| 已完成 | Comparative Synthesis Across Domains | Comparative Criteria and Integration Principles | `main.tex:629-635` | 原文三段较长，重复解释“为什么要统一比较单位” | 与前文五元框架有轻度重复，入口过长 | 压缩为“三句话规则” | 仅保留共同比较单位、机制分组原则、证据层级 | 五元框架、机制分组、evidence hierarchy | 重复定义与铺垫性解释 | 入口应短而有力，避免再讲一遍 foundations | 只保留比较规则；不重新展开定义史 | `fig:cross-domain` | 约 -0.2 至 -0.3 页 | 已压缩 | Codex | 2026-06-28 |
| 已完成 | Comparative Synthesis Across Domains | Cross-Domain Comparative Synthesis | `main.tex:637-785` | 原文含较长逐域展开和多个跨域过渡段 | 逐域叙述偏长，部分小节仍有“压缩综述”气味 | 压缩为“主状态对象-成熟控制-核心缺口”主线 | 保留四域共同治理问题与跨域转移结论 | `fig:cross-domain`、`tab:comparison-guide`、四域核心结论 | 冗长域内铺陈、重复过渡 | 主文只保留可迁移结论；域内细节以后补充到增刊 | 可保留代表性机制；不能回到 paper-by-paper 展开 | `fig:cross-domain`, `tab:comparison-guide`, `fig:execution-seams`, `fig:memory-planes` | 约 -1.0 至 -1.5 页 | 已完成第一轮重压缩 | Codex | 2026-06-28 |
| 已完成 | Comparative Synthesis Across Domains | Comparative Mechanism Matrices | `main.tex:783-785` | 原文保留两张正文 longtable 大矩阵 | 极其占页，且主文论证收益低 | 正文改为一句“移入增刊”的说明 | 主文仅保留矩阵的比较结论 | 矩阵移入 supplement 的决策、简短结论 | `tab:large-matrix-a`, `tab:large-matrix-b` 全量内容 | 大矩阵更适合做参考层，不应压正文页数 | 正文不再保留全量矩阵 | `tab:large-matrix-a`, `tab:large-matrix-b` | 约 -2.0 至 -3.0 页 | 已从正文删除 | Codex | 2026-06-28 |
| 已完成 | Design Implications for Stateful Runtimes | Cross-Cutting Design Principles | `main.tex:860-895` | 原文四个原则各自偏长，例证较多 | 有部分和前文比较结论重复 | 每条原则压成“原则 + 为什么重要”两段式 | 保留四原则与 keybox 收束 | observation / state-object / closed-loop / boundary 四原则 | 过长例证串联 | 主文需要原则化收束而非再做文献展开 | 可举跨域例子；不能重回逐论文罗列 | `tab:design-guide`，keybox | 约 -0.3 至 -0.5 页 | 已压缩 | Codex | 2026-06-28 |
| 已完成 | Design Implications for Stateful Runtimes | A Design Space for Stateful Runtime Architectures | `main.tex:897-937` | 原文四个架构轴解释较长 | 设计空间解释偏细，案例略多 | 压成“一句定义 + 一句后果” | 保留四轴与 lifecycle state machine | granularity / coupling / lifecycle / boundary | 多余案例细节 | 设计空间要可审稿、可快速扫描 | 可保留状态机；不能加更多案例 | `fig:blueprint-flow`（间接关联） | 约 -0.3 至 -0.5 页 | 已压缩 | Codex | 2026-06-28 |
| 已完成 | Design Implications for Stateful Runtimes | Failure Modes and Anti-Patterns | `main.tex:939-980` | 原文已较聚焦 | 主要风险是继续膨胀为案例串讲 | 保留结构，基本不动主线 | 保留 anti-pattern -> missing contract 主线 | 五个 anti-pattern、小结、`fig:antipattern-map` | 无大删改，仅控制后续不扩写 | 这是最有审稿价值的综合部分之一 | 能补一两句收束；不能拉长成案例综述 | `fig:antipattern-map` | 0 至 -0.1 页 | 本轮仅复核通过 | Codex | 2026-06-28 |
| 已完成 | Design Implications for Stateful Runtimes | A Contract-Oriented Blueprint for Stateful Runtimes | `main.tex:982-1054` | 原文蓝图层次完整，但局部解释较细 | blueprint 层与 fault-model 说明偏长 | 保留五层与两张表，压缩层内解释 | 保留 blueprint 定位、五层、fault-model 提醒 | `fig:blueprint-flow`, `tab:antipattern-blueprint`, `tab:policy-skeleton` | 冗长层内展开 | blueprint 是全文综合产物，不能删主骨架 | 可短化解释；不能删五层或安全边界 | `fig:blueprint-flow`, `tab:antipattern-blueprint`, `tab:policy-skeleton` | 约 -0.2 至 -0.4 页 | 已完成第一轮压缩 | Codex | 2026-06-28 |
| 已完成 | Design Implications for Stateful Runtimes | Cross-Domain Case Studies | `main.tex:1056-1070` | 原文三个 case studies 仍有较完整展开 | 不应继续占主文空间 | 改为“正文入口 + 每案一句核心教训” | 保留三个场景与各自一句 contract lesson | 三个场景标题、每案一句主结论 | 详细场景展开移向 supplement | case study 只负责落地，不负责主论证扩展 | 正文只留高层 lessons；详细 walkthrough 下沉 | case-study 相关图表（未来增刊承接） | 约 -0.5 至 -0.8 页 | 已压缩成增刊入口式写法 | Codex | 2026-06-28 |
| 已完成 | Evaluation and Research Outlook | Evaluation Dimensions for Future Surveys and Systems | `main.tex:1103-1130` | 原文评估维度与解释稍长 | 评估文字若过长会拖慢结尾节奏 | 压成“四维度 + evidence ladder + protocol” | 保留统一评估语言与 disturbance protocol | 四维度、证据阶梯、`fig:disturbance-protocol` | 重复解释与跨域重述 | 结尾部分应更像规范总结而非再综述 | 可保留四维度；不能扩成指标大全 | `fig:disturbance-protocol` | 约 -0.2 至 -0.4 页 | 已压缩 | Codex | 2026-06-28 |
| 已完成 | Evaluation and Research Outlook | An Integrated Research Agenda | `main.tex:1131-1121` | 原文四个 pressure points 解释偏长 | 未来方向容易膨胀成愿望清单 | 压成“四个 contract-oriented pressure points” | 保留 observability / heterogeneous scheduling / memory middleware / end-to-end evaluation | 四个压力点标题及各自一句展开 | 过细论证与重复背景 | 研究议程要收束，不再铺开新文献综述 | 可保留四方向；不能扩写更多子方向 | 无 | 约 -0.2 至 -0.4 页 | 已压缩 | Codex | 2026-06-28 |
| 未开始 | Conclusion | 全节 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 待填 | 保留主论点、主框架、主缺口 | 无 | 待填 | 待填 | 待填 | 待填 |

### 6.3 填表示例

| 状态 | 章节 | 小节 | 位置 | 修改前摘要 | 主要问题 | 修改动作 | 修改后摘要 | 保留内容 | 删除/下沉内容 | 原因 | 边界约束 | 关联图表/矩阵 | 目标页数影响 | 实际结果 | 负责人 | 日期 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 示例 | Introduction | 全节 | 前两段 | 原文用 5 个应用场景分别举例，系统名和 state object 列举较长 | 罗列过多、背景过长 | 压缩 + 合并 | 改为 3 个代表场景，并在段末统一收束到“governable state”这一共同问题 | 三轴入口、propagation view、贡献段 | 额外的 edge / RAG 细例可移到增刊或后文 | 强化开篇论证、减少页数 | 不删三轴与贡献段 | `fig:propagation` | 约 -0.4 页 | 待填 | 待填 | 待填 |

---

## 7. 推荐执行顺序

1. 先改 `Introduction` 和 `Foundations`，把全文骨架压实。
2. 再改三大主干章，确保每章都只有“机制综合 + 边界差异 + open gap”。
3. 然后处理 `Comparative Synthesis` 和 `Design Implications`，把大表和案例下沉。
4. 最后改 `Evaluation` 和 `Conclusion`，确保收束有力。
5. 全文编译后以页数为硬约束做第二轮删改。

---

## 8. 最终验收标准

1. 正文可独立阅读，不看增刊也能理解问题、框架、比较与结论。
2. 增刊可恢复完整性，所有下沉内容都能在补充材料中找到。
3. 正文页数可控，references 计入后仍能压到 35 页内。
4. 正文语气保持论证性，而不是读书笔记式总结。
5. 每个小节都能明确回答：state object、control surface、coupling path、evaluation boundary、remaining gap。

---

## 9. Repository Constraint Alignment

This plan is not the only source of truth. All future edits to `main.tex` should also be checked against:

1. [README.md](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\README.md)
2. [HANDOFF.md](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\HANDOFF.md)
3. [WRITING_FRAMEWORK.md](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\WRITING_FRAMEWORK.md)
4. [LITERATURE_MATRIX.md](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\LITERATURE_MATRIX.md)
These repository files impose the following non-optional constraints:

1. Preserve the existing manuscript spine unless a literature cluster truly cannot fit.
2. Keep the survey mechanism-centered rather than chronology-centered.
3. Keep the five-field analytical frame visible:
   - state object
   - control surface
   - coupling path
   - evaluation boundary
   - remaining gap
4. Treat subsection-sized clusters as the right unit of work.
5. Avoid paper-by-paper summary prose.
6. Ensure each important subsection still approximates:
   - an opening control-problem paragraph
   - a synthesis paragraph
   - a comparison or tradeoff paragraph
   - a closing open-gap paragraph
7. If a new cluster is added or a cluster is materially reclassified, check whether the relevant entries in `LITERATURE_MATRIX.md` still match the target subsection.

### 9.1 Compliance Review Of Work Already Done

Completed so far:

1. `Introduction`
2. `Foundations`
3. `Core Dimensions` first-round compression

What is already aligned with repository rules:

1. The existing section spine was preserved.
2. No new top-level sections were introduced.
3. Rewrites were local to existing subsections.
4. The manuscript moved away from paper listing and toward mechanism grouping.
5. The three-axis structure was preserved.
6. The five-field frame remained visible.

What still needs attention in later rounds:

1. `KV-Cache Management as a State-Execution Problem` still has relatively high citation density.
2. `Structured Memory and Dynamic Retrieval` still risks reading like a compressed retrieval survey if not tightened again later.
3. The current work is only a first-round compression; compile, warnings, and final page-budget checks still remain.
4. The worked example has been shortened in the main text, and its supplement-side landing place has now been created explicitly.

### 9.3 Actual Downshift Audit Filled After the 35-Page Pass

The rows below backfill the unified before/after table with the material that was actually pushed out of the main paper during the final CSUR-compliance pass. They do not replace the earlier planning rows; they record the final realized state after the main paper reached `35` pages and the supplement became the evidence landing zone.

| 状态 | 章节 | 小节 | 位置 | 修改前摘要 | 主要问题 | 修改动作 | 修改后摘要 | 保留内容 | 删除/下沉内容 | 原因 | 边界约束 | 关联图表/矩阵 | 目标页数影响 | 实际结果 | 负责人 | 日期 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 已下沉增刊 | Comparative Synthesis Across Domains | Cross-Domain Comparative Synthesis | `main.tex:604-606` + `supplement_sections/extended_comparative_evidence.tex` | 正文曾保留 cross-domain 视觉 reading key 与 compact comparison guide | 视觉证据占版面，且与正文跨域结论存在部分重复 | 正文改为简短桥接；图和 compact guide table 恢复到增刊 | 正文只保留“四类 recurring seams + transfer lesson”；增刊保留 visual/table reading key 供审计 | 四域共同治理问题与跨域可迁移结论 | `fig:cross-domain`、`tab:comparison-guide` 的完整视觉化承接 | 回收正文版面，同时保留跨域 synthesis 的可审计性 | 不能让主文失去跨域论证；只能下沉视觉 reading key，不能下沉结论本身 | `fig:cross-domain`, `tab:comparison-guide` | 约 -0.3 至 -0.6 页 | 已完成；主文失效引用已修复，增刊已补回图与表 | Codex | 2026-06-28 |
| 已下沉增刊 | Core Dimensions of State Management | State Access and Scheduling | `supplement_sections/extended_domain_notes.tex` | access 章原有 design-space 图，用于显式展示 observability/locality/ownership/recovery 的耦合 | 图对理解有帮助，但正文可用 prose 保持论证，不必继续占页 | 图从主文移出，增刊新增 access-designspace 落点与解释段 | 正文保留 ownership-transfer 和 observability 主线；增刊保留完整 visual map | observability/locality/recovery/ownership 主线 | `fig:access-designspace` 的整图与延展解释 | 图面回收优先于进一步砍 prose，可更稳地保住正文论证 | 不能削弱 access 章的 control-problem spine；只能移图，不能移主张 | `fig:access-designspace` | 约 -0.2 至 -0.4 页 | 已完成；增刊现已显式承接该图及其比较意义 | Codex | 2026-06-28 |
| 已下沉增刊 | Core Dimensions of State Management | State-Aware Execution Optimization | `main.tex:525` + `supplement_sections/extended_domain_notes.tex` | execution 章原保留 KV lifecycle 图与较长阶段解释 | 生命周期图和阶段说明占用版面，正文已能保留 lifecycle-closure 结论 | 正文保留一句 lifecycle-closure bridge；图与 fuller stage explanation 移入增刊 | 正文只保留“KV cache is a state-management problem”与 lifecycle closure gap；增刊保留 stage map | KV lifecycle、phase asymmetry、tiering、sharing 主线 | `fig:kvcache-lifecycle` 的整图和阶段展开 | 用图下沉换正文页数，同时避免重新大改高密 prose | 不能损害 execution 章的核心主张；只能移除图和较长阶段解释 | `fig:kvcache-lifecycle` | 约 -0.2 至 -0.4 页 | 已完成；增刊现已恢复 lifecycle 图并解释 admit/place/share/reclaim/transfer/restore | Codex | 2026-06-28 |
| 已下沉增刊 | Core Dimensions of State Management | State Evolution and Reuse | `main.tex:563-569` + `supplement_sections/extended_domain_notes.tex` | evolution 章原保留 retention taxonomy 图，用于说明 bounded-store governance 的动作谱系 | taxonomy 图重要但占版面，正文主张可由 prose 保留 | 正文保留 retrieval/retention contract 主线；taxonomy 图与 fuller action map 移入增刊 | 正文强调 middleware closure 与 retention-store contract；增刊保留 action taxonomy | update/retention/retrieval/reuse 主线 | `fig:retention-taxonomy` 的完整图与动作解释 | 用视觉下沉换页数，同时保住 evolution 不退化为单域 survey | 不能删除 retention contract 主张；只能把 taxonomy 视觉和细动作解释转增刊 | `fig:retention-taxonomy` | 约 -0.2 至 -0.4 页 | 已完成；增刊现已显式承接 protect/admit/replay/compress/demote/budget shrink | Codex | 2026-06-28 |
| 已下沉增刊 | Foundations / Narrative Scaffolding | Overview and Running Examples | `supplement_sections/extended_domain_notes.tex` | 早期版本保留 poster overview 与 running examples 图，用于帮助读者建立全文地图 | 视觉导览 helpful 但不是 35 页主文闭环所必需 | 最终达标轮优先移图，正文改靠 prose 维持叙事连续性 | 正文保留 examples in prose；增刊保留结构地图和 example triptych | survey spine、three running examples 的叙事作用 | `fig:poster-overview`, `fig:running-examples` | 这类“导航图”最适合进 supplement，不影响主文论证性 | 不能让全文失去 narrative continuity；正文必须仍可独立阅读 | `fig:poster-overview`, `fig:running-examples` | 约 -0.3 至 -0.6 页 | 已完成；增刊现在保留两张图并解释其用途 | Codex | 2026-06-28 |
| 已完成 | Core Dimensions of State Management | Quantitative Propagation Trace: A Worked Example | `main.tex:584-587` + `supplement_sections/extended_worked_example.tex` | worked example 原本更长，含数值 trace 与传播链条 | 长 trace 对主文性价比低，但对审计性重要 | 正文压成 summary + systems lesson；增刊承担完整 trace | 正文只保留五元摘要与“eviction debt should be charged to future reuse loss”的结论；增刊保留完整演绎 | access-execution-evolution 耦合主结论 | 详细数值推导、extended branches | 兼顾严谨性与 CSUR 页数限制 | 不能让主文只剩空指针；必须保留可自洽的 summary argument | worked example trace | 约 -0.6 至 -1.0 页 | 已完成；增刊已形成真实 landing zone | Codex | 2026-06-28 |

### 9.4 Missing-Content Audit After Compression from 83 Pages

From the current `35`-page main paper plus supplement structure, the compression appears to have removed presentation weight much more than argumentative coverage. The main conceptual risks were:

1. access design-space becoming under-motivated after figure removal;
2. KV lifecycle closure losing its stage structure after figure removal;
3. retention governance looking too abstract after taxonomy removal;
4. cross-domain synthesis losing its reading key after the visual/table downshift;
5. the survey spine and running examples becoming harder to reconstruct after navigation-figure removal.

Those risks are now addressed by explicit supplement landing zones in:

1. `supplement_sections/extended_domain_notes.tex`
2. `supplement_sections/extended_comparative_evidence.tex`
3. `supplement_sections/extended_worked_example.tex`

The remaining compression risk is no longer a missing major topic; it is stylistic density in a few main-text subsections, especially:

1. `KV-Cache Management as a State-Execution Problem`
2. `Structured Memory and Dynamic Retrieval`

So the current judgment is that the manuscript has not obviously lost a major intended concept from the original `83`-page draft, but the supplement must continue to be treated as a structured evidence archive whenever further main-text cuts are made.

### 9.2 Additional Checks For Every Next Round

Before and after each future edit, check:

1. Does this subsection still answer the five-field analytical frame?
2. Does the prose still sound like synthesis rather than integrated paper listing?
3. If a dense citation block remains, is each citation necessary for the mechanism grouping?
4. If a new comparative claim is introduced, is the supporting literature already reflected in `LITERATURE_MATRIX.md`?
