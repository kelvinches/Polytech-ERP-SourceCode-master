#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516056 "Funds Tax List"
{
    CardPageID = "Funds Tax Card";
    PageType = List;
    SourceTable = "Funds Tax Codes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Tax Code"; Rec."Tax Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

