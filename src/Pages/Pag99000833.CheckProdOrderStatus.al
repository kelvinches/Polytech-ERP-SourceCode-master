#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 99000833 "Check Prod. Order Status"
{
    Caption = 'Check Prod. Order Status';
    DataCaptionExpression = '';
    DeleteAllowed = false;
    InsertAllowed = false;
    InstructionalText = 'This sales line is currently planned. Your changes will not cause any replanning, so you must manually update the production order if necessary. Do you still want to record the changes?';
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = ConfirmationDialog;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            group(Details)
            {
                Caption = 'Details';
                field("No.";"No.")
                {
                    ApplicationArea = Manufacturing;
                    Editable = false;
                    ToolTip = 'Specifies the number of the item.';
                }
                field(Description;Description)
                {
                    ApplicationArea = Manufacturing;
                    Editable = false;
                    ToolTip = 'Specifies a description of the item.';
                }
                field(LastStatus;LastStatus)
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Last Status';
                    Editable = false;
                    OptionCaption = 'Simulated,Planned,Firm Planned,Released';
                }
                field(LastOrderType;LastOrderType)
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Last Order Type';
                    Editable = false;
                    OptionCaption = 'Production,Purchase';
                }
                field(LastOrderNo;LastOrderNo)
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Last Order No.';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    var
        MfgSetup: Record "Manufacturing Setup";
        LastStatus: Option Simulated,Planned,"Firm Planned",Released;
        LastOrderType: Option Production,Purchase;
        LastOrderNo: Code[20];

    procedure SalesLineShowWarning(SalesLine: Record "Sales Line"): Boolean
    var
        SalesLine2: Record "Sales Line";
        ReservEntry: Record "Reservation Entry";
        ReservEntry2: Record "Reservation Entry";
        ProdOrderLine: Record "Prod. Order Line";
        ReserveSalesLine: Codeunit "Sales Line-Reserve";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
    begin
        if SalesLine."Drop Shipment" then
          exit(false);

        MfgSetup.Get;
        if not MfgSetup."Planning Warning" then
          exit(false);

        if not SalesLine2.Get(
             SalesLine."Document Type",
             SalesLine."Document No.",
             SalesLine."Line No.")
        then
          exit;

        if (SalesLine2.Type <> SalesLine2.Type::Item) or
           (SalesLine2."No." = '') or
           (SalesLine2."Outstanding Quantity" <= 0)
        then
          exit;

        ReservEntry."Source Type" := Database::"Sales Line";
        ReservEntry."Source Subtype" := SalesLine2."Document Type";
        ReservEntry."Item No." := SalesLine2."No.";
        ReservEntry."Variant Code" := SalesLine2."Variant Code";
        ReservEntry."Location Code" := SalesLine2."Location Code";
        ReservEntry."Expected Receipt Date" := SalesLine2."Shipment Date";

        ReservEngineMgt.InitFilterAndSortingFor(ReservEntry,true);
        ReserveSalesLine.FilterReservFor(ReservEntry,SalesLine2);

        if ReservEntry.FindSet then
          repeat
            if ReservEntry2.Get(ReservEntry."Entry No.",not ReservEntry.Positive) then
              case ReservEntry2."Source Type" of
                Database::"Prod. Order Line":
                  if ReservEntry2."Source Subtype" <> 1 then begin
                    ProdOrderLine.Get(
                      ReservEntry2."Source Subtype",ReservEntry2."Source ID",ReservEntry2."Source Prod. Order Line");
                    LastStatus := ProdOrderLine.Status;
                    LastOrderNo := ProdOrderLine."Prod. Order No.";
                    LastOrderType := Lastordertype::Production;
                    exit(true);
                  end;
              end;
          until ReservEntry.Next = 0;

        exit(false);
    end;
}

