# CSUR Supplement Plan

## 1. Purpose

This document defines how the current survey draft should be split into:

1. a CSUR-compliant main paper targeting `<= 35` pages including references
2. an electronic supplement that preserves completeness, traceability, and evidentiary depth

It follows the same repository constraints as the main manuscript:

- preserve the existing survey spine
- keep synthesis mechanism-centered rather than paper-by-paper
- preserve the five-field analytical frame:
  - state object
  - control surface
  - coupling path
  - evaluation boundary
  - remaining gap

The supplement is not a dump of leftovers. It must carry material that:

- strengthens the main paper's claims
- preserves rigorous evidence that would otherwise be lost
- remains organized by the same analytical frame

## 2. Current Compile Status

- Compile date: `2026-06-28`
- Main file: `main.tex`
- Compile tool: `tectonic`
- PDF produced successfully: `main.pdf`
- Current compiled page count: `60`

### Warning Summary

Current compile warnings are dominated by:

- non-fatal font lookup / glyph-name warnings
- `Underfull \hbox` formatting warnings
- BibTeX rerun notices

No hard compile failure was observed in this round.

## 3. Gap To CSUR Limit

- Current compiled length: `60` pages
- CSUR main-paper limit: `35` pages including references
- Required reduction: about `25` pages

This means the next stage cannot rely on local sentence trimming alone.

We need both:

1. second-round quantitative compression in the main paper
2. explicit supplement landing zones for evidence-heavy material

## 4. Main-Paper Second-Round Compression Budget

The budget below is intentionally aggressive because the current gap is large.

| Section | Current status | Second-round target action | Estimated reduction |
| --- | --- | --- | --- |
| Introduction | already compressed | only micro-trim if needed | `0-0.3` pp |
| Foundations | already compressed | only micro-trim if needed | `0-0.5` pp |
| Core Dimensions / Access | mostly acceptable | light trim only | `0-0.5` pp |
| Core Dimensions / Execution | still dense | tighten especially KV-cache survey spans | `1.0-2.0` pp |
| Core Dimensions / Evolution | still dense | tighten retrieval / retention spans | `0.8-1.5` pp |
| Quantitative Propagation Trace | already summary-level | keep only minimal pointer | `0-0.2` pp |
| Comparative Synthesis | already compressed once | second-round hard trim, especially serving | `2.0-3.5` pp |
| Design Implications | preserve spine, trim exposition | `1.5-2.5` pp |
| Blueprint subsection | preserve layers, trim explanatory surplus | included above |
| Cross-Domain Case Studies | already compressed | shrink to one-paragraph bridge if needed | `0.3-0.8` pp |
| Evaluation and Research Outlook | preserve structure, shorten discussion | `0.8-1.5` pp |
| References | not yet optimized structurally | some shrink may come only after citation trimming | uncertain |

### Hard Reality

Even with strong trimming above, prose compression alone is unlikely to recover the full `25` pages.

Therefore the practical path is:

1. keep compressing the main text
2. explicitly author the supplement so more evidence can be safely removed from the main paper in later passes

## 5. Main Text: Round-2 Priority Order

### P0

1. `LLM Serving and Short-Lived Memory Lifecycles`
2. `Structured Memory and Dynamic Retrieval` plus later retrieval-memory synthesis
3. `A Contract-Oriented Blueprint for Stateful Runtimes`
4. `Evaluation and Research Outlook`

### P1

1. `Continual Learning and Retention Governance`
2. `Cross-Domain Case Studies`
3. `KV-Cache Management as a State-Execution Problem`

### P2

1. `Introduction`
2. `Foundations`
3. anti-pattern section

## 6. Supplement Content Architecture

The supplement should mirror the main paper's logic rather than inventing a new one.

### S1. Extended Comparative Evidence

Purpose:
- preserve large-scale evidence behind cross-domain synthesis

Contents:
- full representative mechanism matrix
- full evaluation-and-gap matrix
- longer evidence notes for clusters compressed in main text

Source basis:
- the removed main-text matrices
- comparative paragraphs that were shortened in `Comparative Synthesis`

### S2. Extended Worked Example

Purpose:
- preserve the full propagation-trace style evidence

Contents:
- numerical propagation trace
- extended explanation of how local admission / eviction creates future debt
- optional extra figure if needed

Source basis:
- original worked-example material compressed from `Quantitative Propagation Trace`

### S3. Extended Cross-Domain Case Studies

Purpose:
- preserve deployment-shaped reasoning without burdening main text

Contents:
- multi-tenant LLM serving under burst arrival
- stateful stream processing under reconfiguration
- retrieval memory under continuous corpus drift

Required structure per case:

1. state object
2. control surface
3. coupling path
4. evaluation boundary
5. remaining gap
6. why the case matters for the main-paper thesis

### S4. Extended Domain-Specific Evidence Clusters

Purpose:
- preserve domain detail removed from the main text during second-round compression

Priority clusters:

1. serving lifecycle control
2. retrieval maintenance and exposure
3. retention-store governance
4. blueprint/fault-model elaboration if removed from main

### S5. Optional Supplement Appendix On Method/Evidence

Purpose:
- preserve traceability without bloating main text

Possible contents:

- evidence-level note for what counts as mechanism evidence
- expanded disturbance-test suggestions
- mapping from `LITERATURE_MATRIX.md` cluster rows to manuscript subsections

## 7. What Must Move To The Supplement

### Required Moves

1. full mechanism matrices
2. full evaluation/gap matrices
3. full worked example
4. expanded case studies
5. overlong serving sub-clusters that are evidentiary but not thesis-critical in the main paper

### Likely Moves In Round 2

1. predictive-serving fine-grained family detail
2. temporal serving lifecycle detail
3. some blueprint fault-model elaboration
4. expanded retrieval-maintenance taxonomy detail

## 8. What Must Stay In The Main Paper

1. the thesis: state as a runtime control problem
2. the three-axis structure: access / execution / evolution
3. the five-field analytical frame
4. cross-domain synthesis conclusions
5. design principles
6. anti-patterns
7. contract-oriented blueprint at concept level
8. evaluation vocabulary
9. integrated research agenda

## 9. Supplement Writing Rules

The supplement must still obey repository writing rules.

### Allowed

- more detailed mechanism comparison
- fuller case-study walkthroughs
- longer matrices
- expanded derivations or traces
- extra evidence paragraphs supporting main-paper claims

### Not allowed

- dumping uncategorized paper summaries
- introducing unrelated new survey clusters
- changing the main paper's thesis in the supplement
- using the supplement to hide contradictions in the main paper

### Required style

- keep subsection-sized clusters
- preserve synthesis language
- every major supplement subsection should still answer the five fields
- use “main text claim -> extended evidence” logic

## 10. Proposed Supplement File Structure

Recommended future files:

1. `supplement.tex`
2. `supplement_sections/`
3. shared `refs.bib`

Suggested section layout:

1. Scope of the Supplement
2. Extended Comparative Matrices
3. Extended Quantitative Propagation Trace
4. Extended Cross-Domain Case Studies
5. Extended Serving Lifecycle Evidence
6. Extended Retrieval and Retention Evidence
7. Optional Extended Blueprint / Fault-Model Notes

## 11. Immediate Execution Plan

### Step 1

Run second-round compression on the main paper with explicit page-recovery targets:

- serving synthesis: recover `1.5-2.5` pages
- retrieval / retention synthesis: recover `1.0-1.5` pages
- blueprint and evaluation: recover `1.0-1.8` pages

### Step 2

Create `supplement.tex` scaffold and section placeholders.

### Step 3

Move the already-decided material into supplement structure first:

- matrices
- worked example
- case studies

### Step 4

Only after supplement landing zones exist, do another aggressive main-text cut.

This avoids losing completeness while pushing toward the `35`-page target.

## 12. Coverage Audit After First Supplement Draft

Audit date:
- `2026-06-28`

Conclusion:
- the first supplement scaffold was directionally correct but not yet sufficient to claim that all first-round main-text cuts had been faithfully preserved.

What was already adequately covered:

1. broader literature landscape
2. worked-example landing zone
3. representative mechanism and evaluation matrices
4. compressed cross-domain case studies

What was missing or too placeholder-like before the second supplement pass:

1. serving-lifecycle family detail removed from the long `LLM Serving and Short-Lived Memory Lifecycles` subsection
2. retrieval-versus-retention trigger-level comparison removed during first-round compression
3. blueprint and fault-model rationale that explains why the contract-oriented blueprint is more than a generic architecture sketch
4. explicit preservation of first-round-cut comparative distinctions, not just future placeholders

Remediation applied in the second supplement pass:

1. `supplement_sections/extended_domain_notes.tex`
   - expanded from landing-note bullets into evidence-bearing prose
   - now includes:
     - predictive / structural-reuse / temporal-lifecycle serving families
     - retrieval and retention governance bridge material
     - expanded blueprint and fault-model notes
     - clearer foundations-scope rationale
2. supplement remains aligned with repository constraints:
   - mechanism-centered
   - five-field compatible
   - not a paper-by-paper dump
   - organized as main-claim to extended-evidence support

Implication for next main-text compression round:

- more aggressive cuts to `LLM Serving and Short-Lived Memory Lifecycles`, retrieval-maintenance detail, and blueprint exposition are now safer because the supplement has a more faithful landing zone for that material.
