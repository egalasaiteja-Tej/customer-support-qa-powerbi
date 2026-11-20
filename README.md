# Customer Support QA Review — Power BI

A Power BI report build package using the cleaned audit records from the companion Excel project. All employee names, records, IDs, and results are fictional; no customer or employer data is included.

## What is included

- `Cleaned_Audit_Data.csv` — 10,000 cleaned audit records and numeric helper flags.
- `PowerBI_Measures.dax` — measures for QA, target achievement, FCR, handling time, critical errors, repeat defects, and coaching audits.
- `PowerBI_Theme.json` — report colors and formatting theme.
- `Optional_Power_Query_Template.pq` — optional import query; update the file path before use.
- `Dashboard_Layout_Preview.png` — static layout reference, not a screenshot from Power BI.
- `PowerBI_Dashboard_Guide.md` — data import, measure setup, and visual layout instructions.

## Report layout

The guide describes two pages:

1. **Monthly Review:** QA trend against the 90-point goal, team-lead comparison, most common defects, and root causes.
2. **Agent Follow-up:** agent-level QA, FCR, handling time, repeat defects, critical errors, and coaching flags.

Suggested filters are month, team lead, and support queue.

## Build steps

1. Import `Cleaned_Audit_Data.csv` into Power BI Desktop.
2. Check the date and number field types, then create the measures in `PowerBI_Measures.dax`.
3. Import `PowerBI_Theme.json` and build the visuals described in `PowerBI_Dashboard_Guide.md`.
4. Save the completed report as a `.pbix` file.

This repository currently contains the import assets and report instructions; it does not contain a finished `.pbix` report.

## Sample results

The full synthetic sample has average QA of 88.6 against a target of 90, 45.3% of audits meeting target, FCR of 80.2%, average handling time of 660 seconds, and 83 critical-error audits. These results are generated for demonstration and do not describe a real company.
