#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516607 "CWithdrawal Graduated Charges"
{
    PageType = List;
    SourceTable = 51516542;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Minimum Amount"; "Minimum Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Amount"; "Maximum Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Use Percentage"; "Use Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage of Amount"; "Percentage of Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Charge Account"; "Charge Account")
                {
                    ApplicationArea = Basic;
                }
                field("Notice Status"; "Notice Status")
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

