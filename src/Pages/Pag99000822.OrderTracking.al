#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99000822 "Order Tracking"
{
    Caption = 'Order Tracking';
    DataCaptionExpression = TrackingMgt.GetCaption;
    PageType = Worksheet;
    SourceTable = "Order Tracking Entry";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(CurrItemNo;CurrItemNo)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Item No.';
                    Editable = false;
                    ToolTip = 'Specifies the number of the item related to the order.';
                }
                field(StartingDate;StartingDate)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Starting Date';
                    DecimalPlaces = 0:5;
                    Editable = false;
                    ToolTip = 'Specifies the starting date for the time period for which you want to track the order.';
                }
                field(EndingDate;EndingDate)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Ending Date';
                    DecimalPlaces = 0:5;
                    Editable = false;
                    ToolTip = 'Specifies the end date.';
                }
                field("Total Quantity";CurrQuantity + DerivedTrackingQty)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Quantity';
                    DecimalPlaces = 0:5;
                    Editable = false;
                    ToolTip = 'Specifies the outstanding quantity on the line from which you opened the window.';
                }
                field("Untracked Quantity";CurrUntrackedQuantity + DerivedTrackingQty)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Untracked Quantity';
                    DecimalPlaces = 0:5;
                    Editable = false;
                    ToolTip = 'Specifies the amount of the quantity not directly related to a countering demand or supply by order tracking or reservations.';

                    trigger OnDrillDown()
                    begin
                        if not IsPlanning then
                          Message(Text001)
                        else
                          Transparency.DrillDownUntrackedQty(TrackingMgt.GetCaption);
                    end;
                }
            }
            repeater(Control16)
            {
                Editable = false;
                IndentationColumn = SuppliedByIndent;
                IndentationControls = Name;
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the number of the order tracking entry.';
                    Visible = false;
                }
                field(Name;Name)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the name of the line that the items are tracked from.';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupName;
                    end;
                }
                field("Demanded by";"Demanded by")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the source of the demand that the supply is tracked from.';
                    Visible = DemandedByVisible;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupLine
                    end;
                }
                field("Supplied by";"Supplied by")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the source of the supply that fills the demand you track from, such as, a production order line.';
                    Visible = SuppliedByVisible;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupLine;
                    end;
                }
                field(Warning;Warning)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies there is a date conflict in the order tracking entries for this line.';
                    Visible = false;
                }
                field("Starting Date";"Starting Date")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the starting date of the line that the items are tracked from.';
                }
                field("Ending Date";"Ending Date")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the ending date of the line that the items are tracked from.';
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the quantity, in the base unit of measure, of the item that has been tracked in this entry.';
                }
                field("Shipment Date";"Shipment Date")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                    Visible = false;
                }
                field("Expected Receipt Date";"Expected Receipt Date")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the date when the tracked items are expected to enter the inventory.';
                    Visible = false;
                }
                field("Item No.";"Item No.")
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the number of the item that has been tracked in this entry.';
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
        area(processing)
        {
            action(UntrackedButton)
            {
                ApplicationArea = Planning;
                Caption = '&Untracked Qty.';
                Enabled = UntrackedButtonEnable;
                Image = UntrackedQuantity;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'View the part of the tracked quantity that is not directly related to a demand or supply. ';

                trigger OnAction()
                begin
                    Transparency.DrillDownUntrackedQty(TrackingMgt.GetCaption);
                end;
            }
            action(Show)
            {
                ApplicationArea = Planning;
                Caption = '&Show';
                Image = View;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'View the order tracking details.';

                trigger OnAction()
                begin
                    LookupName;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SuppliedbyOnFormat;
    end;

    trigger OnFindRecord(Which: Text): Boolean
    begin
        exit(TrackingMgt.FindRecord(Which,Rec));
    end;

    trigger OnInit()
    begin
        UntrackedButtonEnable := true;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        exit(TrackingMgt.GetNextRecord(Steps,Rec));
    end;

    trigger OnOpenPage()
    begin
        if not Item.Get(CurrItemNo) then
          Clear(Item);
        TrackingMgt.FindRecords;
        DemandedByVisible := TrackingMgt.IsSearchUp;
        SuppliedByVisible := not TrackingMgt.IsSearchUp;

        CurrUntrackedQuantity := CurrQuantity - TrackingMgt.TrackedQuantity;

        UntrackedButtonEnable := IsPlanning;
    end;

    var
        Item: Record Item;
        TrackingMgt: Codeunit OrderTrackingManagement;
        Transparency: Codeunit "Planning Transparency";
        CurrItemNo: Code[20];
        CurrQuantity: Decimal;
        CurrUntrackedQuantity: Decimal;
        StartingDate: Date;
        EndingDate: Date;
        DerivedTrackingQty: Decimal;
        IsPlanning: Boolean;
        Text001: label 'Information about untracked quantity is only available for calculated planning lines.';
        [InDataSet]
        DemandedByVisible: Boolean;
        [InDataSet]
        SuppliedByVisible: Boolean;
        [InDataSet]
        UntrackedButtonEnable: Boolean;
        [InDataSet]
        SuppliedByIndent: Integer;

    procedure SetSalesLine(var CurrentSalesLine: Record "Sales Line")
    begin
        TrackingMgt.SetSalesLine(CurrentSalesLine);

        CurrItemNo := CurrentSalesLine."No.";
        CurrQuantity := CurrentSalesLine."Outstanding Qty. (Base)";
        StartingDate := CurrentSalesLine."Shipment Date";
        EndingDate := CurrentSalesLine."Shipment Date";
    end;

    procedure SetReqLine(var CurrentReqLine: Record "Requisition Line")
    begin
        TrackingMgt.SetReqLine(CurrentReqLine);

        CurrItemNo := CurrentReqLine."No.";
        CurrQuantity := CurrentReqLine."Quantity (Base)";
        StartingDate := CurrentReqLine."Due Date";
        EndingDate := CurrentReqLine."Due Date";

        IsPlanning := CurrentReqLine."Planning Line Origin" = CurrentReqLine."planning line origin"::Planning;
        if IsPlanning then
          Transparency.SetCurrReqLine(CurrentReqLine);
    end;

    procedure SetPurchLine(var CurrentPurchLine: Record "Purchase Line")
    begin
        TrackingMgt.SetPurchLine(CurrentPurchLine);

        CurrItemNo := CurrentPurchLine."No.";
        CurrQuantity := CurrentPurchLine."Outstanding Qty. (Base)";

        StartingDate := CurrentPurchLine."Expected Receipt Date";
        EndingDate := CurrentPurchLine."Expected Receipt Date";
    end;

    procedure SetProdOrderLine(var CurrentProdOrderLine: Record "Prod. Order Line")
    begin
        TrackingMgt.SetProdOrderLine(CurrentProdOrderLine);

        CurrItemNo := CurrentProdOrderLine."Item No.";
        CurrQuantity := CurrentProdOrderLine."Remaining Qty. (Base)";
        StartingDate := CurrentProdOrderLine."Starting Date";
        EndingDate := CurrentProdOrderLine."Ending Date";
    end;

    procedure SetProdOrderComponent(var CurrentProdOrderComp: Record "Prod. Order Component")
    begin
        TrackingMgt.SetProdOrderComp(CurrentProdOrderComp);

        CurrItemNo := CurrentProdOrderComp."Item No.";
        CurrQuantity := CurrentProdOrderComp."Remaining Qty. (Base)";

        StartingDate := CurrentProdOrderComp."Due Date";
        EndingDate := CurrentProdOrderComp."Due Date";
    end;

    procedure SetAsmHeader(var CurrentAsmHeader: Record "Assembly Header")
    begin
        TrackingMgt.SetAsmHeader(CurrentAsmHeader);

        CurrItemNo := CurrentAsmHeader."Item No.";
        CurrQuantity := CurrentAsmHeader."Remaining Quantity (Base)";

        StartingDate := CurrentAsmHeader."Due Date";
        EndingDate := CurrentAsmHeader."Due Date";
    end;

    procedure SetAsmLine(var CurrentAsmLine: Record "Assembly Line")
    begin
        TrackingMgt.SetAsmLine(CurrentAsmLine);

        CurrItemNo := CurrentAsmLine."No.";
        CurrQuantity := CurrentAsmLine."Remaining Quantity (Base)";
        StartingDate := CurrentAsmLine."Due Date";
        EndingDate := CurrentAsmLine."Due Date";
    end;

    procedure SetPlanningComponent(var CurrentPlanningComponent: Record "Planning Component")
    begin
        TrackingMgt.SetPlanningComponent(CurrentPlanningComponent);

        CurrItemNo := CurrentPlanningComponent."Item No.";
        DerivedTrackingQty := CurrentPlanningComponent."Expected Quantity (Base)" - CurrentPlanningComponent."Net Quantity (Base)";
        CurrQuantity := CurrentPlanningComponent."Net Quantity (Base)";
        StartingDate := CurrentPlanningComponent."Due Date";
        EndingDate := CurrentPlanningComponent."Due Date";
    end;

    procedure SetItemLedgEntry(var CurrentItemLedgEntry: Record "Item Ledger Entry")
    begin
        TrackingMgt.SetItemLedgEntry(CurrentItemLedgEntry);

        CurrItemNo := CurrentItemLedgEntry."Item No.";
        CurrQuantity := CurrentItemLedgEntry."Remaining Quantity";
        StartingDate := CurrentItemLedgEntry."Posting Date";
        EndingDate := CurrentItemLedgEntry."Posting Date";
    end;

    procedure SetMultipleItemLedgEntries(var TempItemLedgEntry: Record "Item Ledger Entry" temporary;SourceType: Integer;SourceSubtype: Integer;SourceID: Code[20];SourceBatchName: Code[10];SourceProdOrderLine: Integer;SourceRefNo: Integer)
    begin
        // Used from posted shipment and receipt with item tracking.

        TrackingMgt.SetMultipleItemLedgEntries(TempItemLedgEntry,SourceType,SourceSubtype,SourceID,
          SourceBatchName,SourceProdOrderLine,SourceRefNo);

        TempItemLedgEntry.CalcSums(TempItemLedgEntry."Remaining Quantity");

        CurrItemNo := TempItemLedgEntry."Item No.";
        CurrQuantity := TempItemLedgEntry."Remaining Quantity";
        StartingDate := TempItemLedgEntry."Posting Date";
        EndingDate := TempItemLedgEntry."Posting Date";
    end;

    procedure SetServLine(var CurrentServLine: Record "Service Line")
    begin
        TrackingMgt.SetServLine(CurrentServLine);

        CurrItemNo := CurrentServLine."No.";
        CurrQuantity := CurrentServLine."Outstanding Qty. (Base)";
        StartingDate := CurrentServLine."Needed by Date";
        EndingDate := CurrentServLine."Needed by Date";
    end;

    procedure SetJobPlanningLine(var CurrentJobPlanningLine: Record "Job Planning Line")
    begin
        TrackingMgt.SetJobPlanningLine(CurrentJobPlanningLine);

        CurrItemNo := CurrentJobPlanningLine."No.";
        CurrQuantity := CurrentJobPlanningLine."Remaining Qty. (Base)";
        StartingDate := CurrentJobPlanningLine."Planning Date";
        EndingDate := CurrentJobPlanningLine."Planning Date";
    end;

    local procedure LookupLine()
    var
        ReservationMgt: Codeunit "Reservation Management";
    begin
        ReservationMgt.LookupLine("For Type","For Subtype","For ID","For Batch Name",
          "For Prod. Order Line","For Ref. No.");
    end;

    local procedure LookupName()
    var
        ReservationMgt: Codeunit "Reservation Management";
    begin
        ReservationMgt.LookupDocument("From Type","From Subtype","From ID","From Batch Name",
          "From Prod. Order Line","From Ref. No.");
    end;

    local procedure SuppliedbyOnFormat()
    begin
        SuppliedByIndent := Level - 1;
    end;
}

