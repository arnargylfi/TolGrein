import numpy as np
import scipy.optimize as opt
import random

import matlab.engine
Matlab = matlab.engine.start_matlab()


def fix(individual):
    x = (individual[0] - 0.5)*20
    y = (individual[1] - 0.5)*20
    dx = (individual[2] - 0.5)*20
    dy = (individual[3] - 0.5)*20
    k = 0.1 + individual[4]*50
    m = 0.01 + individual[5]*2
    L = 0.1 + individual[6]*20
    T = individual[7]*20
    return x, y, dx, dy, k, m, L, T

# the goal ('fitness') function to be maximized
def f(individual):
    return float(Matlab.progB(*fix(individual))),


# Define the constraints
def g(x):
    return (x[0]**2 + x[1]**2 - 50)

# Define the constraints in the form required by the minimize function
# cons = ({'type': 'ineq', 'fun': g})

# Set the initial guess for the optimization
# x0 = np.array([0.6, 0.6, 0.5, 0.5, 0.1, 0.1, 0.4, 0.3])
x0 = np.array([random.random() for _ in range(8)])

# Minimize the objective function subject to the constraints
result = opt.minimize(f, x0, bounds=[(0, 1)]*8, method='Powell')

# Print message indicating why the process terminated
print(result.message)

# Print the relevant x-value that results in constrained minimum
print(fix(result.x))
Matlab.plotstuff(*fix(result.x))
import time
time.sleep(100)
