#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99000860 "Planning Worksheet Line List"
{
    Caption = 'Planning Worksheet Line List';
    Editable = false;
    PageType = List;
    SourceTable = "Requisition Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Action Message";"Action Message")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies an action to take to rebalance the demand-supply situation.';
                }
                field("No.";"No.")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the number of the general ledger account or item to be entered on the line.';
                }
                field("Variant Code";"Variant Code")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies text that describes the entry.';
                }
                field("Description 2";"Description 2")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies additional text describing the entry, or a remark about the requisition worksheet line.';
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies a code for an inventory location where the items that are being ordered will be registered.';
                    Visible = false;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the number of units of the item.';
                    Visible = false;
                }
                field("Scrap %";"Scrap %")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the percentage of the item that you expect to be scrapped in the production process.';
                    Visible = false;
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the date when you can expect to receive the items.';
                }
                field("Starting Time";"Starting Time")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the starting time of the manufacturing process.';
                    Visible = false;
                }
                field("Starting Date";"Starting Date")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the starting date of the manufacturing process, if the planned supply is a production order.';
                }
                field("Ending Time";"Ending Time")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the ending time for the manufacturing process.';
                    Visible = false;
                }
                field("Ending Date";"Ending Date")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the ending date of the manufacturing process, if the planned supply is a production order.';
                }
                field("Production BOM No.";"Production BOM No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the production BOM number for this production order.';
                    Visible = false;
                }
                field("Routing No.";"Routing No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the routing number.';
                    Visible = false;
                }
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
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Item &Tracking Lines")
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';
                    ToolTip = 'View or edit serial numbers and lot numbers that are assigned to the item on the document or journal line.';

                    trigger OnAction()
                    begin
                        OpenItemTrackingLines;
                    end;
                }
            }
        }
    }
}

