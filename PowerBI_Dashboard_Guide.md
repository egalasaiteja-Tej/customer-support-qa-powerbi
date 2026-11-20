# Power BI report notes | Support QA review

## Files

- **Cleaned_Audit_Data.csv** — the same 10,000 cleaned audit records used in the Excel workbook, with numeric helper flags and a real Month_Start date for chronological charts.
- **PowerBI_Measures.dax** — simple measures for the KPI cards and charts.
- **PowerBI_Theme.json** — a coordinated blue, teal and amber report theme.
- **Optional_Power_Query_Template.pq** — optional import query. Update the file path first, or use Get Data > Text/CSV instead.
- **PowerBI_Dashboard_Preview.png** — static layout reference, not a Power BI screenshot.

All people, IDs and outcomes are synthetic. No actual customer or employer data is included.

## Import the data

1. In Power BI Desktop, select **Get data > Text/CSV** and choose **Cleaned_Audit_Data.csv**.
2. In the preview, select **Transform Data**. Confirm Audit_Date, Week_Start and Month_Start are Date; QA_Score is Decimal Number; AHT_Seconds and the five flag columns are Whole Number.
3. Confirm there are 10,000 data rows, then select **Close & Apply**.
4. Import the theme with **View > Themes > Browse for themes**, then select **PowerBI_Theme.json**.
5. In the model, create the measures in **PowerBI_Measures.dax** one at a time using **Modeling > New measure**. Format At-Target Rate, FCR Rate and Critical Error Rate as percentages; format Average QA and QA Target to one decimal place; format Average AHT Seconds and audit counts as whole numbers.

## Page 1 — Monthly Review

Add slicers along the top for Month_Start, Team_Lead and Queue. Use dropdown slicers to save space.

The question this page answers is: **Is quality meeting the target, and where is the gap concentrated?** Add these visuals below the slicers:

1. KPI cards: Audit Count, Average QA, At-Target Rate, FCR Rate, Average AHT Seconds, and Critical Error Audits.
2. Line chart: Month_Start on the X-axis and Average QA on the Y-axis. Add a constant line at 90 to show the quality target.
3. Horizontal bar chart: Team_Lead on the Y-axis and Average QA on the X-axis. Add a constant line at 90 and sort by Average QA. Use **Edit interactions** so the Team_Lead slicer does not hide the other teams from this comparison.
4. Horizontal bar chart: Defect_Category and Audit Count. Apply a Top N filter of 10 by Audit Count.
5. Donut chart: Root_Cause as the legend and Audit Count as values.

## Page 2 — Agent Follow-up

Reuse the Month_Start, Team_Lead and Queue slicers. Add a table with Agent_Name, Team_Lead, Audit Count, Average QA, At-Target Rate, FCR Rate, Average AHT Seconds, Critical Error Audits, Repeat Defect Audits and Coaching Audits. Apply red/amber/green conditional formatting to Average QA. Add a bar chart by Agent_Name for Repeat Defect Audits and another by Defect_Category for Coaching Audits. This page is for locating repeat patterns to review; it should not be presented as a real coaching decision.

## Measure definitions in plain language

- **Audit Count:** counts the numeric QA scores. Every cleaned audit has one score.
- **Average QA:** mean QA score for the current selection.
- **QA Target:** the portfolio threshold, set to 90.
- **At-Target Rate:** average of a 1/0 flag; therefore it is the share of audits meeting the target.
- **FCR Rate:** average of a 1/0 flag; therefore it is the share resolved on first contact.
- **Average AHT Seconds:** average handling time in seconds.
- **Critical, repeat and coaching audits:** sums of the matching 1/0 flags.
- **QA Gap to Target:** average QA minus 90; a negative number is below target.

I added the 1/0 flags while preparing the data so these measures stay short. A 1 means Yes and a 0 means No. For example, the average of the FCR flag is the share of records with FCR marked Yes.

## Synthetic sample reference values

In the full sample, average QA is 88.6, 45.3% of audits meet the 90-point goal, FCR is 80.2%, average AHT is 660 seconds, and 83 audits have a critical error. Incomplete probing is the most frequent scored defect (587 audits). These are generated sample results, not actual company performance.

The monthly chart shows whether the QA gap persists over time. The team comparison shows how results vary by lead. The defect and root-cause visuals help narrow down what to examine next. These patterns are built into the synthetic data for demonstration.

## Note about the Power BI file

This package contains the cleaned data, theme, measures and visual build instructions. It does not contain a saved .pbix file because Power BI Desktop is not available in the current session. Open the CSV and recreate the two-page report in Power BI Desktop, then save the resulting .pbix on your device. The PBIP/PBIR formats can store source definitions, but they cannot be opened and checked here without Power BI Desktop.
