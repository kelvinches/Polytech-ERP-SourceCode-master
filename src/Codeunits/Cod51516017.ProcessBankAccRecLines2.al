#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 51516017 "Process Bank Acc. Rec Lines-2"
{
    Permissions = TableData "Data Exch." = rimd;
    TableNo = 51516092;

    trigger OnRun()
    var
        PostingExch: Record "Data Exch.";
        ProcessPostingExch: Codeunit "Process Data Exch.";
        RecRef: RecordRef;
    begin
        PostingExch.Get(PostingExch."Entry No.");
        RecRef.GetTable(Rec);
        ProcessPostingExch.ProcessAllLinesColumnMapping(PostingExch, RecRef);
    end;

    var
        ProgressWindowMsg: label 'Please wait while the operation is being completed.';


    procedure ImportBankStatement(BankAccRecon: Record "Bank Acc. Reconciliation";PostingExch: Record "Data Exch."): Boolean
    var
    //     BankAcc: Record "Bank Account";
    //     PostExchDef: Record "Data Exch. Def";
    //     PostExchMapping: Record "Data Exch. Mapping";
    //     PostExchLineDef: Record "Data Exch. Line Def";
    //     BankAccReconLine: Record 51516092;
    //     ProgressWindow: Dialog;
    begin
    //     BankAcc.Get(BankAccRecon."Bank Account No.");
    //     BankAcc.GetDataExchDef(PostExchDef);

    //     if not PostingExch.ImportToPostExch(PostExchDef)then
    //       exit(false);
    //        //hazina
    //     ProgressWindow.Open(ProgressWindowMsg);

    //     CreateBankAccRecLineTemplate(BankAccReconLine,BankAccRecon,PostingExch);
    //     // Hazina PostExchLineDef.SETRANGE("Posting Exch. Def Code",PostExchDef.Code);
    //     PostExchLineDef.FindFirst;

    //     PostExchMapping.Get(PostExchDef.Code,PostExchLineDef.Code,Database::"Bank Acc. Statement Linevb");

    //     if PostExchMapping."Pre-Mapping Codeunit" <> 0 then
    //       Codeunit.Run(PostExchMapping."Pre-Mapping Codeunit",BankAccReconLine);

    //     PostExchMapping.TestField("Mapping Codeunit");
    //     Codeunit.Run(PostExchMapping."Mapping Codeunit",BankAccReconLine);

    //     if PostExchMapping."Post-Mapping Codeunit" <> 0 then
    //       Codeunit.Run(PostExchMapping."Post-Mapping Codeunit",BankAccReconLine);

    //     ProgressWindow.Close;
        exit(true);
    end;

    local procedure CreateBankAccRecLineTemplate(var BankAccReconLine: Record 51516092; BankAccRecon: Record "Bank Acc. Reconciliation"; PostExch: Record "Data Exch.")
    begin
        BankAccReconLine.Init;
        BankAccReconLine."Statement Type" := BankAccRecon."Statement Type";
        BankAccReconLine."Statement No." := BankAccRecon."Statement No.";
        BankAccReconLine."Bank Account No." := BankAccRecon."Bank Account No.";
        BankAccReconLine."Posting Exch. Entry No." := PostExch."Entry No.";
    end;
}

