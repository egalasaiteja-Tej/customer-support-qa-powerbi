// Optional Power Query template. Replace the path below with the folder where you extracted the package.
// You can skip this file and use Home > Get Data > Text/CSV to import Cleaned_Audit_Data.csv.
let
    Source = Csv.Document(
        File.Contents("C:\PATH\TO\PowerBI_Dashboard_Package\Cleaned_Audit_Data.csv"),
        [Delimiter=",", Encoding=65001, QuoteStyle=QuoteStyle.Csv]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    TypedColumns = Table.TransformColumnTypes(PromotedHeaders, {
        {"Audit_Date", type date},
        {"Week_Start", type date},
        {"Month_Start", type date},
        {"QA_Score", type number},
        {"QA_Target", Int64.Type},
        {"AHT_Seconds", Int64.Type},
        {"QA_At_Target_Flag", Int64.Type},
        {"FCR_Flag", Int64.Type},
        {"Critical_Error_Flag", Int64.Type},
        {"Repeat_Defect_Flag", Int64.Type},
        {"Coaching_Flag", Int64.Type}
    }, "en-US")
in
    TypedColumns
