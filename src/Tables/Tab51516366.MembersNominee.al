#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51516366 "Members Nominee"
{
    DrillDownPageID = 51516370;
    LookupPageID = 51516370;

    fields
    {
        field(2; Name; Text[100])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                Name := UpperCase(Name);
            end;
        }
        field(3; Relationship; Text[30])
        {
            TableRelation = "Relationship Types";
        }
        field(4; Beneficiary; Boolean)
        {
        }
        field(5; "Date of Birth"; Date)
        {
        }
        field(6; Address; Text[150])
        {
        }
        field(7; Telephone; Code[100])
        {

            trigger OnValidate()
            begin
                if StrLen(Telephone) <> 10 then
                    Error('Telephone No. Can not be more or less than 10 Characters')
            end;
        }
        field(9; Email; Text[100])
        {
        }
        field(10; "Account No"; Code[30])
        {
            TableRelation = "Member Register"."No.";
        }
        field(11; "ID No."; Code[40])
        {
        }
        field(12; "%Allocation"; Decimal)
        {
        }
        field(13; "New Upload"; Boolean)
        {
        }
        field(14; "Total Allocation"; Decimal)
        {
            CalcFormula = sum("Members Nominee"."%Allocation" where("Account No" = field("Account No")));
            FieldClass = FlowField;
        }
        field(15; "Maximun Allocation %"; Decimal)
        {
        }
        field(16; "NOK Residence"; Code[100])
        {
        }
        field(17; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(18; Description; Text[100])
        {
        }
        field(19; Guardian; Code[100])
        {
        }
        field(20; "Created By"; Code[40])
        {
        }
        field(21; "Last date Modified"; Date)
        {
        }
        field(22; "Modified by"; Code[40])
        {
        }
        field(23; "Date Created"; Date)
        {
        }
        field(24; "Next Of Kin Type"; Option)
        {
            OptionCaption = ' ,Beneficiary,Guardian,Dependants';
            OptionMembers = " ",Beneficiary,Guardian,Dependants;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Account No", Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

