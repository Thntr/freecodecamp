def add_time(start, duration, startingDay = None):

    inputSplited = start.split()
    amPm= inputSplited[1]
    initialTime = inputSplited[0]

    def oppositeInitials(initials):
        if amPm == "AM":
            oppositeAmPm = "PM"
        else:
            oppositeAmPm = "AM"

        return str(oppositeAmPm)

    pmAm = oppositeInitials(amPm)

    def transform_clock_string_into_treatable_info(string):
        string = string.replace(":", " ")
        string = string.split()
        hoursString = int(string[0])
        minutesString = int(string[1])

        timeInListFormat = [hoursString, minutesString]
        return timeInListFormat

    initialTimeCoord = transform_clock_string_into_treatable_info(initialTime)
    durationCoord = transform_clock_string_into_treatable_info(duration)
    #print(initialTimeCoord)
    #print(durationCoord)

    sumTime = [sum(x) for x in zip(initialTimeCoord, durationCoord)]
    #print(sumTime)

    # Transform the startingDay string input into lowercases
    if startingDay != None:
        startingDay = startingDay.lower()

        startingDayList = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
        startingDayListWithCaptions = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        startingDayIndex = startingDayList.index(startingDay)
    else:
        startingDayList = None
        startingDayIndex = 0

    #Sum the number of minutes of the initial time with the duration delay. If this sum represent an additional hour, consider that contribution
    #to the total amount of past hours
    if sumTime[1] > 59:
        sumTime[0] += 1
        minLeft = sumTime[1] - 60
    else:
        minLeft = sumTime[1]

    nOfDaysPassed = 0
    #Count the number of days has passed since the starting time
    if sumTime[0] >= 24:
        nOfDaysPassed = sumTime[0]//24
        for _ in range(nOfDaysPassed):
            startingDayIndex += 1
            if startingDayIndex == 7:
                startingDayIndex = 0

        leftHours = sumTime[0] % 24
    else:
        leftHours = sumTime[0]

    if leftHours >= 12:
        initialsToPrint = pmAm
        if amPm == "AM" and leftHours == 12:
            None
        else:
            leftHours = leftHours - 12
    else:
        initialsToPrint = amPm

    if initialsToPrint != amPm and amPm == "PM":
        nOfDaysPassed += 1
        startingDayIndex += 1
        if startingDayIndex == 7:
            startingDayIndex = 0

    if nOfDaysPassed == 1:
        daysLabelToPrint = " (next day)"
    if nOfDaysPassed > 1:
        daysLabelToPrint = " ({} days later)".format(nOfDaysPassed)
    if nOfDaysPassed == 0:
        daysLabelToPrint = ""

    if startingDay != None:
        weekDayString = ", {}".format(startingDayListWithCaptions[startingDayIndex])
    else:
        weekDayString = ""

    if len(str(leftHours)) == 1:
        zeroDigit = ""
    else:
        zeroDigit = ""

    if len(str(minLeft)) == 1:
        minZeroDigit = "0"
    else:
        minZeroDigit = ""
    
    if leftHours == 0 and initialsToPrint == "AM":
      leftHours = 12

    labelToPrint = zeroDigit + "{}".format(leftHours) + ":" + minZeroDigit + "{}".format(minLeft) + " " + initialsToPrint + weekDayString + daysLabelToPrint
    new_time = labelToPrint

    return new_time
