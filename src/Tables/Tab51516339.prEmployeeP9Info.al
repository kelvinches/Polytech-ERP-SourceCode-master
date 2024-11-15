#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51516339 "prEmployee P9 Info"
{
    DrillDownPageID = 51516204;
    LookupPageID = 51516204;

    fields
    {
        field(1; "Employee Code"; Code[10])
        {
            TableRelation = "HR Employees"."No.";
        }
        field(2; "Basic Pay"; Decimal)
        {
        }
        field(3; Allowances; Decimal)
        {
        }
        field(4; Benefits; Decimal)
        {
        }
        field(5; "Value Of Quarters"; Decimal)
        {
        }
        field(6; "Defined Contribution"; Decimal)
        {
        }
        field(7; "Owner Occupier Interest"; Decimal)
        {
        }
        field(8; "Gross Pay"; Decimal)
        {
        }
        field(9; "Taxable Pay"; Decimal)
        {
        }
        field(10; "Tax Charged"; Decimal)
        {
        }
        field(11; "Insurance Relief"; Decimal)
        {
        }
        field(12; "Tax Relief"; Decimal)
        {
        }
        field(13; PAYE; Decimal)
        {
        }
        field(14; NSSF; Decimal)
        {
        }
        field(15; NHIF; Decimal)
        {
        }
        field(16; Deductions; Decimal)
        {
        }
        field(17; "Net Pay"; Decimal)
        {
        }
        field(18; "Period Month"; Integer)
        {
        }
        field(19; "Period Year"; Integer)
        {
        }
        field(20; "Payroll Period"; Date)
        {
            TableRelation = "Payroll Calender."."Date Opened";
        }
        field(21; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll Calender."."Date Opened";
        }
        field(22; Pension; Decimal)
        {
        }
        field(23; HELB; Decimal)
        {
        }
        field(24; "Payroll Code"; Code[20])
        {
            TableRelation = "Payroll Calender.";
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Payroll Period")
        {
            Clustered = true;
            SumIndexFields = "Basic Pay", "Gross Pay", "Net Pay", Allowances, Deductions, PAYE, NSSF, NHIF;
        }
    }

    fieldgroups
    {
    }
}

