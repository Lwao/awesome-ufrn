import matplotlib.pyplot as plt
import numpy as np

n = 1001
r1 = 30
r2 = 3
t1 = np.linspace(-r1, r1, n)
t2 = np.linspace(-r2, r2, n)
x1 = np.sinc(t1)
x2 = np.sinc(t2)

fig, axs = plt.subplots(2, 2)
axs[0, 0].plot(t1, x1)
axs[0, 0].set_title('Semi-infinity duration \n non-causal Sinc function')
axs[0, 1].plot(t1+r1, x1, 'tab:orange')
axs[0, 1].set_title('Semi-infinity duration \n causal Sinc function')
axs[1, 0].plot(t2, x2, 'tab:green')
axs[1, 0].set_title('Truncated non-causal \n Sinc function')
axs[1, 1].plot(t2+r2, x2, 'tab:red')
axs[1, 1].set_title('Truncated causal \n Sinc function')

for ax in axs.flat:
    ax.set(xlabel='Time', ylabel='Amplitude')

    
fig.tight_layout(pad=1.0)