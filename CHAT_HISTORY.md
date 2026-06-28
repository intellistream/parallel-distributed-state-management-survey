# 聊天历史记录

说明：这份文件用于记录本线程与 CSUR 重构直接相关的关键对话、决策、约束和后续执行规则。

## 会话规则

1. 后续继续推进本项目时，优先先阅读本文件，再继续修改计划或正文。
2. 每次有新的重要决策、边界变更、执行顺序调整，都要同步追加到本文件。
3. 本文件记录“关键内容摘要”，不是逐字转录。
4. 若后续发生上下文压缩或长时间中断，恢复工作前应先回看本文件与 [CSUR_RESTRUCTURE_PLAN.md](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\CSUR_RESTRUCTURE_PLAN.md)。

## 当前项目背景

- 目标投稿：ACM Computing Surveys (CSUR)。
- 用户确认的版面要求：Long survey papers 不超过 35 页，且包括 references。
- 当前稿件状态：约 83 页，明显超限。
- 当前主稿文件：[main.tex](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\main.tex)。

## 关键决策摘要

### 2026-06-27：总体重构方向

- 不能直接以 83 页主稿投稿，存在 excessive length 风险。
- 最优方案不是“小修小补地删几页”，而是重构成：
  - `35 页内正文（含 references）`
  - `electronic supplement / 增刊` 承接扩展证据
- 正文负责：
  - 主论点
  - 三轴结构
  - 五元分析框架
  - 跨域综合
  - 设计含义
  - 评估与研究议程
- 增刊负责：
  - 全量矩阵
  - 长案例
  - worked example
  - 扩展 literature landscape
  - 更完整的系统级对照与证据

### 2026-06-27：关于参考文献的决定

- 用户明确要求：参考文献不要随意丢。
- 处理原则不是“删 bib”，而是：
  - 保留 `refs.bib`
  - 正文只引用支撑主论证所必需的文献
  - 更多背景引用、边界文献、扩展证据可在增刊中继续引用

### 2026-06-27：正文写作原则

- 正文必须保持论证性，而不是论文摘要拼接。
- 正文只保留以下主链：
  - `state object`
  - `control surface`
  - `coupling path`
  - `evaluation boundary`
  - `remaining gap`
- 不能删掉：
  - 三轴结构：`access / execution / evolution`
  - 五元分析框架
  - “state as a runtime control problem” 的总主张
  - cross-domain synthesis
  - blueprint
  - evaluation 章节

### 2026-06-27：图表与矩阵策略

- 正文应优先保留的图：
  - `fig:propagation`
  - `fig:access-designspace`
  - `fig:kvcache-lifecycle`
  - `fig:retention-taxonomy`
  - `fig:cross-domain`
  - `fig:memory-planes`
  - `fig:antipattern-map`
  - `fig:blueprint-flow`
  - `fig:disturbance-protocol`
- 可压缩保留：
  - `fig:poster-overview`
  - `fig:running-examples`
  - `fig:execution-seams`
- 建议下沉到增刊：
  - worked example 相关图
  - cross-domain case studies 相关图
  - 与正文核心图重复表达相同结论的补充图
- 正文不应保留全量机制矩阵；大矩阵整体下沉到增刊。

### 2026-06-27：章节级重构方向

- `Introduction`：保留，但压缩到 2-2.5 页。
- `Foundations`：保留为方法、范围、taxonomy 底座，但大幅压缩 literature landscape。
- 三个核心维度章：全部保留，作为正文主干。
- `Quantitative Propagation Trace`：建议下沉到增刊。
- `Comparative Mechanism Matrices`：建议下沉到增刊。
- `Cross-Domain Case Studies`：建议下沉到增刊。
- `Design Implications`：保留 principle + anti-pattern + blueprint 主线。
- `Evaluation and Research Outlook`：必须保留。

### 2026-06-27：用户新增要求

- 需要一份按章节按小节的具体修改方案。
- 需要：
  - `章节-小节-修改动作-目标页数` 四列表
  - 补充 `原因`、`重要性`、`边界约束`
  - 明确图保留哪些、矩阵保留哪些、优先级怎么排
- 之后进一步要求：
  - 把方案细化成直接对应 `main.tex` 的逐小节改写指令
  - 明确“该删哪类句子、该保留哪类句子”
  - 给出前后对照模板
  - 以上内容统一汇总进 `CSUR_RESTRUCTURE_PLAN.md`

### 2026-06-28：前后对照表的新要求

- 用户进一步要求：
  - “前后的对照”不要只放模板说明
  - 应改成**一张统一表**
  - 等后续实际逐步改写 `main.tex` 时，再把这张表逐行填起来
  - 这样方便团队成员统一对比“原文是什么、改成了什么、为什么改”
- 已据此在 `CSUR_RESTRUCTURE_PLAN.md` 中新增：
  - `统一前后对照表（实际改稿时逐步填充）`
  - 字段说明
  - 预置空表行
  - 一条填写示例

### 2026-06-28：开始按计划实际改稿

- 用户要求：接下来严格按照计划一步步开始改。
- 本轮首先执行：
  - `Introduction`
  - `Foundations`
- 本轮修改原则：
  - 先压缩最影响页数和论证骨架的部分
  - 先不动三轴结构、五元分析框架、propagation view
  - 同步填写 `CSUR_RESTRUCTURE_PLAN.md` 里的统一前后对照表
- 本轮已完成的方向：
  - `Introduction`：压缩场景罗列，收束到 3 个代表场景和共同控制问题
  - `Positioning Relative to Existing Surveys`：从逐篇 survey 介绍压成差异化定位
  - `Broader Literature Landscape`：从长背景收束为“每个传统暴露什么 runtime seam”
  - `System Model`：减少与 keybox 重复的 managed-state 三条件解释

### 2026-06-28：完成 `Foundations` 阶段第一轮压缩

- 本阶段继续完成：
  - `A Unifying View of Stateful Computing Systems`
  - `Taxonomy of State Management Problems`
- 本轮处理方式：
  - 压缩 “What Counts as State” 中的对象例举
  - 压缩 “Propagation Perspective” 中的重复层间解释
  - 将 taxonomy 收束为“按 control problem 分类”
  - 保留 `tab:taxonomy`、`tab:scaffold`、`fig:poster-overview`
- 阶段结果：
  - `Foundations` 现在更像“范围 + 方法 + 模型 + taxonomy 合同”
  - literature tour 味道减弱
  - 进入 `Core Dimensions` 前的铺垫更紧凑

### 2026-06-28：完成 `Core Dimensions` 第一轮压缩

- 本阶段处理重点：
  - `State Access and Scheduling`
  - `State-Aware Execution Optimization`
  - `State Evolution and Reuse`
  - `Quantitative Propagation Trace`
- 本轮主要动作：
  - 把 `Access` 章从跨社区长串讲压成 4 条主线：observability、cost surface、ownership-transfer contract、open challenges
  - 把 `KV-Cache Management` 小节改成按控制面归组，而不是按 serving 系统逐篇展开
  - 把 `Structured Memory and Dynamic Retrieval` 压成 memory substrate / middleware / index maintenance / maintenance debt 四条主线
  - 把 `Quantitative Propagation Trace` 改成正文短摘要，并明确更适合放到增刊
- 当前结果：
  - `Core Dimensions` 更接近“问题-机制-边界-缺口”的正文风格
  - retrieval 和 serving 部分的 literature-list 味道明显减弱
  - worked example 已不再占据主文大量空间

### 2026-06-28: Repository Constraint Recheck

- User reminder: repository `.md` files are themselves writing constraints and must be folded into the plan.
- Re-read and re-aligned with:
  - `README.md`
  - `HANDOFF.md`
  - `WRITING_FRAMEWORK.md`
  - `LITERATURE_MATRIX.md`
- Key conclusion:
  - future edits must be checked not only against `CSUR_RESTRUCTURE_PLAN.md`
  - but also against the repository's existing synthesis rules and cluster-oriented writing rules
- Clarification from user:
  - `CHAT_HISTORY.md` is for memory recovery and situational continuity
  - it should not be treated as a normative writing-constraint source
- Compliance review of completed edits:
  - overall direction is aligned with repository guidance
  - but `KV-Cache Management as a State-Execution Problem` and `Structured Memory and Dynamic Retrieval` still need another later pass to ensure they do not retain too much compressed-list flavor

## 当前已生成文档

- 重构总方案：
  - [CSUR_RESTRUCTURE_PLAN.md](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\CSUR_RESTRUCTURE_PLAN.md)
- 聊天历史记录：
  - [CHAT_HISTORY.md](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\CHAT_HISTORY.md)

## 后续建议执行顺序

1. 先用 `CSUR_RESTRUCTURE_PLAN.md` 对 `main.tex` 做逐节删改。
2. 先压 `Introduction` 和 `Foundations`。
3. 再改三大主干章，优先去掉 paper-by-paper 叙述。
4. 然后把 worked example、case studies、大矩阵下沉到增刊。
5. 编译后检查 references 占页，再进行第二轮压缩。

## 备注

- 这份文件记录的是“重要内容同步”。
- 后续如果我们继续推进 `main.tex` 的实际修改，应先更新这里的决策摘要，再继续实施。

### 2026-06-28：完成 `Comparative Synthesis` / `Design Implications` / `Evaluation` 第一轮重压缩

- 本轮开始前，已按用户要求重新阅读 `CHAT_HISTORY.md`，并再次核对：
  - `README.md`
  - `HANDOFF.md`
  - `WRITING_FRAMEWORK.md`
  - `LITERATURE_MATRIX.md`
- 本轮确认的约束继续成立：
  - `CHAT_HISTORY.md` 仅用于恢复记忆，不是写作规范来源
  - 仓库规范要求继续保持现有 spine，不回到 paper-by-paper 叙述
  - 每个重要 subsection 仍应尽量保持 control problem / synthesis / tradeoff / open gap 的结构

#### 本轮对 `main.tex` 的关键处理

- `Comparative Criteria and Integration Principles`
  - 压缩为更短的比较规则入口
  - 避免重复 foundations 中已经建立过的五元框架定义
- `Cross-Domain Comparative Synthesis`
  - 保留 `fig:cross-domain` 与 `tab:comparison-guide`
  - 将 `Streaming`、`Hardware-Conscious Execution`、`Retrieval / Retention` 压缩为“主状态对象-成熟控制-核心缺口”写法
  - 明显减少逐域长篇复述
- `Comparative Mechanism Matrices`
  - 将正文中的两张大 `longtable` 完全移除
  - 主文只保留一句“矩阵更适合进入 supplement”的说明
  - 这是本轮最主要的页数回收来源之一
- `Continual Learning and Retention Governance`
  - 从较长的 continual-learning 文献压缩综述，压成 retention-store governance 主线
  - 保留 protect / admit / replay / compress / budget shrink 的治理视角
- `Cross-Cutting Design Principles`
  - 四条原则整体保留，但各自压缩
  - 更突出原则性而非重复举例
- `A Design Space for Stateful Runtime Architectures`
  - 保留四个 design axes 和 lifecycle state machine
  - 压缩定义与案例细节
- `A Contract-Oriented Blueprint for Stateful Runtimes`
  - 保留 blueprint 主体、关键表和 safety envelope
  - 收紧层内解释，避免 blueprint 章节继续膨胀
- `Cross-Domain Case Studies`
  - 改成正文入口式写法
  - 每个 case 只保留一句核心 contract lesson
  - 详细 operational walkthrough 明确转向 supplement
- `Evaluation Dimensions for Future Surveys and Systems`
  - 压成四维度 + evidence ladder + disturbance protocol
- `An Integrated Research Agenda`
  - 压成四个 contract-oriented pressure points
  - 避免扩写成新的大段未来工作清单

#### 本轮整体结果

- `main.tex` 后半部分已经从“长篇跨域展开 + 正文矩阵 + 较完整 case studies”明显转向：
  - 主文保留跨域结论
  - 主文保留 design principles / anti-patterns / blueprint / evaluation spine
  - 大矩阵与详细 case-study 进一步明确为 supplement 承接对象

### 2026-06-28：第二轮硬压缩继续推进，主文从 40 页降到 37 页

- 恢复工作前再次按要求阅读 `CHAT_HISTORY.md`，并继续遵守：
  - 主文保留 thesis / three-axis spine / five-field frame
  - 参考文献不靠“删 bib”省页
  - 优先把解释性与审计性材料下沉到 supplement
- 本轮主要动作：
  - 继续压缩 `LLM Serving and Short-Lived Memory Lifecycles`
  - 继续压缩 `Retrieval Memory and Vector-Index State Layers`
  - 将 `An Integrated Research Agenda` 从 4 个展开小节压成单段 pressure-point 总结
  - 进一步压缩 `Conclusion`
  - 开始执行“删图优先”的最后压缩策略，移除主文中保留性价比较低但占页明显的图：
    - `fig:poster-overview`
    - `fig:running-examples`
    - `fig:execution-seams`
- 编译与页数结果：
  - 先从 `40` 页降到 `39` 页
  - 删图后主文进一步降到 `37` 页
  - `supplement.pdf` 维持可编译，当前为 `20` 页
- 当前判断：
  - 已经接近 CSUR `35` 页限制
  - 最后阶段应继续以“少动结构、优先回收版面”为原则
  - 下一步优先考虑再下沉一张非绝对核心主文图或进一步收紧局部图注/引导句，而不是回到大段文字重写

### 2026-06-28：完成达标轮压缩，主文正式压到 35 页

- 在继续推进前，再次按要求阅读了 `CHAT_HISTORY.md`
- 最后一轮采用的核心策略不是继续大段改写，而是“删图优先、只保留主链”
- 本轮实际执行的关键动作：
  - 下沉 `fig:poster-overview`
  - 下沉 `fig:running-examples`
  - 下沉 `fig:execution-seams`
  - 下沉 `fig:access-designspace`
  - 下沉 `fig:retention-taxonomy`
  - 下沉 `fig:cross-domain`
  - 下沉 `tab:comparison-guide`
  - 下沉 `fig:kvcache-lifecycle`
  - 对应地把主文中的引导句改成简洁的桥接或一句结论
  - 继续压缩 serving / retrieval / research-agenda / conclusion 的综合性 prose
- 页数轨迹：
  - `40 -> 39`
  - `39 -> 37`
  - `37 -> 36`
  - `36 -> 35`
- 当前编译结果：
  - `main.pdf = 35 pages`
  - `supplement.pdf = 20 pages`
  - 编译成功，无 hard error
  - 告警仍主要是字体、`Underfull/Overfull hbox` 和常规 BibTeX / TeX 告警
- 当前阶段性结论：
  - 主文已经达到 CSUR 的长文页数上限要求（含 references）
  - supplement 已从“计划”升级为真实承接正文下沉内容的结构化增刊
  - 后续工作重心应从“继续硬压页数”转向：
    - 校对主文与增刊之间的指向关系是否完整
    - 把这轮下沉出去的图表/说明更系统地补足到 supplement
    - 补更新 `CSUR_RESTRUCTURE_PLAN.md` 中的前后对照表
- `CSUR_RESTRUCTURE_PLAN.md` 已同步更新：
  - 统一前后对照表中，`Comparative Synthesis`、`Design Implications`、`Evaluation` 对应行已标为“已完成”
  - 已补充每项的修改动作、保留内容、删除/下沉内容、页数影响与原因

#### 当前仍需注意的后续风险

1. `LLM Serving and Short-Lived Memory Lifecycles` 仍然是后半部分最密、最长的域内小节之一，后续如总页数仍超限，这里仍是优先继续压缩的对象。
2. `Safety and Recovery Envelope` 仍然相对丰富，若后续需要再省页，可继续压缩 fault-model 说明。
3. 目前还没有正式构建 supplement 文档本体；只是主文中已经明确了哪些内容应下沉。
4. 还没有重新完整编译并核查实际页数、引用告警和最终 references 占页情况。

#### 建议的下一步

1. 先编译 `main.tex`，检查当前页数与是否存在新的格式/引用问题。
2. 如果仍明显超过 35 页：
   - 优先继续压 `LLM Serving...`
   - 其次压 `Blueprint` 局部说明
   - 再考虑进一步缩 `Evaluation`
3. 一旦主文页数逼近目标，开始正式落 supplement：
   - matrices
   - worked example
   - expanded case studies
   - expanded cross-domain evidence

### 2026-06-28：开始正式搭建 supplement 结构

- 用户要求：
  - 不仅要做 supplement 计划
  - 还要直接开始创建 `supplement.tex`
  - 并且把第一轮从主文压掉、应进入增刊的部分一起补进去
- 执行前，已再次按要求阅读：
  - `CHAT_HISTORY.md`
  - 并检查了 `main.tex` 前导、现有 figure 资源、仓库 md 约束

#### 本轮新增文件

- [supplement.tex](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\supplement.tex)
- [supplement_sections/extended_landscape.tex](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\supplement_sections\extended_landscape.tex)
- [supplement_sections/extended_worked_example.tex](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\supplement_sections\extended_worked_example.tex)
- [supplement_sections/extended_comparative_evidence.tex](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\supplement_sections\extended_comparative_evidence.tex)
- [supplement_sections/extended_case_studies.tex](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\supplement_sections\extended_case_studies.tex)
- [supplement_sections/extended_domain_notes.tex](C:\Users\peng\Documents\PHR\Intellistream\projects\parallel-distributed-state-management-survey\supplement_sections\extended_domain_notes.tex)

#### 本轮 supplement 已承接的内容

- 第一轮主文中被压缩的 broader literature landscape
- 第一轮主文中被压缩到摘要级别的 worked example / propagation trace
- 第一轮主文移除的大矩阵 landing zone
- 第一轮主文压缩后的 expanded cross-domain case studies
- 为后续第二轮主文硬压缩预留的 domain notes landing zone
  - 尤其是 serving lifecycle
  - blueprint / fault-model explanation
  - expanded foundations context

#### 当前状态含义

- supplement 已经不再只是计划，而是形成了真实的 tex 骨架和第一批正文
- 后续如果继续压主文，可以把更多 serving / blueprint / retrieval 细节有组织地下沉到这些 supplement section，而不是临时删除

#### 后续最合适的下一步

1. 编译 `supplement.tex`，确保结构与引用正常。
2. 再回到 `main.tex` 执行第二轮硬压缩，优先从：
   - `LLM Serving and Short-Lived Memory Lifecycles`
   - blueprint 层内说明
   - evaluation 收束段
3. 每压掉一块主文内容，都同步把对应证据补入 supplement 对应 section。
### 2026-06-28锛歵upplement 绗簩杞鏍稿拰琛ュ叏

- 鐢ㄦ埛鏄庣‘瑕佹眰锛?
  - 瑕佸叏闈㈠鏌ョ涓€杞富鏂囧垹鍑忕殑鍐呭鏄惁閮藉凡琚?supplement 鎵胯
  - 澧炲垔蹇呴』绗﹀悎 CSUR 琛ュ厖鏉愭枡閫昏緫鍜屼粨搴?md 鍐欎綔绾︽潫
  - 涓嶈兘鍙槸鍗犱綅绗︽垨鈥滄湭鏉ュ彲鏀惧叆鍐呭鈥濈殑璇存槑

- 鏈疆鎵ц鐨勫鏌ュ姩浣滐細
  - 鍐嶈 `CHAT_HISTORY.md` 鎭㈠涓婁笅鏂?
  - 鍐嶈 `README.md`銆乣HANDOFF.md`銆乣WRITING_FRAMEWORK.md`銆乣LITERATURE_MATRIX.md`
  - 鍐嶈 `CSUR_RESTRUCTURE_PLAN.md`銆乣CSUR_SUPPLEMENT_PLAN.md`
  - 瀵规瘮 `main.tex` 褰撳墠宸插帇缂╃殑灏忚妭涓?supplement_sections/*.tex` 鐨勬壙鎺ユ儏鍐?

- 瀹℃煡缁撹锛?
  - `extended_landscape`銆乣extended_worked_example`銆乣extended_comparative_evidence`銆乣extended_case_studies` 鏂瑰悜姝ｇ‘
  - 浣?`extended_domain_notes.tex` 鍦ㄦ湰杞墠杩樺お鍍忊€滄湭鏉ユ壙鎺ュ湴甯︹€濓紝鑰屼笉鏄湡姝ｇ殑琛ュ厖姝ｆ枃
  - serving lifecycle銆乺etrieval/retention 瑙﹀彂灞傜骇姣旇緝銆乥lueprint/fault-model 鐨勭涓€杞鍘嬫帀鍐呭杩樻病鏈夊厖鍒嗚惤鍦?

- 宸插湪 `supplement_sections/extended_domain_notes.tex` 涓ˉ鍏呯殑鍐呭锛?
  - serving-lifecycle 瀹炶川鎵╁睍锛?    - predictive / structural-reuse / temporal-lifecycle 涓夌被鏈哄埗鐨勫尯鍒?
    - 鏄庣‘鍚勭被绯荤粺鍦ㄧ煭鏈熺姸鎬佺敓鍛藉懆鏈熷摢涓樁娈典粙鍏?
  - retrieval and retention governance 鎵╁睍锛?    - 淇濈暀 retrieval 鍜?retention 涔嬮棿鐨勮Е鍙戝眰绾ф瘮杈?
    - 淇濈暀 exposure contract / maintenance debt / budget shrink 鐨勫師鎰?
  - blueprint and fault-model notes 鎵╁睍锛?    - 淇濈暀 crash-stop銆乧rash-recovery銆乶etwork partition銆乻ilent degradation 鐨勫尯鍒?
    - 淇濈暀 freshness exposure invariants 鍜?retention demotion invariants
  - foundations-boundary 鎵╁睍锛?    - 鏄庣‘ core / context 鍒嗙晫鐨勭悊鐢?

- 鍚屾鏇存柊锛?
  - `CSUR_SUPPLEMENT_PLAN.md` 鏂板浜?*Coverage Audit After First Supplement Draft*锛岃褰曠己鍙ｃ€佽ˉ鏁戝拰涓嬩竴姝ュ惈涔?

- 褰撳墠鎰忎箟锛?
  - supplement 宸蹭粠鈥滄湁楠ㄦ灦鈥濇洿杩戜竴姝ヨ蛋鍚戔€滃彲鐪熸鎵胯涓绘枃绗簩杞‖鍘嬬缉鈥?
  - 鍚庣画鍙互鏇村畨鍏ㄥ湴鍘?`LLM Serving and Short-Lived Memory Lifecycles`銆乺etrieval maintenance`銆乥lueprint` 鐨勫墿浣欓暱瑙ｉ噴
### 2026-06-28：补齐下沉图表、修主文桥接、回填对照表

- 本轮继续执行而不是停留在计划：
  - 检查主文里所有 “moved to supplement” 桥接是否完整
  - 把最后一轮达标压缩中真正移出的图表和解释系统补入增刊
  - 回填 `CSUR_RESTRUCTURE_PLAN.md` 的实际前后对照表，并做一轮“83 页是否有缺漏”的审计
- 先定位到一个明确问题：
  - `main.tex` 仍残留 `Table~\\ref{tab:comparison-guide}` 的正文引用
  - 但该表已经不在主文中
  - 处理方式：改成文本桥接，不再保留失效交叉引用
- `supplement_sections/extended_comparative_evidence.tex` 本轮补入：
  - `fig:cross-domain`
  - compact cross-domain reading-key table（作为原 `tab:comparison-guide` 的增刊承接）
  - 并明确它们的作用是让主文跨域 synthesis 可审计，而不是把主文重写一遍
- `supplement_sections/extended_domain_notes.tex` 本轮系统补入：
  - `fig:access-designspace`
  - `fig:kvcache-lifecycle`
  - `fig:retention-taxonomy`
  - `fig:poster-overview`
  - `fig:running-examples`
  - 同时为每张图补了“为什么正文可以不再占页，但增刊仍必须保留”的解释
- `CSUR_RESTRUCTURE_PLAN.md` 本轮补做两类回填：
  - 更新 worked example 的状态说明，不再写成“增刊落点尚未创建”
  - 新增一组 actual downshift audit，记录 final 35-page pass 中：
    - cross-domain 图表下沉
    - access design-space 下沉
    - KV lifecycle 图下沉
    - retention taxonomy 下沉
    - poster / running-examples 下沉
    - worked example 主文摘要化 + 增刊承接
- 对“83 页压到 35 页是否丢了东西”的当前判断：
  - 主要减少的是 presentation weight，而不是 argumentative coverage
  - 风险最大的几块现在都有了明确增刊落点：
    - access design-space
    - KV lifecycle
    - retention governance taxonomy
    - cross-domain reading key
    - survey spine / running examples
  - 因此当前不是“缺了某个大主题”，而是还需要继续盯住少数正文小节的风格密度
