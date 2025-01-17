#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516978 "Score Card"
{
    PageType = List;
    SourceTable = 51516925;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Member No"; "Member No")
                {
                    ApplicationArea = Basic;
                }
                field("Registration Date"; "Registration Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Approved"; "Date Approved")
                {
                    ApplicationArea = Basic;
                }
                field("Captured By"; "Captured By")
                {
                    ApplicationArea = Basic;
                }
                field("Last Modified By"; "Last Modified By")
                {
                    ApplicationArea = Basic;
                }
                field("Last Modified Date"; "Last Modified Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Score"; "Total Score")
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

