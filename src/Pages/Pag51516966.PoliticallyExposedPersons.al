#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516966 "Politically Exposed Persons"
{
    PageType = List;
    SourceTable = 51516918;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field("County Code"; "County Code")
                {
                    ApplicationArea = Basic;
                }
                field("County Name"; "County Name")
                {
                    ApplicationArea = Basic;
                }
                field("ID/Passport No"; "ID/Passport No")
                {
                    ApplicationArea = Basic;
                }
                field("Position Runing For"; "Position Runing For")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

