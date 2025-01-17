#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516861 "Interest Earned"
{
    Editable = false;
    PageType = List;
    SourceTable = 51516467;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field("Account No"; "Account No")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Date"; "Interest Date")
                {
                    ApplicationArea = Basic;
                }
                field("Interest Amount"; "Interest Amount")
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

