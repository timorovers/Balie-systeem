page 52030 "Balie Order SubForm"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = BalieOrderLine;


    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(BalieOrderNummer; rec.BalieOrderNummer)
                {
                    Caption = 'Balie ordernummer';
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                    TableRelation = BalieOrderHeader.Balieordernummer;
                }

                field("Line number"; rec."Line number")
                {
                    Caption = 'Line number';
                    ApplicationArea = All;
                    Visible = false;
                }
                field(ItemNo; rec.ItemNo)
                {
                    Caption = 'No';
                    ApplicationArea = All;
                    TableRelation = Item;
                }

                field(Description; rec.Description)
                {
                    Caption = 'Description';
                    //TableRelation = Item;
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }

                field(Quantity; rec.Quantity)
                {
                    Caption = 'Quantity';
                    ApplicationArea = All;
                }

                field("Discount %"; rec."Discount %")
                {
                    Caption = 'Discount %';
                    ApplicationArea = All;
                    DecimalPlaces = 0 : 3;
                    Visible = false;
                }

                field(Price; rec.Price)
                {
                    Caption = 'Price';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                field("Line Amount"; rec."Line Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Line amount';
                    trigger OnValidate()
                    begin
                        if rec.Quantity <> xRec.Quantity then
                            rec."Line Amount" := (rec.Quantity * rec.Price)
                    end;
                }
            }
        }
    }
}
