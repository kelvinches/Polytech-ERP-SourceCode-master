#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99000959 "Order Promising Lines"
{
    Caption = 'Order Promising Lines';
    DataCaptionExpression = AvailabilityMgt.GetCaption;
    InsertAllowed = false;
    PageType = Worksheet;
    RefreshOnActivate = true;
    SourceTable = "Order Promising Line";
    SourceTableTemporary = true;
    SourceTableView = sorting("Requested Shipment Date");

    layout
    {
        area(content)
        {
            group(Control17)
            {
                field(CrntSourceID;CrntSourceID)
                {
                    ApplicationArea = OrderPromising;
                    Caption = 'No.';
                    Editable = false;
                    ToolTip = 'Specifies the number of the item.';
                }
            }
            repeater(Control16)
            {
                Editable = true;
                field("Item No.";"Item No.")
                {
                    ApplicationArea = OrderPromising;
                    Editable = false;
                    ToolTip = 'Specifies the item number of the item that is on the promised order.';
                }
                field(Description;Description)
                {
                    ApplicationArea = OrderPromising;
                    Editable = false;
                    ToolTip = 'Specifies the description of the entry.';
                }
                field("Requested Delivery Date";"Requested Delivery Date")
                {
                    ApplicationArea = OrderPromising;
                    Editable = false;
                    ToolTip = 'Specifies the requested delivery date for the entry.';
                }
                field("Requested Shipment Date";"Requested Shipment Date")
                {
                    ApplicationArea = OrderPromising;
                    ToolTip = 'Specifies the delivery date that the customer requested, minus the shipping time.';
                }
                field("Planned Delivery Date";"Planned Delivery Date")
                {
                    ApplicationArea = OrderPromising;
                    ToolTip = 'Specifies the planned date that the shipment will be delivered at the customer''s address. If the customer requests a delivery date, the program calculates whether the items will be available for delivery on this date. If the items are available, the planned delivery date will be the same as the requested delivery date. If not, the program calculates the date that the items are available for delivery and enters this date in the Planned Delivery Date field.';
                }
                field("Original Shipment Date";"Original Shipment Date")
                {
                    ApplicationArea = OrderPromising;
                    Editable = false;
                    ToolTip = 'Specifies the shipment date of the entry.';
                }
                field("Earliest Shipment Date";"Earliest Shipment Date")
                {
                    ApplicationArea = OrderPromising;
                    ToolTip = 'Specifies the Capable to Promise function as the earliest possible shipment date for the item.';
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = OrderPromising;
                    Editable = false;
                    ToolTip = 'Specifies the number of units, calculated by subtracting the reserved quantity from the outstanding quantity in the Sales Line table.';
                }
                field("Required Quantity";"Required Quantity")
                {
                    ApplicationArea = OrderPromising;
                    Editable = false;
                    ToolTip = 'Specifies the quantity required for order promising lines.';
                }
                field(CalcAvailability;CalcAvailability)
                {
                    ApplicationArea = OrderPromising;
                    Caption = 'Availability';
                    DecimalPlaces = 0:5;
                    ToolTip = 'Specifies how many units of the item on the order promising line are available.';
                }
                field("Unavailability Date";"Unavailability Date")
                {
                    ApplicationArea = OrderPromising;
                    Editable = false;
                    ToolTip = 'Specifies the date when the order promising line is no longer available.';
                }
                field("Unavailable Quantity";"Unavailable Quantity")
                {
                    ApplicationArea = OrderPromising;
                    Editable = false;
                    ToolTip = 'Specifies the quantity of items that are not available for the requested delivery date on the order.';
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = OrderPromising;
                    Editable = false;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
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
            group("&Calculate")
            {
                Caption = '&Calculate';
                Image = Calculate;
                action(AvailableToPromise)
                {
                    ApplicationArea = OrderPromising;
                    Caption = 'Available-to-Promise';
                    Image = AvailableToPromise;
                    ToolTip = 'Calculate the delivery date of the customer''s order because the items are available, either in inventory or on planned receipts, based on the reservation system. The function performs an availability check of the unreserved quantities in inventory with regard to planned production, purchases, transfers, and sales returns.';

                    trigger OnAction()
                    begin
                        CheckCalculationDone;
                        AvailabilityMgt.CalcAvailableToPromise(Rec);
                    end;
                }
                action(CapableToPromise)
                {
                    ApplicationArea = OrderPromising;
                    Caption = 'Capable-to-Promise';
                    Image = CapableToPromise;
                    ToolTip = 'Calculate the earliest date that the item can be available if it is to be produced, purchased, or transferred, assuming that the item is not in inventory and no orders are scheduled. This function is useful for "what if" scenarios.';

                    trigger OnAction()
                    begin
                        CheckCalculationDone;
                        AvailabilityMgt.CalcCapableToPromise(Rec,CrntSourceID);
                    end;
                }
            }
        }
        area(processing)
        {
            action(AcceptButton)
            {
                ApplicationArea = OrderPromising;
                Caption = '&Accept';
                Enabled = AcceptButtonEnable;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Accept the earliest shipment date available.';

                trigger OnAction()
                var
                    ReqLine: Record "Requisition Line";
                begin
                    Accepted := true;
                    AvailabilityMgt.UpdateSource(Rec);
                    ReqLine.SetCurrentkey("Order Promising ID","Order Promising Line ID","Order Promising Line No.");
                    ReqLine.SetRange("Order Promising ID",CrntSourceID);
                    ReqLine.ModifyAll("Accept Action Message",true);
                    CurrPage.Close;
                end;
            }
        }
    }

    trigger OnClosePage()
    var
        CapableToPromise: Codeunit "Capable to Promise";
    begin
        if Accepted = false then
          CapableToPromise.RemoveReqLines(CrntSourceID,0,0,true);
    end;

    trigger OnInit()
    begin
        AcceptButtonEnable := true;
    end;

    trigger OnOpenPage()
    var
        SalesHeader: Record "Sales Header";
        ServHeader: Record "Service Header";
        Job: Record Job;
    begin
        OrderPromisingCalculationDone := false;
        Accepted := false;
        if GetFilter("Source ID") <> '' then
          case CrntSourceType of
            "source type"::"Service Order":
              begin
                ServHeader."Document Type" := ServHeader."document type"::Order;
                ServHeader."No." := GetRangeMin("Source ID");
                ServHeader.Find;
                SetServHeader(ServHeader);
              end;
            "source type"::Job:
              begin
                Job.Status := Job.Status::Open;
                Job."No." := GetRangeMin("Source ID");
                Job.Find;
                SetJob(Job);
              end;
            else
              SalesHeader."Document Type" := SalesHeader."document type"::Order;
              SalesHeader."No." := GetRangeMin("Source ID");
              SalesHeader.Find;
              SetSalesHeader(SalesHeader);
              AcceptButtonEnable := SalesHeader.Status = SalesHeader.Status::Open;
          end;
    end;

    var
        AvailabilityMgt: Codeunit AvailabilityManagement;
        Accepted: Boolean;
        CrntSourceID: Code[20];
        CrntSourceType: Option " ",Sales,"Requisition Line",Purchase,"Item Journal","BOM Journal","Item Ledger Entry","Prod. Order Line","Prod. Order Component","Planning Line","Planning Component",Transfer,"Service Order",Job;
        [InDataSet]
        AcceptButtonEnable: Boolean;
        OrderPromisingCalculationDone: Boolean;
        Text000: label 'The order promising lines are already calculated. You must close and open the window again to perform a new calculation.';

    procedure SetSalesHeader(var CrntSalesHeader: Record "Sales Header")
    begin
        AvailabilityMgt.SetSalesHeader(Rec,CrntSalesHeader);

        CrntSourceType := Crntsourcetype::Sales;
        CrntSourceID := CrntSalesHeader."No.";
    end;

    procedure SetServHeader(var CrntServHeader: Record "Service Header")
    begin
        AvailabilityMgt.SetServHeader(Rec,CrntServHeader);

        CrntSourceType := Crntsourcetype::"Service Order";
        CrntSourceID := CrntServHeader."No.";
    end;

    procedure SetJob(var CrntJob: Record Job)
    begin
        AvailabilityMgt.SetJob(Rec,CrntJob);
        CrntSourceType := Crntsourcetype::Job;
        CrntSourceID := CrntJob."No.";
    end;

    procedure SetSourceType(SourceType: Option)
    begin
        CrntSourceType := SourceType;
    end;

    local procedure CheckCalculationDone()
    begin
        if OrderPromisingCalculationDone then
          Error(Text000);
        OrderPromisingCalculationDone := true;
    end;
}

