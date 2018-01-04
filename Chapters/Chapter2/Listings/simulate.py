#!/usr/bin/env python
import matplotlib.pyplot as plt
from scipy import signal
from pyfmi import load_fmu, Master

# Load the FMUs that make up the model
controller = load_fmu('FMU/Controller.fmu')
plant = load_fmu('FMU/Plant.fmu')

# Connect the two FMUs
components = [controller, plant]
connections = [
        (controller, 'y', plant, 'u'),
        (plant, 'y', controller, 'u_m')]

# Create the FMU Master
model = Master(components, connections)

# Connect a function to the controller reference
input_object = ((controller, 'u_s'), signal.square)

# Run the simulation
res = model.simulate(input=input_object)

# Get simulation results
output = res[plant]['y']
reference = res[controller]['u_s']
t = res[plant]['time']

# Plot results
fig, ax = plt.subplots()
ax.plot(t, reference, 'b')
ax.plot(t, output, 'r')
plt.xlim(0, 5)
plt.show()
