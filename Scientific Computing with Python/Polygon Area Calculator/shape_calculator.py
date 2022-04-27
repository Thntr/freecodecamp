import math

class Rectangle():
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def __repr__(self):
        return "Rectangle(width={}, height={})".format(self.width, self.height)

    def set_width(self, width):
        self.width = width
    def set_height(self, height):
        self.height = height
    def get_area(self):
        area = self.width * self.height
        return area
    def get_perimeter(self):
        perimeter = 2 * self.width + 2 * self.height
        return perimeter
    def get_diagonal(self):
        diagonalLenght = (self.width ** 2 + self.height ** 2) ** .5
        return diagonalLenght
    def get_picture(self):
        shape = str()
        if self.width < 50 and self.height < 50:
            for _ in range(self.height):
                shape += "*" * self.width + "\n"
            return shape
        else:
            return "Too big for picture."
    def get_amount_inside(self, shape):
        areaOfRect = self.get_area()
        areaOfSq = shape.get_area()
        numberOfTimes = math.floor(areaOfRect/areaOfSq)
        return numberOfTimes

class Square(Rectangle):
    def __init__(self, side):
        self.width = side
        self.height = side

    def __repr__(self):
        return "Square(side={})".format(self.width)

    def set_side(self, amount):
        self.width = amount
        self.height = amount
