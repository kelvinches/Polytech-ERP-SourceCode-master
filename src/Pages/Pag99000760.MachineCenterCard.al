#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99000760 "Machine Center Card"
{
    Caption = 'Machine Center Card';
    PageType = Card;
    SourceTable = "Machine Center";

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
                    ToolTip = 'Specifies the number of the machine center.';

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                          CurrPage.Update;
                    end;
                }
                field(Name;Name)
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies a name for the machine center.';
                }
                field("Work Center No.";"Work Center No.")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the work center to assign this machine center to.';

                    trigger OnValidate()
                    begin
                        UpdateEnabled;
                    end;
                }
                field("Search Name";"Search Name")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the search name for the machine center.';
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies whether the machine center account is blocked.';
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies when the machine center card was last modified.';
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                field("Direct Unit Cost";"Direct Unit Cost")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the cost of one unit of the selected item or resource.';
                }
                field("Indirect Cost %";"Indirect Cost %")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the percentage of the center''s cost that includes indirect costs, such as machine maintenance.';
                }
                field("Overhead Rate";"Overhead Rate")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the overhead rate of this machine center.';
                }
                field("Unit Cost";"Unit Cost")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the unit cost at one unit of measure for the machine center.';
                }
                field("Flushing Method";"Flushing Method")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies how consumption of the item (component) is calculated and handled in production processes. Manual: Enter and post consumption in the consumption journal manually. Forward: Automatically posts consumption according to the production order component lines when the first operation starts. Backward: Automatically calculates and posts consumption according to the production order component lines when the production order is finished. Pick + Forward / Pick + Backward: Variations with warehousing.';
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                }
            }
            group(Scheduling)
            {
                Caption = 'Scheduling';
                field(Capacity;Capacity)
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the capacity of the machine center.';
                }
                field(Efficiency;Efficiency)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the efficiency factor as a percentage of the machine center.';
                }
                field("Queue Time";"Queue Time")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the queue time of the machine center.';
                }
                field("Queue Time Unit of Meas. Code";"Queue Time Unit of Meas. Code")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the queue time unit of measure code.';
                }
            }
            group("Routing Setup")
            {
                Caption = 'Routing Setup';
                field("Setup Time";"Setup Time")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies how long it takes to set up the machine.';
                }
                field("Wait Time";"Wait Time")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the time a job remains at the machine center after an operation is completed, until it is moved to the next operation.';
                }
                field("Move Time";"Move Time")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the move time required for a production lot on this machine.';
                }
                field("Fixed Scrap Quantity";"Fixed Scrap Quantity")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the fixed scrap quantity.';
                }
                field("Scrap %";"Scrap %")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the scrap in percent.';
                }
                field("Send-Ahead Quantity";"Send-Ahead Quantity")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the send-ahead quantity.';
                }
                field("Minimum Process Time";"Minimum Process Time")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the minimum process time of the machine center.';
                }
                field("Maximum Process Time";"Maximum Process Time")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the maximum process time of the machine center.';
                }
                field("Concurrent Capacities";"Concurrent Capacities")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies how much available capacity must be concurrently planned for one operation at this machine center.';
                }
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location where the machine center operates by default.';

                    trigger OnValidate()
                    begin
                        UpdateEnabled;
                    end;
                }
                field("Open Shop Floor Bin Code";"Open Shop Floor Bin Code")
                {
                    ApplicationArea = Warehouse;
                    Enabled = OpenShopFloorBinCodeEnable;
                    ToolTip = 'Specifies the bin that functions as the default open shop floor bin at the work center.';
                }
                field("To-Production Bin Code";"To-Production Bin Code")
                {
                    ApplicationArea = Warehouse;
                    Enabled = ToProductionBinCodeEnable;
                    ToolTip = 'Specifies the bin where components picked for production are placed by default before they can be consumed.';
                }
                field("From-Production Bin Code";"From-Production Bin Code")
                {
                    ApplicationArea = Warehouse;
                    Enabled = FromProductionBinCodeEnable;
                    ToolTip = 'Specifies the bin where finished end items are taken from by default when the process involves warehouse activity.';
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
            group("&Mach. Ctr.")
            {
                Caption = '&Mach. Ctr.';
                Image = MachineCenter;
                action("Capacity Ledger E&ntries")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Capacity Ledger E&ntries';
                    Image = CapacityLedger;
                    RunObject = Page "Capacity Ledger Entries";
                    RunPageLink = Type=const("Machine Center"),
                                  "No."=field("No."),
                                  "Posting Date"=field("Date Filter");
                    RunPageView = sorting(Type,"No.","Work Shift Code","Item No.","Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the capacity ledger entries of the involved production order. Capacity is recorded either as time (run time, stop time, or setup time) or as quantity (scrap quantity or output quantity).';
                }
                action("Co&mments")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Manufacturing Comment Sheet";
                    RunPageLink = "No."=field("No.");
                    RunPageView = where("Table Name"=const("Machine Center"));
                    ToolTip = 'View or add comments for the record.';
                }
                action("Lo&ad")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Lo&ad';
                    Image = WorkCenterLoad;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Machine Center Load";
                    RunPageLink = "No."=field("No."),
                                  "Work Shift Filter"=field("Work Shift Filter");
                    ToolTip = 'View the availability of the machine or work center, including its capacity, the allocated quantity, availability after orders, and the load in percent of its total capacity.';
                }
                action(Statistics)
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Machine Center Statistics";
                    RunPageLink = "No."=field("No."),
                                  "Date Filter"=field("Date Filter"),
                                  "Work Shift Filter"=field("Work Shift Filter");
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                }
            }
            group("Pla&nning")
            {
                Caption = 'Pla&nning';
                Image = Planning;
                action("&Calendar")
                {
                    ApplicationArea = Manufacturing;
                    Caption = '&Calendar';
                    Image = MachineCenterCalendar;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Machine Center Calendar";
                    ToolTip = 'Open the shop calendar, for example to see the load.';
                }
                action("A&bsence")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'A&bsence';
                    Image = WorkCenterAbsence;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Capacity Absence";
                    RunPageLink = "Capacity Type"=const("Machine Center"),
                                  "No."=field("No."),
                                  Date=field("Date Filter");
                    ToolTip = 'View which working days are not available. ';
                }
                action("Ta&sk List")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Ta&sk List';
                    Image = TaskList;
                    RunObject = Page "Machine Center Task List";
                    RunPageLink = "No."=field("No.");
                    RunPageView = sorting(Type,"No.")
                                  where(Type=const("Machine Center"),
                                        Status=filter(..Released),
                                        "Routing Status"=filter(<>Finished));
                    ToolTip = 'View the list of operations that are scheduled for the machine center.';
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateEnabled;
    end;

    trigger OnInit()
    begin
        FromProductionBinCodeEnable := true;
        ToProductionBinCodeEnable := true;
        OpenShopFloorBinCodeEnable := true;
    end;

    trigger OnOpenPage()
    begin
        OnActivateForm;
    end;

    var
        [InDataSet]
        OpenShopFloorBinCodeEnable: Boolean;
        [InDataSet]
        ToProductionBinCodeEnable: Boolean;
        [InDataSet]
        FromProductionBinCodeEnable: Boolean;

    local procedure UpdateEnabled()
    var
        Location: Record Location;
        EditEnabled: Boolean;
    begin
        if "Location Code" <> '' then
          Location.Get("Location Code");

        EditEnabled := ("Location Code" <> '') and Location."Bin Mandatory";
        OpenShopFloorBinCodeEnable := EditEnabled;
        ToProductionBinCodeEnable := EditEnabled;
        FromProductionBinCodeEnable := EditEnabled;
    end;

    local procedure OnActivateForm()
    begin
        UpdateEnabled;
    end;
}
