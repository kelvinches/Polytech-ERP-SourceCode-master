#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516428 "Member Statistics FactBox"
{
    Caption = 'Member FactBox';
    Editable = false;
    PageType = CardPart;
    SaveValues = true;
    SourceTable = "Member Register";

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = Basic;
                Caption = 'Member No.';
            }
            field(Name; Rec.Name)
            {
                ApplicationArea = Basic;
            }
            field("Personal No"; Rec."Personal No")
            {
                ApplicationArea = Basic;
            }
            field("ID No."; Rec."ID No.")
            {
                ApplicationArea = Basic;
            }
            field("Passport No."; Rec."Passport No.")
            {
                ApplicationArea = Basic;
            }
            field("Mobile Phone No"; Rec."Mobile Phone No")
            {
                ApplicationArea = Basic;
            }
            group("Member Details FactBox")
            {
                Caption = 'Member Details FactBox';
                field("Registration Fee Paid"; Rec."Registration Fee Paid")
                {
                    ApplicationArea = Basic;
                }
                field("Shares Retained"; Rec."Shares Retained")
                {
                    ApplicationArea = Basic;
                    Caption = 'Share Capital';
                }
                field("Current Shares"; Rec."Current Shares")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member Deposits';
                    Image = Star;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("Holiday Savings"; Rec."Holiday Savings")
                {
                    ApplicationArea = Basic;
                    Caption = 'Holiday Savings';
                }
                field("Additional Shares"; Rec."Additional Shares")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Outstanding Interest"; Rec."Outstanding Interest")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loan Outstanding Balance';
                    StyleExpr = FieldStyleL;
                }
                field("Un-allocated Funds"; Rec."Un-allocated Funds")
                {
                    ApplicationArea = Basic;
                    StyleExpr = FieldStyle;
                }
                field("Insurance Fund"; Rec."Insurance Fund")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loan Insurance';
                }
                field("Group Shares"; Rec."Group Shares")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Dividend Amount"; Rec."Dividend Amount")
                {
                    ApplicationArea = Basic;
                }
                field(VarMemberLiability; VarMemberLiability)
                {
                    ApplicationArea = Basic;
                    Caption = 'Member Guarantorship Liability';
                }
                field(FreeSharesSelf; FreeSharesSelf)
                {
                    ApplicationArea = Basic;
                    Caption = 'Grt Free Shares';
                    Visible = false;
                }
                field("Guarantee Free Shares"; FreeShares)
                {
                    ApplicationArea = Basic;
                    Caption = 'Grt Free Shares Others';
                    Editable = false;
                    Visible = false;
                }
                field("Member Loan Liability"; Rec."Member Loan Liability")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        ObjLoans.Reset;
        ObjLoans.SetRange("Client Code", Rec."No.");
        if ObjLoans.Find('-') then
            OutstandingInterest := SFactory.FnGetInterestDueTodate(ObjLoans) - ObjLoans."Interest Paid";
    end;

    trigger OnAfterGetRecord()
    begin
        if (Rec."Assigned System ID" <> '') then begin //AND ("Assigned System ID"<>USERID)
            if UserSetup.Get(UserId) then begin
                if UserSetup."View Special Accounts" = false then Error('You do not have permission to view this account Details, Contact your system administrator! ')
            end;

        end;


        ChangeCustomer;
        GetLatestPayment;
        CalculateAging;


        SetFieldStyle;
        Rec.CalcFields("Current Shares", "Member Loan Liability");
        VarMemberLiability := ((Rec."Current Shares") - Rec."Member Loan Liability");

        // VarMemberSelfLiability:=SFactory.FnGetMemberSelfLiability("No.");
        // CALCFIELDS("Current Shares");
        //
        // FreeShares:=("Current Shares")-(VarMemberLiability+VarMemberSelfLiability);
        //
        //
        // FreeSharesSelf:=("Current Shares")-(VarMemberLiability+VarMemberSelfLiability);//"Current Shares"-VarMemberSelfLiability;
        //
        // IF FreeSharesSelf<0 THEN
        // FreeSharesSelf:=0;
    end;

    trigger OnOpenPage()
    begin
        // Default the Aging Period to 30D
        Evaluate(AgingPeriod, '<30D>');
        // Initialize Record Variables
        LatestCustLedgerEntry.Reset;
        LatestCustLedgerEntry.SetCurrentkey("Document Type", "Customer No.", "Posting Date");
        LatestCustLedgerEntry.SetRange("Document Type", LatestCustLedgerEntry."document type"::Payment);
        for I := 1 to ArrayLen(CustLedgerEntry) do begin
            CustLedgerEntry[I].Reset;
            CustLedgerEntry[I].SetCurrentkey("Customer No.", Open, Positive, "Due Date");
            CustLedgerEntry[I].SetRange(Open, true);
        end;
    end;

    var
        LatestCustLedgerEntry: Record "Cust. Ledger Entry";
        CustLedgerEntry: array[4] of Record "Cust. Ledger Entry";
        AgingTitle: array[4] of Text[30];
        AgingPeriod: DateFormula;
        I: Integer;
        PeriodStart: Date;
        PeriodEnd: Date;
        Text002: label 'Not Yet Due';
        Text003: label 'Over %1 Days';
        Text004: label '%1-%2 Days';
        LoanGuarantors: Record "Loans Guarantee Details";
        ComittedShares: Decimal;
        Loans: Record "Loans Register";
        FreeShares: Decimal;
        UserSetup: Record "User Setup";
        FieldStyle: Text;
        FieldStyleL: Text;
        FieldStyleI: Text;
        LoanNo: Code[20];
        LoanGuar: Record "Loans Guarantee Details";
        TGrAmount: Decimal;
        GrAmount: Decimal;
        FGrAmount: Decimal;
        TAmountGuaranteed: Decimal;
        AllGuaratorsTotal: Decimal;
        AmounttoRelease: Decimal;
        TotalOutstaningBal: Decimal;
        TotalApprovedAmount: Decimal;
        TotalAmountPaid: Decimal;
        OutstandingInterest: Decimal;
        InterestDue: Decimal;
        SFactory: Codeunit 51516007;
        ObjLoans: Record "Loans Register";
        VarMemberLiability: Decimal;
        VarMemberSelfLiability: Decimal;
        FreeSharesSelf: Decimal;


    procedure CalculateAgingForPeriod(PeriodBeginDate: Date; PeriodEndDate: Date; Index: Integer)
    var
        CustLedgerEntry2: Record "Cust. Ledger Entry";
        NumDaysToBegin: Integer;
        NumDaysToEnd: Integer;
    begin
        // Calculate the Aged Balance for a particular Date Range
        if PeriodEndDate = 0D then
            CustLedgerEntry[Index].SetFilter("Due Date", '%1..', PeriodBeginDate)
        else
            CustLedgerEntry[Index].SetRange("Due Date", PeriodBeginDate, PeriodEndDate);

        CustLedgerEntry2.Copy(CustLedgerEntry[Index]);
        CustLedgerEntry[Index]."Remaining Amt. (LCY)" := 0;
        if CustLedgerEntry2.Find('-') then
            repeat
                CustLedgerEntry2.CalcFields("Remaining Amt. (LCY)");
                CustLedgerEntry[Index]."Remaining Amt. (LCY)" :=
                  CustLedgerEntry[Index]."Remaining Amt. (LCY)" + CustLedgerEntry2."Remaining Amt. (LCY)";
            until CustLedgerEntry2.Next = 0;

        if PeriodBeginDate <> 0D then
            NumDaysToBegin := WorkDate - PeriodBeginDate;
        if PeriodEndDate <> 0D then
            NumDaysToEnd := WorkDate - PeriodEndDate;
        if PeriodEndDate = 0D then
            AgingTitle[Index] := Text002
        else
            if PeriodBeginDate = 0D then
                AgingTitle[Index] := StrSubstNo(Text003, NumDaysToEnd - 1)
            else
                AgingTitle[Index] := StrSubstNo(Text004, NumDaysToEnd, NumDaysToBegin);
    end;


    procedure CalculateAging()
    begin
        // Calculate the Entire Aging (four Periods)
        for I := 1 to ArrayLen(CustLedgerEntry) do begin
            case I of
                1:
                    begin
                        PeriodEnd := 0D;
                        PeriodStart := WorkDate;
                    end;
                ArrayLen(CustLedgerEntry):
                    begin
                        PeriodEnd := PeriodStart - 1;
                        PeriodStart := 0D;
                    end;
                else begin
                    PeriodEnd := PeriodStart - 1;
                    PeriodStart := CalcDate('-' + Format(AgingPeriod), PeriodStart);
                end;
            end;
            CalculateAgingForPeriod(PeriodStart, PeriodEnd, I);
        end;
    end;


    procedure GetLatestPayment()
    begin
        // Find the Latest Payment
        if LatestCustLedgerEntry.FindLast then
            LatestCustLedgerEntry.CalcFields("Amount (LCY)")
        else
            LatestCustLedgerEntry.Init;
    end;


    procedure ChangeCustomer()
    begin
        // Change the Customer Filters
        LatestCustLedgerEntry.SetRange("Customer No.", Rec."No.");
        for I := 1 to ArrayLen(CustLedgerEntry) do
            CustLedgerEntry[I].SetRange("Customer No.", Rec."No.");
    end;


    procedure DrillDown(Index: Integer)
    begin
        if Index = 0 then
            Page.RunModal(Page::"Customer Ledger Entries", LatestCustLedgerEntry)
        else
            Page.RunModal(Page::"Customer Ledger Entries", CustLedgerEntry[Index]);
    end;

    local procedure SetFieldStyle()
    begin
        FieldStyle := '';
        Rec.CalcFields("Un-allocated Funds");
        if Rec."Un-allocated Funds" <> 0 then
            FieldStyle := 'Attention';
        Rec.CalcFields("Outstanding Balance", "Outstanding Interest");
        if (Rec."Outstanding Balance" < 0) then
            FieldStyleL := 'Attention';

        Rec.CalcFields("Outstanding Balance", "Outstanding Interest");
        if (Rec."Outstanding Interest" < 0) then
            FieldStyleI := 'Attention';
    end;
}

