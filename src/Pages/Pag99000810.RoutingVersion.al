#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99000810 "Routing Version"
{
    Caption = 'Routing Version';
    DataCaptionExpression = Caption;
    PageType = ListPlus;
    SourceTable = "Routing Version";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Version Code";"Version Code")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the version code of the routing.';

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                          CurrPage.Update;
                    end;
                }
                field(Description;Description)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies a description for the routing version.';
                }
                field(Type;Type)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies in which order operations in the routing are performed.';
                }
                field(Status;Status)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the status of this routing version.';
                }
                field("Starting Date";"Starting Date")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the starting date for this routing version.';
                }
            }
            part(RoutingLine;"Routing Version Lines")
            {
                ApplicationArea = Manufacturing;
                SubPageLink = "Routing No."=field("Routing No."),
                              "Version Code"=field("Version Code");
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyRouting)
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Copy &Routing';
                    Image = CopyRouteHeader;
                    ToolTip = 'Copy an existing routing to quickly create a similar BOM.';

                    trigger OnAction()
                    begin
                        if not Confirm(Text000,false) then
                          exit;

                        RtngHeader.Get("Routing No.");
                        CopyRouting.CopyRouting("Routing No.",'',RtngHeader,"Version Code");
                    end;
                }
                action("Copy Routing &Version")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Copy Routing &Version';
                    Ellipsis = true;
                    Image = CopyRouteVersion;
                    ToolTip = 'Copy an existing routing version to quickly create a similar routing.';

                    trigger OnAction()
                    begin
                        CopyRouting.SelectCopyFromVersionList(Rec);
                    end;
                }
            }
        }
    }

    var
        Text000: label 'Copy from routing header?';
        RtngHeader: Record "Routing Header";
        CopyRouting: Codeunit "Routing Line-Copy Lines";
}

