#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516089 "Helpdesk  Role Centre"
{
    Caption = 'Helpdesk  Role Centre';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control4; "My Job Queue")
            {
                ApplicationArea = Advanced;
                Visible = false;
            }
            part(Control1; "Membership Cue")
            {
                AccessByPermission = TableData "Sales Shipment Header" = R;
                ApplicationArea = Basic, Suite;
            }
            part(Control2; "Team Member Activities")
            {
                ApplicationArea = Suite;
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Customer Care logs")
            {
                ApplicationArea = Basic;
                Caption = 'Customer Care logs';
                Image = "Report";
                RunObject = Report 51516507;
            }
            action("Member Statement")
            {
                ApplicationArea = Basic;
                Caption = 'Member Statement';
                Image = "Report";
                RunObject = Report 51516223;
            }
        }
        area(embedding)
        {
            action("51516435")
            {
                ApplicationArea = Basic;
                Caption = 'Fosa Accounts';
                RunObject = Page "FOSA Accounts Details Master";
            }
            action("Member List")
            {
                ApplicationArea = Basic;
                Caption = 'Member List';
                RunObject = Page "Member List";
            }
        }
    }
}

