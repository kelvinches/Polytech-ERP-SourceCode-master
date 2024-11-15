#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51516073 "Committment Entries"
{

    fields
    {
        field(1; "Line No."; Integer)
        {
        }
        field(2; Date; Date)
        {
        }
        field(3; "Posting Date"; Date)
        {
        }
        field(4; "Document Type"; Option)
        {
            OptionCaption = 'LPO,Requisition,Imprest,Payment Voucher,PettyCash,PurchInvoice,StaffClaim,StaffAdvance,StaffSurrender,Grant Surrender,Cash Purchase';
            OptionMembers = LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance,StaffSurrender,"Grant Surrender","Cash Purchase";
        }
        field(5; "Document No."; Code[20])
        {
        }
        field(6; "Committment Amount"; Decimal)
        {
        }
        field(7; "Month Budget"; Decimal)
        {
        }
        field(8; "Month Actual"; Decimal)
        {
        }
        field(9; Committed; Boolean)
        {
        }
        field(10; "Committed By"; Code[50])
        {
        }
        field(11; "Committed Date"; Date)
        {
        }
        field(12; "Committed Time"; Time)
        {
        }
        field(13; "Committed Machine"; Text[100])
        {
        }
        field(14; Cancelled; Boolean)
        {
        }
        field(15; "Cancelled By"; Code[20])
        {
        }
        field(16; "Cancelled Date"; Date)
        {
        }
        field(17; "Cancelled Time"; Time)
        {
        }
        field(18; "Cancelled Machine"; Text[100])
        {
        }
        field(19; "Shortcut Dimension 1 Code"; Code[20])
        {
        }
        field(20; "Shortcut Dimension 2 Code"; Code[20])
        {
        }
        field(21; "Shortcut Dimension 3 Code"; Code[20])
        {
        }
        field(22; "Shortcut Dimension 4 Code"; Code[20])
        {
        }
        field(23; "G/L Account No."; Code[20])
        {
        }
        field(24; Budget; Code[20])
        {
        }
        field(25; "Vendor/Cust No."; Code[20])
        {
        }
        field(26; Type; Option)
        {
            OptionMembers = " ",Vendor,Customer;
        }
        field(27; "Budget Expense Amount"; Decimal)
        {
        }
        field(28; "Expense Invoice No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
        key(Key2; Budget, "G/L Account No.", "Posting Date", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Shortcut Dimension 3 Code", "Shortcut Dimension 4 Code")
        {
            SumIndexFields = "Committment Amount";
        }
        key(Key3; "G/L Account No.", "Posting Date", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Shortcut Dimension 3 Code", "Shortcut Dimension 4 Code")
        {
            SumIndexFields = "Committment Amount";
        }
    }

    fieldgroups
    {
    }
}

