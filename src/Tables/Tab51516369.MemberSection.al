#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51516369 "Member Section"
{
    DrillDownPageID = 51516379;
    LookupPageID = 51516379;

    fields
    {
        field(1; "No."; Code[20])
        {
            NotBlank = true;
        }
        field(2; Section; Text[70])
        {
        }
        field(3; "Employer Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sacco Employers".Code;
        }
        field(4; "Employer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Section, "Employer Code", "Employer Name")
        {
        }
    }
}

