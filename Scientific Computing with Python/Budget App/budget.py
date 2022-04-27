import math

class Category(object):
    def __init__(self, name):
        self.name = name
        self.ledger = list()

    def deposit(self, amount, description=""):
        self.ledger.append({"amount": float(amount), "description": description})

    def get_balance(self):
        balance = 0
        for i in range(len(self.ledger)):
            balance += self.ledger[i]["amount"]
        return balance

    def get_withdrawls(self):
        totalSpent = 0
        for i in range(len(self.ledger)):
            if self.ledger[i]["amount"] < 0:
                totalSpent += self.ledger[i]["amount"]
        return totalSpent

    def __str__(self):
        nameString = str(self.name)
        numberOfCharactersByCategory = len(nameString)
        numberOfSpacesPerTitleLeft = 30 - numberOfCharactersByCategory
        title = "*" * math.floor((numberOfSpacesPerTitleLeft / 2)) + nameString + "*" * math.floor((numberOfSpacesPerTitleLeft / 2))
        if len(title) == 29:
            title += "*"

        total = self.get_balance()

        movementString = str()
        for movements in self.ledger:
            amount = movements["amount"]
            description = movements["description"]
            amountString = "{0:.2f}".format(amount)
            numberOfSpacesPerMovementLineLeft = 30 - len(description) - len(amountString)
            if 0 <= numberOfSpacesPerMovementLineLeft <= 3:
                n = numberOfSpacesPerMovementLineLeft
                description = description[:-n]
                description = description + "." * n
            if numberOfSpacesPerMovementLineLeft < 0:
                n = -numberOfSpacesPerMovementLineLeft
                description = description[:-(n + 1)]
                description = description + " " * 1
            movementString += "\n" + description + " " * numberOfSpacesPerMovementLineLeft + amountString

        totalString = "\n" + "Total: " + "{0:.2f}".format(total)
        graphLedgerString = title + movementString + totalString
        return graphLedgerString

    def withdraw(self, amount, description=""):
        if amount <= self.get_balance():
            self.ledger.append({"amount": -float(amount), "description": description})
            return True
        else:
            return False

    def transfer(self, amount, budget_category):
        if amount <= self.get_balance():
            transferToString = "Transfer to " + budget_category.name
            self.withdraw(amount, transferToString)
            transferFromString = "Transfer from " + str(self.name)
            budget_category.deposit(amount, transferFromString)
            return True
        else:
            return False

    def check_funds(self, amount):
        totalBalance = self.get_balance()
        if amount > totalBalance:
            return False
        else:
            return True

def truncate(n):
    multiplier = 10
    return int(n*multiplier)/multiplier

def getTotals(categories):
    total = 0
    breakdown = []
    for category in categories:
        total += category.get_withdrawls()
        breakdown.append(category.get_withdrawls())
    rounded = list(map(lambda x: truncate(x/total), breakdown))
    return rounded

def create_spend_chart(categories):
    res = "Percentage spent by category\n"
    i = 100
    totals = getTotals(categories)
    while i >= 0:
        catSpaces = " "
        for total in totals:
            if total * 100 >= i:
                catSpaces += "o "
            else:
                catSpaces += "  "
        res += str(i).rjust(3) + "|" + catSpaces + ("\n")
        i -= 10

    dashes = "-" + "---"*len(categories)
    names = []
    xAxis = ""
    for category in categories:
        names.append(category.name)

    maxi = max(names, key=len)

    for x in range(len(maxi)):
        nameStr = '     '
        for name in names:
            if x >= len(name):
                nameStr += "  "
            else:
                nameStr += name[x] + " "

        if (x != len(maxi) - 1):
            nameStr += '\n'

        xAxis += nameStr

    res += dashes.rjust(len(dashes) + 4) + "\n" + xAxis
    return print(res)
