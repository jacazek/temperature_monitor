from matplotlib import pyplot as plt
import math
import numpy as np
from numpy import arange

kelvin = 273.15

def computeResistance(t1, r1, B, B_variance = 0):
    t1_kelvin = t1 + kelvin
    variedB = B + B*B_variance
    def returnFunction(t2):
        t2_kelvin = t2+kelvin
        denom = t2_kelvin-t1_kelvin
        if denom == 0:
            denom = .000000001
        
        return r1/math.pow(math.e, variedB/((t2_kelvin*t1_kelvin/(denom))))
    return returnFunction

def celciusToFahrenheit(c):
    return (c*9/5)+32


r1 = 10000.0 #+- 5%
t1 = 25.0
B = 3435.0 #+- 1%
standardResistance = computeResistance(t1, r1, B, 0.0)
plus5 = computeResistance(t1, r1, B, 0.05)
minus5 = computeResistance(t1, r1, B, -.05)

x = np.arange(29.425, 29.475, .005, dtype=np.float32)
xf = list([celciusToFahrenheit(c) for c in x])
y = list([standardResistance(degree) for degree in x])
yPlus5 = list([plus5(degree) for degree in x])
yMinus5 = list([minus5(degree) for degree in x])



fig, ((plt1), (plt2)) = plt.subplots(2, 1)

plt1.plot(x,y, marker="o")
plt1.plot(x,yPlus5, marker="o")
plt1.plot(x,yMinus5, marker="o")
plt1.set_ylabel("resistance ohms")
plt1.set_xlabel("degrees F")
plt1.grid(True)

resistance = y
voltages = [ 
#     (list([3.3*r/(r + 4000) for r in resistance]), "4k"),
#     (list([3.3*r/(r + 5000) for r in resistance]), "5k"),
    (list([3.3*r/(r + 9910) for r in resistance]), "9.9k"),
    (list([3.3*r/(r + 10000) for r in resistance]), "10k")
]
# voltage10000 = list([3.3*r/(r + 4000) for r in resistance])
# voltage5000r = list([3.3*5000/(r + 5000) for r in resistance])
# voltage10000r = list([3.3*4000/(r + 4000) for r in resistance])

print(min(resistance))
print(max(resistance))
print(resistance[len(resistance)-10:])
for (voltage, label) in voltages:
    print(label)
    print(min(voltage))
    print(max(voltage))
    
    plt2.plot(voltage, resistance, marker="o")

plt2.legend(["4k", "5k", "10k"])
plt2.set_xlabel("voltage")
plt2.set_ylabel("resistance ohms")
plt2.grid(True)

plt.subplots_adjust(hspace=.5)

plt.show()
    
    
    