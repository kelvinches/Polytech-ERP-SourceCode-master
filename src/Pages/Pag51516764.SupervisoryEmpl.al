#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516764 "Supervisory$Empl"
{
    PageType = List;
    SourceTable = 51516573;

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
                field("Member Name"; "Member Name")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Position held"; "Position held")
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
