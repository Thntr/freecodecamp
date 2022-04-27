import random
import copy

class Hat():
    def __init__(self, **kwargs):
        self.contents = list()
        self.items = kwargs
        self.total = sum(kwargs.values())
        self.args = kwargs
        for items in self.items:
            for _ in range(self.items[items]):
                self.contents.append(items)

    def quitABall(self, ball, contents = list()):
        try:
            contents.remove(ball)
            return True
        except:
            return True

    def randomChoice(self, contents):
        try:
            result = random.choice(contents)
            return result
        except:
            return None

    def draw(self, number, contents = list()):
        draw = []
        if len(contents) == 0:
            contents = self.contents
        for _ in range(number):
            choice = self.randomChoice(contents)
            draw.append(choice)
            self.quitABall(choice, contents)
        return draw


def experiment(**kwargs):
    hat = kwargs['hat']
    expectedBalls = kwargs['expected_balls']
    numBallsDrawn = kwargs['num_balls_drawn']
    numExperiments = kwargs['num_experiments']
    counterPerDraw = 0
    draws = 0

    originalHat = [hat.contents, hat.items, hat.total, hat.args]

    def reset(list):
        constructedList = []
        for element in list:
            constructedList.append(copy.copy(element))
        return constructedList

    def monteCarlo(n, m):
        drawResults = hat.draw(numBallsDrawn, hatAttrList[0])
        n += 1
        frequency = copy.copy(expectedBalls)
        for result in drawResults:
            if result in expectedBalls:
                frequency[result] -= 1
            if (all(x <= 0 for x in frequency.values())):
                m += 1
                frequency = copy.copy(expectedBalls)
        return n, m

    for _ in range(numExperiments):
        hatAttrList = reset(originalHat)
        contentsCopy = hatAttrList[0]
        if numBallsDrawn >= len(contentsCopy):
            (draws, counterPerDraw) = monteCarlo(draws, counterPerDraw)
        while len(contentsCopy) > numBallsDrawn:
            (draws, counterPerDraw) = monteCarlo(draws, counterPerDraw)

    probability = counterPerDraw/draws
    print("The probability of this problem is calculated to be... {}".format(probability))
    return probability
