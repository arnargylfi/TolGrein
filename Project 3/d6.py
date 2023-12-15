from scipy.optimize import curve_fit
import numpy as np

L = 0.04
def sigmoid(x, a, b):
    y = a/(1 + np.exp(-(x-L/2)/b))
    return (y)


"""
0 4.8
0.01 4.3
0.02 2.3
0.03 0.8
0.04 0.2
"""

xdata = np.array([0, 0.01, 0.02, 0.03, 0.04])
ydata = np.array([4.8, 4.3, 2.3, 0.8, 0.2])*1e-4

p0 = [4, -0.05] # this is an mandatory initial guess

popt, pcov = curve_fit(sigmoid, xdata, ydata,p0)

print(popt, "sadflkj", pcov)

from matplotlib import pyplot as plt
x = np.linspace(0, L, 100)
plt.plot(x, sigmoid(x, *popt))
plt.plot(xdata, ydata, '*r')
plt.show()