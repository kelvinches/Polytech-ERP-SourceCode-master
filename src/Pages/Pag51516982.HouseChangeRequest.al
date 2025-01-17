#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516982 "House Change Request"
{
    CardPageID = "House Change Request Change";
    Editable = false;
    PageType = List;
    SourceTable = 51516927;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Member No"; "Member No")
                {
                    ApplicationArea = Basic;
                }
                field("Member Name"; "Member Name")
                {
                    ApplicationArea = Basic;
                }
                field("House Group"; "House Group")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Destination Cell"; "Destination Cell")
                {
                    ApplicationArea = Basic;
                }
                field("House Group Name"; "House Group Name")
                {
                    ApplicationArea = Basic;
                }
                field("Reason For Changing Groups"; "Reason For Changing Groups")
                {
                    ApplicationArea = Basic;
                }
                field("Date Group Changed"; "Date Group Changed")
                {
                    ApplicationArea = Basic;
                }
                field("Changed By"; "Changed By")
                {
                    ApplicationArea = Basic;
                }
                field("Deposits on Date of Change"; "Deposits on Date of Change")
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

