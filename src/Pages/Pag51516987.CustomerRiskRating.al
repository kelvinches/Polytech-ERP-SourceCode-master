#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516987 "Customer Risk Rating"
{
    PageType = List;
    SourceTable = 51516931;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Category; Category)
                {
                    ApplicationArea = Basic;
                }
                field("Sub Category"; "Sub Category")
                {
                    ApplicationArea = Basic;
                }
                field("Inherent Risk Rating"; "Inherent Risk Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Score"; "Risk Score")
                {
                    ApplicationArea = Basic;
                }
                field("Min Relationship Length(Years)"; "Min Relationship Length(Years)")
                {
                    ApplicationArea = Basic;
                }
                field("Max Relationship Length(Years)"; "Max Relationship Length(Years)")
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

