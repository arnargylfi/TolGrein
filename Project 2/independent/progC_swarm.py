import numpy as np
import pyswarms as ps
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


# the goal ('fitness') function to be minimized
def f(individual):
    # print("\n\n######")
    # print(individual.shape)
    #
    # print(individual)
    # print(fix(individual))
    ret = []
    for ind in individual:
        ret.append(float(Matlab.progB(*ind)))
    # print(ret)
    return np.array(ret)

# bounds = [
#     [-10, 10],  # x
#     [-10, 10],  # y
#     [-10, 10],  # dx
#     [-10, 10],  # dy
#     [0.2, 10],  # k
#     [0.05, 3],  # m
#     [0.1, 5],   # L
#     [0.5, 20]   # T
# ]

bounds = [
    # x      y       dx      dy       k        m      L      T
    [-10,   -10,    -10,    -10,    0.2,    0.05,   0.1,    0.5],
    [10,     10,     10,     10,     10,       3,     5,     20]
]

options = {'c1': 0.5, 'c2': 0.3, 'w':0.9}

optimizer = ps.single.GlobalBestPSO(n_particles=100, dimensions=8, options=options, bounds=bounds)

stats = optimizer.optimize(f, iters=100)

print(stats)





