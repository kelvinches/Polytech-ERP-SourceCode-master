#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99000868 "Finished Prod. Order Lines"
{
    Caption = 'Lines';
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Prod. Order Line";
    SourceTableView = where(Status=const(Finished));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                IndentationColumn = DescriptionIndent;
                IndentationControls = Description;
                field("Item No.";"Item No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of the item that is to be produced.';
                }
                field("Variant Code";"Variant Code")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the date when the produced item must be available. The date is copied from the header of the production order.';
                }
                field(Description;Description)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the value of the Description field on the item card. If you enter a variant code, the variant description is copied to this field instead.';
                }
                field("Description 2";"Description 2")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies an additional description.';
                    Visible = false;
                }
                field("Production BOM No.";"Production BOM No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of the production BOM that is the basis for creating the Prod. Order Component list for this line.';
                    Visible = false;
                }
                field("Routing No.";"Routing No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of the routing used as the basis for creating the production order routing for this line.';
                    Visible = false;
                }
                field("Routing Version Code";"Routing Version Code")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the version number of the routing.';
                    Visible = false;
                }
                field("Production BOM Version Code";"Production BOM Version Code")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the version code of the production BOM.';
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location code, if the produced items should be stored in a specific location.';
                    Visible = false;
                }
                field("Bin Code";"Bin Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTip = 'Specifies the bin that the produced item is posted to as output, and from where it can be taken to storage or cross-docked.';
                    Visible = false;
                }
                field("Starting Date-Time";"Starting Date-Time")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the starting date and the starting time, which are combined in a format called "starting date-time".';
                }
                field("Starting Time";"Starting Time")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the entry''s starting time, which is retrieved from the production order routing.';
                    Visible = false;
                }
                field("Starting Date";"Starting Date")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the entry''s starting date, which is retrieved from the production order routing.';
                    Visible = false;
                }
                field("Ending Date-Time";"Ending Date-Time")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the ending date and the ending time, which are combined in a format called "ending date-time".';
                }
                field("Ending Time";"Ending Time")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the entry''s ending time, which is retrieved from the production order routing.';
                    Visible = false;
                }
                field("Ending Date";"Ending Date")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the entry''s ending date, which is retrieved from the production order routing.';
                    Visible = false;
                }
                field("Scrap %";"Scrap %")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the percentage of the item that you expect to be scrapped in the production process.';
                    Visible = false;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the quantity to be produced if you manually fill in this line.';
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field("Finished Quantity";"Finished Quantity")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies how much of the quantity on this line has been produced.';
                }
                field("Unit Cost";"Unit Cost")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the cost per unit of the item.';
                }
                field("Cost Amount";"Cost Amount")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the total cost on the line by multiplying the unit cost by the quantity.';
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
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension=R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        ShowDimensions;
                    end;
                }
                action("Ro&uting")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Ro&uting';
                    Image = Route;
                    ToolTip = 'View or edit the operations list of the parent item on the line.';

                    trigger OnAction()
                    begin
                        ShowRouting;
                    end;
                }
                action(Components)
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Components';
                    Image = Components;
                    ToolTip = 'View or edit the production order components of the parent item on the line.';

                    trigger OnAction()
                    begin
                        ShowComponents;
                    end;
                }
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

    trigger OnAfterGetRecord()
    begin
        DescriptionIndent := 0;
        DescriptionOnFormat;
    end;

    var
        [InDataSet]
        DescriptionIndent: Integer;

    local procedure ShowComponents()
    var
        ProdOrderComp: Record "Prod. Order Component";
    begin
        ProdOrderComp.SetRange(Status,Status);
        ProdOrderComp.SetRange("Prod. Order No.","Prod. Order No.");
        ProdOrderComp.SetRange("Prod. Order Line No.","Line No.");

        Page.Run(Page::"Prod. Order Components",ProdOrderComp);
    end;

    local procedure ShowRouting()
    var
        ProdOrderRtngLine: Record "Prod. Order Routing Line";
    begin
        ProdOrderRtngLine.SetRange(Status,Status);
        ProdOrderRtngLine.SetRange("Prod. Order No.","Prod. Order No.");
        ProdOrderRtngLine.SetRange("Routing Reference No.","Routing Reference No.");
        ProdOrderRtngLine.SetRange("Routing No.","Routing No.");

        Page.Run(Page::"Prod. Order Routing",ProdOrderRtngLine);
    end;

    local procedure OpenItemTrackingLines()
    begin
        OpenItemTrackingLines;
    end;

    local procedure DescriptionOnFormat()
    begin
        DescriptionIndent := "Planning Level Code";
    end;
}

