import math
import time
from tkinter import *

class Fibonacci():
    def s5(self, n, r):
        return [(r*i**0.5,((i*360/((5**0.5+1)/2)) % 360)) for i in range(n+1)]

    def pol2cart(self, r, theta):
        x = r * math.cos(math.radians(theta))
        y = r * math.sin(math.radians(theta))
        return x,y

    def calculate_coordinates(self, num_points = 200, distance = 15):
        self.coordinates = [self.pol2cart(r, t) for r, t in self.s5(num_points, distance)]
        self.coordinates = [(x+250,y+250) for x, y in self.coordinates]

    def plot_numbers(self, canvas):
        h = 1
        self.calculate_coordinates(num_points = 200, distance = 15)
        for x, y in self.coordinates:
            canvas.create_oval(x+7, y+7, x-7, y-7)
            h += 1
            time.sleep(0.001)

    def create_gui(self):
        master = Tk()
        canvas = Canvas(master, width = 500, height = 500)
        canvas.pack()
        self.plot_numbers(canvas)
        mainloop()

f = Fibonacci()
f.create_gui()
