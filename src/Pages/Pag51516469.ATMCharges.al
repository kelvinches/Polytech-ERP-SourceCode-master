#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516469 "ATM Charges"
{
    PageType = List;
    SourceTable = "ATM Charges";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Sacco Amount"; Rec."Sacco Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Atm Income A/c"; Rec."Atm Income A/c")
                {
                    ApplicationArea = Basic;
                }
                field("Atm Bank Settlement A/C"; Rec."Atm Bank Settlement A/C")
                {
                    ApplicationArea = Basic;
                }
                field(Source; Rec.Source)
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

