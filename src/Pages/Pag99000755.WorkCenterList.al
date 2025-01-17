#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99000755 "Work Center List"
{
    Caption = 'Work Center List';
    CardPageID = "Work Center Card";
    Editable = false;
    PageType = List;
    SourceTable = "Work Center";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of the work center.';
                }
                field(Name;Name)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the name of the work center.';
                }
                field("Alternate Work Center";"Alternate Work Center")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies an alternate work center.';
                }
                field("Work Center Group Code";"Work Center Group Code")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the work center group, if the work center or underlying machine center is assigned to a work center group.';
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    Visible = false;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    Visible = false;
                }
                field("Direct Unit Cost";"Direct Unit Cost")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the cost of one unit of the selected item or resource.';
                    Visible = false;
                }
                field("Indirect Cost %";"Indirect Cost %")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the percentage of the center''s cost that includes indirect costs, such as machine maintenance.';
                    Visible = false;
                }
                field("Unit Cost";"Unit Cost")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the unit cost at one unit of measure for the machine center.';
                    Visible = false;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field(Capacity;Capacity)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the amount of work that can be done in a specified time period. The capacity of a work center indicates how many machines or persons are working at the same time. If you enter 2, for example, the work center will take half of the time compared to a work center with the capacity of 1. ';
                }
                field(Efficiency;Efficiency)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the efficiency factor as a percentage of the work center.';
                    Visible = false;
                }
                field("Maximum Efficiency";"Maximum Efficiency")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the maximum efficiency factor of the work center.';
                    Visible = false;
                }
                field("Minimum Efficiency";"Minimum Efficiency")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the minimum efficiency factor of the work center.';
                    Visible = false;
                }
                field("Simulation Type";"Simulation Type")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the simulation type for the work center.';
                    Visible = false;
                }
                field("Shop Calendar Code";"Shop Calendar Code")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the shop calendar code that the planning of this work center refers to.';
                }
                field("Search Name";"Search Name")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the search name for the work center.';
                }
                field("Overhead Rate";"Overhead Rate")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the overhead rate of this work center.';
                    Visible = false;
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies when the work center card was last modified.';
                    Visible = false;
                }
                field("Flushing Method";"Flushing Method")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies how consumption of the item (component) is calculated and handled in production processes. Manual: Enter and post consumption in the consumption journal manually. Forward: Automatically posts consumption according to the production order component lines when the first operation starts. Backward: Automatically calculates and posts consumption according to the production order component lines when the production order is finished. Pick + Forward / Pick + Backward: Variations with warehousing.';
                    Visible = false;
                }
                field("Subcontractor No.";"Subcontractor No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of a subcontractor who supplies this work center.';
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
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID"=const(99000754),
                                      "No."=field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                        ToolTip = 'View or edit the single set of dimensions that are set up for the selected record.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = TableData Dimension=R;
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'View or edit dimensions for a group of records. You can assign dimension codes to transactions to distribute costs and analyze historical information.';

                        trigger OnAction()
                        var
                            Work: Record "Work Center";
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Work);
                            DefaultDimMultiple.SetMultiWorkCenter(Work);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action("Lo&ad")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Lo&ad';
                    Image = WorkCenterLoad;
                    RunObject = Page "Work Center Load";
                    RunPageLink = "No."=field("No.");
                    RunPageView = sorting("No.");
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
                    ToolTip = 'View which working days are not available. ';
                }
                action("Ta&sk List")
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Ta&sk List';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
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
        area(processing)
        {
            action("Calculate Work Center Calendar")
            {
                ApplicationArea = Manufacturing;
                Caption = 'Calculate Work Center Calendar';
                Image = CalcWorkCenterCalendar;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Calculate Work Center Calendar";
                ToolTip = 'Create new calendar entries for the work center to define the available daily capacity.';
            }
        }
        area(reporting)
        {
            action("Work Center List")
            {
                ApplicationArea = Manufacturing;
                Caption = 'Work Center List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Work Center List";
                ToolTip = 'View or edit the list of work centers.';
            }
            action("Work Center Load")
            {
                ApplicationArea = Manufacturing;
                Caption = 'Work Center Load';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Work Center Load";
                ToolTip = 'Get an overview of availability at the work center, such as the capacity, the allocated quantity, availability after order, and the load in percent.';
            }
            action("Work Center Load/Bar")
            {
                ApplicationArea = Manufacturing;
                Caption = 'Work Center Load/Bar';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Work Center Load/Bar";
                ToolTip = 'View a list of work centers that are overloaded according to the plan. The efficiency or overloading is shown by efficiency bars.';
            }
        }
    }
}

