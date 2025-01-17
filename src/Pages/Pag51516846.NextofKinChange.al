#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51516846 "Next of Kin-Change"
{
    PageType = ListPart;
    SourceTable = 51516353;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Date of Birth"; "Date of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field(Telephone; Telephone)
                {
                    ApplicationArea = Basic;
                }
                field(Fax; Fax)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                }
                field("ID No."; "ID No.")
                {
                    ApplicationArea = Basic;
                }
                field("%Allocation"; "%Allocation")
                {
                    ApplicationArea = Basic;
                }
                field("Total Allocation"; "Total Allocation")
                {
                    ApplicationArea = Basic;
                }
                field("Maximun Allocation %"; "Maximun Allocation %")
                {
                    ApplicationArea = Basic;
                }
                field(Age; Age)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Populate)
            {
                ApplicationArea = Basic;
                Caption = 'Populate';
                Image = GetLines;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Message('12345');
                end;
            }
        }
    }

    var
        ProductNxK: Record 51516433;
        MembNxK: Record 51516366;
        cloudRequest: Record 51516350;
}

