#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99000754 "Work Center Card"
{
    Caption = 'Work Center Card';
    PageType = Card;
    SourceTable = "Work Center";

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
                    ToolTip = 'Specifies the number of the work center.';

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
                    ToolTip = 'Specifies the name of the work center.';
                }
                field("Work Center Group Code";"Work Center Group Code")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the work center group, if the work center or underlying machine center is assigned to a work center group.';
                }
                field("Alternate Work Center";"Alternate Work Center")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies an alternate work center.';
                }
                field("Search Name";"Search Name")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the search name for the work center.';
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies whether the work center account is blocked.';
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies when the work center card was last modified.';
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
                    ToolTip = 'Specifies the overhead rate of this work center.';
                }
                field("Unit Cost";"Unit Cost")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the unit cost at one unit of measure for the machine center.';
                }
                field("Unit Cost Calculation";"Unit Cost Calculation")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the unit cost calculation that is to be made.';
                }
                field("Specific Unit Cost";"Specific Unit Cost")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies where to define the unit costs.';
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Subcontractor No.";"Subcontractor No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of a subcontractor who supplies this work center.';
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
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field(Capacity;Capacity)
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the capacity of the work center.';
                }
                field(Efficiency;Efficiency)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the efficiency factor as a percentage of the work center.';
                }
                field("Consolidated Calendar";"Consolidated Calendar")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies whether the consolidated calendar is used.';
                }
                field("Shop Calendar Code";"Shop Calendar Code")
                {
                    ApplicationArea = Manufacturing;
                    Importance = Promoted;
                    ToolTip = 'Specifies the shop calendar code that the planning of this work center refers to.';
                }
                field("Queue Time";"Queue Time")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the queue time of the work center.';
                }
                field("Queue Time Unit of Meas. Code";"Queue Time Unit of Meas. Code")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the queue time unit of measure code.';
                }
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location where the work center operates by default.';

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
                    ToolTip = 'Specifies the bin in the production area where components that are picked for production are placed by default before they can be consumed.';
                }
                field("From-Production Bin Code";"From-Production Bin Code")
                {
                    ApplicationArea = Warehouse;
                    Enabled = FromProductionBinCodeEnable;
                    ToolTip = 'Specifies the bin in the production area where finished end items are taken by default when the process involves warehouse activity.';
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
            group("Wor&k Ctr.")
            {
                Caption = 'Wor&k Ctr.';
                Image = WorkCenter;
                action("Capacity Ledger E&ntries")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Capacity Ledger E&ntries';
                    Image = CapacityLedger;
                    RunObject = Page "Capacity Ledger Entries";
                    RunPageLink = "Work Center No."=field("No."),
                                  "Posting Date"=field("Date Filter");
                    RunPageView = sorting("Work Center No.","Work Shift Code","Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the capacity ledger entries of the involved production order. Capacity is recorded either as time (run time, stop time, or setup time) or as quantity (scrap quantity or output quantity).';
                }
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID"=const(99000754),
                                  "No."=field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Manufacturing Comment Sheet";
                    RunPageLink = "No."=field("No.");
                    RunPageView = where("Table Name"=const("Work Center"));
                    ToolTip = 'View or add comments for the record.';
                }
                action("Lo&ad")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Lo&ad';
                    Image = WorkCenterLoad;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Work Center Load";
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
                    RunObject = Page "Work Center Statistics";
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
                    RunObject = Page "Work Center Calendar";
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
                    RunPageLink = "Capacity Type"=const("Work Center"),
                                  "No."=field("No."),
                                  Date=field("Date Filter");
                    RunPageView = sorting("Capacity Type","No.",Date,"Starting Time");
                    ToolTip = 'View which working days are not available. ';
                }
                action("Ta&sk List")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Ta&sk List';
                    Image = TaskList;
                    RunObject = Page "Work Center Task List";
                    RunPageLink = "No."=field("No.");
                    RunPageView = sorting(Type,"No.")
                                  where(Type=const("Work Center"),
                                        Status=filter(..Released),
                                        "Routing Status"=filter(<>Finished));
                    ToolTip = 'View the list of operations that are scheduled for the work center.';
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
    begin
        if "Location Code" <> '' then
          Location.Get("Location Code");

        OpenShopFloorBinCodeEnable := Location."Bin Mandatory";
        ToProductionBinCodeEnable := Location."Bin Mandatory";
        FromProductionBinCodeEnable := Location."Bin Mandatory";
    end;

    local procedure OnActivateForm()
    begin
        UpdateEnabled;
    end;
}

