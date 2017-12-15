#!/usr/bin/env python

import matplotlib.pyplot as plt
import pymodelica
import pyfmi

fmu = pymodelica.compile_fmu(
        'MasterProject.Models.InertialImplementation',
        'InertialImplementation.mo')
model = pyfmi.load_fmu(fmu)

# Simulate
end_time = 5
res = model.simulate(final_time=end_time)

# Get simulation results
time = res['time']
ref = res['reference.y']
output = res['sensor.w']

# Plot results
fig, ax = plt.subplots()
ax.plot(time, ref, 'b')
ax.plot(time, output, 'r')
plt.xlim(0, end_time)
plt.savefig('test.svg')
