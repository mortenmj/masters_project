#!/usr/bin/env python
import matplotlib.pyplot as plt
from pyfmi import load_fmu

# Load the FMUs that make up the model
model = load_fmu('FMU/BouncingBall.fmu')

# Get default options
opts = model.simulate_options()
opts['ncp'] = 500

# Run the simulation
res = model.simulate(
        final_time=5,
        options=opts)

# Get simulation results
height = res['h']
ground = res['ground']
t = res['time']

# Plot results
fig, ax = plt.subplots()
ax.plot(t, height, 'b')
ax.fill_between(t, ground, 0)
plt.xlim(0, 5)
plt.ylim(0, 5.5)
plt.savefig('BouncingBall.svg')
