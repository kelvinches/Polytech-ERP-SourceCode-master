#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99000843 "Prod. Order BOM Cmt List"
{
    AutoSplitKey = true;
    Caption = 'Comment List';
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Prod. Order Comp. Cmt Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Date;Date)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the date.';
                }
                field(Comment;Comment)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the actual comment text.';
                }
                field("Code";Code)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies a code for the comments.';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}
