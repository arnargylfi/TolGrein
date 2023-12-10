import numpy as np
import matlab.engine
Matlab = matlab.engine.start_matlab()
#    This file is part of DEAP.
#
#    DEAP is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Lesser General Public License as
#    published by the Free Software Foundation, either version 3 of
#    the License, or (at your option) any later version.
#
#    DEAP is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#    GNU Lesser General Public License for more details.
#
#    You should have received a copy of the GNU Lesser General Public
#    License along with DEAP. If not, see <http://www.gnu.org/licenses/>.


#    example which maximizes the sum of a list of integers
#    each of which can be 0 or 1

import random

from deap import base
from deap import creator
from deap import tools

creator.create("FitnessMin", base.Fitness, weights=(-1.0,))
creator.create("Individual", list, fitness=creator.FitnessMin)

toolbox = base.Toolbox()

# Attribute generator
#                      define 'attr_bool' to be an attribute ('gene')
#                      which corresponds to integers sampled uniformly
#                      from the range [0,1] (i.e. 0 or 1 with equal
#                      probability)
toolbox.register("attr_rand", random.random)

# Structure initializers
#                         define 'individual' to be an individual
#                         consisting of 100 'attr_bool' elements ('genes')
toolbox.register("individual", tools.initRepeat, creator.Individual,
                 toolbox.attr_rand, 8)

# define the population to be a list of individuals
toolbox.register("population", tools.initRepeat, list, toolbox.individual)


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
def evalOne(individual):
    # print("sdlkj")
    return float(Matlab.progB(*fix(individual))),


#----------
# Operator registration
#----------
# register the goal / fitness function
toolbox.register("evaluate", evalOne)

# register the crossover operator
toolbox.register("mate", tools.cxTwoPoint)

# register a mutation operator
# eta is Crowding degree of the mutation. A high eta will produce a mutant resembling its parent,
# while a small eta will produce a solution much more different
toolbox.register("mutate", tools.mutPolynomialBounded,
                 low=[0, 0, 0, 0, 0, 0, 0, 0],
                 up=[1, 1, 1, 1, 1, 1, 1, 1],
                 eta=100,
                 indpb=0.3)

popsize = 200

# operator for selecting individuals for breeding the next
# generation: each individual of the current generation
# is replaced by the 'fittest' (best) of three individuals
# drawn randomly from the current generation.
toolbox.register("select", tools.selBest, k=int(np.log(popsize)))


if __name__ == "__main__":
    # random.seed(64)

    # create an initial population of 300 individuals (where
    # each individual is a list of floats)
    pop = toolbox.population(n=popsize)

    # CXPB  is the probability with which two individuals
    #       are crossed
    #
    # MUTPB is the probability for mutating an individual
    CXPB, MUTPB = 0.5, 0.9

    print("Start of evolution")

    # Evaluate the entire population
    fitnesses = list(map(toolbox.evaluate, pop))
    for ind, fit in zip(pop, fitnesses):
        ind.fitness.values = fit

    print("  Evaluated %i individuals" % len(pop))

    # Extracting all the fitnesses of
    fits = [ind.fitness.values[0] for ind in pop]

    # Variable keeping track of the number of generations
    g = 0

    # Begin the evolution
    while g < 1000:
        # A new generation
        g = g + 1
        print("-- Generation %i --" % g)

        # Select the best from the generation. These will survive and mate
        # best = toolbox.select(pop)
        best = tools.selBest(pop, 1)

        # create equal amount of new random individuals
        # randos = toolbox.population(n =int(popsize/100))
        randos = []

        parents = randos + best
        # a list to hold the offspring
        offspring = []

        for i in range(int((popsize - len(parents))/2)):
            parent1 = random.choice(parents)
            parent2 = random.choice(parents)

            child1, child2 = [toolbox.clone(ind) for ind in (parent1, parent2)]
            tools.cxBlend(child1, child2, 0.1)
            del child1.fitness.values
            del child2.fitness.values
            offspring.append(child1)
            offspring.append(child2)

        for mutant in offspring:
            # mutate an individual with probability MUTPB
            if random.random() < MUTPB:

                toolbox.mutate(mutant)
                # del mutant.fitness.values

        new_individuals = randos + offspring
        # Evaluate the individuals with an invalid fitness
        invalid_ind = [ind for ind in new_individuals if not ind.fitness.valid]
        fitnesses = map(toolbox.evaluate, invalid_ind)
        for ind, fit in zip(invalid_ind, fitnesses):
            ind.fitness.values = fit

        print("  Evaluated %i individuals" % len(invalid_ind))
        # The population is entirely replaced by the offspring and parents
        pop[:] = best + new_individuals

        # Gather all the fitnesses in one list and print the stats
        fits = [ind.fitness.values[0] for ind in pop]

        length = len(pop)
        mean = sum(fits) / length
        sum2 = sum(x*x for x in fits)
        std = abs(sum2 / length - mean**2)**0.5

        print("  Min %s" % min(fits))
        print("  Max %s" % max(fits))
        print("  Avg %s" % mean)
        print("  Std %s" % std)
        print("  Best: ", fix(tools.selBest(pop, 1)[0]))
        Matlab.plotstuff(*fix(tools.selBest(pop, 1)[0]), 3)

    print("-- End of (successful) evolution --")

    best_ind = tools.selBest(pop, 1)[0]
    print("Best individual is %s, %s" % (fix(best_ind), best_ind.fitness.values))
