#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99000771 "Work Ctr. Group Calendar"
{
    Caption = 'Work Ctr. Group Calendar';
    DataCaptionExpression = '';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = Card;
    SaveValues = true;
    SourceTable = "Work Center Group";

    layout
    {
        area(content)
        {
            group("Matrix Options")
            {
                Caption = 'Matrix Options';
                field(PeriodType;PeriodType)
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'View by';
                    OptionCaption = 'Day,Week,Month,Quarter,Year,Accounting Period';
                    ToolTip = 'Specifies by which period amounts are displayed.';

                    trigger OnValidate()
                    begin
                        MATRIX_GenerateColumnCaptions(Setwanted::Initial);
                    end;
                }
                field(CapacityUoM;CapacityUoM)
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Capacity Shown In';
                    TableRelation = "Capacity Unit of Measure".Code;
                    ToolTip = 'Specifies how the capacity is shown (minutes, days, or hours).';
                }
                field(MATRIX_CaptionRange;MATRIX_CaptionRange)
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Column Set';
                    Editable = false;
                    ToolTip = 'Specifies the range of values that are displayed in the matrix window, for example, the total period.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ShowMatrix)
            {
                ApplicationArea = Manufacturing;
                Caption = '&Show Matrix';
                Image = ShowMatrix;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'View the data overview according to the selected filters and options.';

                trigger OnAction()
                var
                    MatrixForm: Page "Work Ctr. Grp. Calendar Matrix";
                begin
                    Clear(MatrixForm);
                    MatrixForm.Load(MATRIX_CaptionSet,MATRIX_MatrixRecords,MATRIX_CurrentSetLenght,CapacityUoM);
                    MatrixForm.SetTableview(Rec);
                    MatrixForm.RunModal;
                end;
            }
            action("Previous Set")
            {
                ApplicationArea = Manufacturing;
                Caption = 'Previous Set';
                Image = PreviousSet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Go to the previous set of data.';

                trigger OnAction()
                begin
                    MATRIX_GenerateColumnCaptions(Matrix_serwanted::Previus);
                end;
            }
            action("Next Set")
            {
                ApplicationArea = Manufacturing;
                Caption = 'Next Set';
                Image = NextSet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Go to the next set of data.';

                trigger OnAction()
                begin
                    MATRIX_GenerateColumnCaptions(Matrix_serwanted::Next);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        MATRIX_GenerateColumnCaptions(Setwanted::Initial);
        MATRIX_UseNameForCaption := false;
        MATRIX_CurrentSetLenght := ArrayLen(MATRIX_CaptionSet);
        MfgSetup.Get;
        MfgSetup.TestField("Show Capacity In");
        CapacityUoM := MfgSetup."Show Capacity In";
    end;

    var
        MATRIX_MatrixRecords: array [32] of Record Date;
        MfgSetup: Record "Manufacturing Setup";
        MatrixMgt: Codeunit "Matrix Management";
        MATRIX_CaptionSet: array [32] of Text[80];
        MATRIX_CaptionRange: Text;
        MATRIX_SerWanted: Option Initial,Previus,Same,Next;
        MATRIX_PrimKeyFirstCaptionInCu: Text;
        MATRIX_CurrentSetLenght: Integer;
        MATRIX_UseNameForCaption: Boolean;
        MATRIX_DateFilter: Text;
        PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period";
        SetWanted: Option Initial,Previus,Same,Next;
        CapacityUoM: Code[10];

    local procedure MATRIX_GenerateColumnCaptions(SetWanted: Option Initial,Previus,Same,Next)
    begin
        MatrixMgt.GeneratePeriodMatrixData(SetWanted,ArrayLen(MATRIX_CaptionSet),MATRIX_UseNameForCaption,PeriodType,MATRIX_DateFilter,
          MATRIX_PrimKeyFirstCaptionInCu,MATRIX_CaptionSet,MATRIX_CaptionRange,MATRIX_CurrentSetLenght,MATRIX_MatrixRecords
          );
    end;
}

