MONTHLY_INTEREST_RATE = 0.15 / 12
REPAYMENTS_RATE = 0.06
DOWN_PAYMENT_RATE = 0.12


def main():
    """
    main takes input from user and calls header and repayments_table.
    """
    purchase_price = float(input("Enter purchase price ($): "))
    header()
    repayments_table(purchase_price)


def repayments_table(purchase_price):
    """
    repayments_table takes purchase_price in float type calculate the content
    of the table and prints the repayment table.
    """
    one_off = purchase_price * DOWN_PAYMENT_RATE
    opening_bal = purchase_price - one_off
    # to avoid infinite loop if repayment is lower than $0.01.
    repayments = max(purchase_price * REPAYMENTS_RATE, 0.01)
    month = 1
    while opening_bal > 0:
        interest = opening_bal * MONTHLY_INTEREST_RATE
        interest = round(interest, 2)
        if opening_bal + interest >= repayments:
            closing_bal = opening_bal + interest - repayments
            closing_bal = round(closing_bal, 2)
            principal = repayments - interest
        else:
            repayments = opening_bal + interest
            principal = repayments - interest
            closing_bal = opening_bal + interest - repayments
            closing_bal = round(closing_bal, 2)
        print(formats(month, opening_bal, interest, principal,
              repayments, closing_bal))
        month += 1
        opening_bal = closing_bal


def formats(month, opening_bal, interest,\
            principal, repayments, closing_bal):
    """
    formats takes month, opening_bal, interest, etc. in float type and return
    these variables in float type.
    """
    return " {:<5d} ".format(month) + "|" +\
           " {:<11.2f} ".format(opening_bal) + "|" +\
           " {:<8.2f} ".format(interest) + "|" +\
           " {:<9.2f} ".format(principal) + "|" +\
           " {:<9.2f} ".format(repayments) + "|" +\
           " {:<11.2f} ".format(closing_bal)


def header():
    """
    header formats and prints the header of the repayments table.
    """
    line = "-" * (7 + 1 + 13 + 1 + 10 + 1 + 11 + 1 + 11 + 1 + 13)
    column_name = " {:<5} ".format("Month") + "|" +\
                  " {:<11} ".format("Opening Bal") + "|" +\
                  " {:<8} ".format("Interest") + "|" +\
                  " {:<9} ".format("Principal") + "|" +\
                  " {:<9} ".format("Repayment") + "|" +\
                  " {:<11} ".format("Closing Bal")
    print(line)
    print(column_name)
    print(line)

main()
