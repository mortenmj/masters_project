#!/usr/bin/env python
import matplotlib.pyplot as plt
from scipy import signal
from pyfmi import load_fmu, Master

# Load the model FMUs
ctrl = load_fmu('FMU/Ctrl.fmu')
plant = load_fmu('FMU/Plant.fmu')

# Connect the controller and plant
components = [ctrl, plant]
conns = [
        (ctrl, 'y', plant, 'u'),
        (plant, 'y', ctrl, 'u_m')]

# Create the FMU Master
model = Master(components, conns)

# Connect a reference signal
ref = signal.square
input_obj = ((ctrl, 'u_s'), ref)

# Run the simulation
res = model.simulate(
        input=input_obj)

# Get simulation results
output = res[plant]['y']
reference = res[ctrl]['u_s']
t = res[plant]['time']

# Plot results
fig, ax = plt.subplots()
ax.plot(t, reference, 'b')
ax.plot(t, output, 'r')
plt.xlim(0, 5)
plt.show()
