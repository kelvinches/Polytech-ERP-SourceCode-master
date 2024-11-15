#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516166 "HR Appr Individual Target List"
{
    CardPageID = 55553;
    PageType = List;
    SourceTable = "HR Appraisal Header";
    SourceTableView = where("Target Type" = filter("Individual Targets"),
                            Supervisor = filter("USER NAME"),
                            Sent = filter(Supervisor));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = Basic;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                }
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
            }
            systempart(Control12; Notes)
            {
            }
            systempart(Control13; MyNotes)
            {
            }
            systempart(Control14; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Approve All Individual Targets")
            {
                ApplicationArea = Basic;
            }
            action("Approve Marked Targets")
            {
                ApplicationArea = Basic;
            }
            action("Return All Individual Targets")
            {
                ApplicationArea = Basic;
            }
            action("Return Marked Targets")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

