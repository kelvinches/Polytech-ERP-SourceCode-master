#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99000829 "Firm Planned Prod. Order"
{
    Caption = 'Firm Planned Prod. Order';
    PageType = Document;
    SourceTable = "Production Order";
    SourceTableView = where(Status=const("Firm Planned"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";"No.")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    Lookup = false;
                    ToolTip = 'Specifies the number of the production order.';

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                          CurrPage.Update;
                    end;
                }
                field(Description;Description)
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the description of the production order.';
                }
                field("Description 2";"Description 2")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies an additional part of the production order description.';
                }
                field("Source Type";"Source Type")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the source type of the production order.';

                    trigger OnValidate()
                    begin
                        if xRec."Source Type" <> "Source Type" then
                          "Source No." := '';
                    end;
                }
                field("Source No.";"Source No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the source number of the production order.';
                }
                field("Search Description";"Search Description")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the search description.';
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies how many units of the item or the family to produce (production quantity).';
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the due date of the production order.';
                }
                field("Assigned User ID";"Assigned User ID")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies when the production order card was last modified.';
                }
            }
            part(ProdOrderLines;"Firm Planned Prod. Order Lines")
            {
                ApplicationArea = Manufacturing;
                SubPageLink = "Prod. Order No."=field("No.");
            }
            group(Schedule)
            {
                Caption = 'Schedule';
                field("Starting Time";"Starting Time")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the starting time of the production order.';

                    trigger OnValidate()
                    begin
                        StartingTimeOnAfterValidate;
                    end;
                }
                field("Starting Date";"Starting Date")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the starting date of the production order.';

                    trigger OnValidate()
                    begin
                        StartingDateOnAfterValidate;
                    end;
                }
                field("Ending Time";"Ending Time")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the ending time of the production order.';

                    trigger OnValidate()
                    begin
                        EndingTimeOnAfterValidate;
                    end;
                }
                field("Ending Date";"Ending Date")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the ending date of the production order.';

                    trigger OnValidate()
                    begin
                        EndingDateOnAfterValidate;
                    end;
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                field("Inventory Posting Group";"Inventory Posting Group")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies links between business transactions made for the item and an inventory account in the general ledger, to group amounts for that item type.';
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';

                    trigger OnValidate()
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';

                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Location;
                    Importance = Promoted;
                    ToolTip = 'Specifies the location code to which you want to post the finished product from this production order.';
                }
                field("Bin Code";"Bin Code")
                {
                    ApplicationArea = Warehouse;
                    Importance = Promoted;
                    ToolTip = 'Specifies a bin to which you want to post the finished items.';
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
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Prod. Order Comment Sheet";
                    RunPageLink = Status=field(Status),
                                  "Prod. Order No."=field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
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
                        ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Statistics)
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Production Order Statistics";
                    RunPageLink = Status=field(Status),
                                  "No."=field("No."),
                                  "Date Filter"=field("Date Filter");
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                }
                action("Plannin&g")
                {
                    ApplicationArea = Planning;
                    Caption = 'Plannin&g';
                    Image = Planning;
                    ToolTip = 'Plan supply orders for the production order order by order.';

                    trigger OnAction()
                    var
                        OrderPlanning: Page "Order Planning";
                    begin
                        OrderPlanning.SetProdOrder(Rec);
                        OrderPlanning.RunModal;
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Re&fresh Production Order")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Re&fresh Production Order';
                    Ellipsis = true;
                    Image = Refresh;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Calculate changes made to the production order header without involving production BOM levels. The function calculates and initiates the values of the component lines and routing lines based on the master data defined in the assigned production BOM and routing, according to the order quantity and due date on the production order''s header.';

                    trigger OnAction()
                    var
                        ProdOrder: Record "Production Order";
                    begin
                        ProdOrder.SetRange(Status,Status);
                        ProdOrder.SetRange("No.","No.");
                        Report.RunModal(Report::"Refresh Production Order",true,true,ProdOrder);
                    end;
                }
                action("Re&plan")
                {
                    ApplicationArea = Planning;
                    Caption = 'Re&plan';
                    Ellipsis = true;
                    Image = Replan;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Calculate changes made to components and routings lines including items on lower production BOM levels for which it may generate new production orders.';

                    trigger OnAction()
                    var
                        ProdOrder: Record "Production Order";
                    begin
                        ProdOrder.SetRange(Status,Status);
                        ProdOrder.SetRange("No.","No.");
                        Report.RunModal(Report::"Replan Production Order",true,true,ProdOrder);
                    end;
                }
                action("Change &Status")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Change &Status';
                    Ellipsis = true;
                    Image = ChangeStatus;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Change the production order to another status, such as Released.';

                    trigger OnAction()
                    begin
                        CurrPage.Update;
                        Codeunit.Run(Codeunit::"Prod. Order Status Management",Rec);
                    end;
                }
                action("&Update Unit Cost")
                {
                    ApplicationArea = Manufacturing;
                    Caption = '&Update Unit Cost';
                    Ellipsis = true;
                    Image = UpdateUnitCost;
                    ToolTip = 'Update the cost of the parent item per changes to the production BOM or routing.';

                    trigger OnAction()
                    var
                        ProdOrder: Record "Production Order";
                    begin
                        ProdOrder.SetRange(Status,Status);
                        ProdOrder.SetRange("No.","No.");

                        Report.RunModal(Report::"Update Unit Cost",true,true,ProdOrder);
                    end;
                }
                action("C&opy Prod. Order Document")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'C&opy Prod. Order Document';
                    Ellipsis = true;
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy information from an existing production order record to a new one. This can be done regardless of the status type of the production order. You can, for example, copy from a released production order to a new planned production order. Note that before you start to copy, you have to create the new record.';

                    trigger OnAction()
                    begin
                        CopyProdOrderDoc.SetProdOrder(Rec);
                        CopyProdOrderDoc.RunModal;
                        Clear(CopyProdOrderDoc);
                    end;
                }
            }
            group("&Print")
            {
                Caption = '&Print';
                Image = Print;
                action("Job Card")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Job Card';
                    Ellipsis = true;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'View a list of the work in progress of a production order. Output, scrapped quantity, and production lead time are shown depending on the operation.';

                    trigger OnAction()
                    begin
                        ManuPrintReport.PrintProductionOrder(Rec,0);
                    end;
                }
                action("Mat. &Requisition")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Mat. &Requisition';
                    Ellipsis = true;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'View a list of material requirements per production order. The report shows you the status of the production order, the quantity of end items and components with the corresponding required quantity. You can view the due date and location code of each component.';

                    trigger OnAction()
                    begin
                        ManuPrintReport.PrintProductionOrder(Rec,1);
                    end;
                }
                action("Shortage List")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Shortage List';
                    Ellipsis = true;
                    Image = "Report";
                    ToolTip = 'View a list of the missing quantity per production order. The report shows how the inventory development is planned from today until the set day - for example whether orders are still open.';

                    trigger OnAction()
                    begin
                        ManuPrintReport.PrintProductionOrder(Rec,2);
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Subcontractor - Dispatch List")
            {
                ApplicationArea = Manufacturing;
                Caption = 'Subcontractor - Dispatch List';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Subcontractor - Dispatch List";
                ToolTip = 'View the list of material to be sent to manufacturing subcontractors.';
            }
        }
    }

    var
        CopyProdOrderDoc: Report "Copy Production Order Document";
        ManuPrintReport: Codeunit "Manu. Print Report";

    local procedure StartingTimeOnAfterValidate()
    begin
        CurrPage.Update(false);
    end;

    local procedure StartingDateOnAfterValidate()
    begin
        CurrPage.Update(false);
    end;

    local procedure EndingTimeOnAfterValidate()
    begin
        CurrPage.Update(false);
    end;

    local procedure EndingDateOnAfterValidate()
    begin
        CurrPage.Update(false);
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.ProdOrderLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.ProdOrderLines.Page.UpdateForm(true);
    end;
}
