
**Origin of the electromagnetic wave**:
- Two main components:
	1. distribution of electric charges $\implies$ electric field $\overrightarrow{\mathrm{E}}$
	2. current-carrying wires $\implies$ magnetic field $\overrightarrow{B}$
- Two possibilities:
	- if charges do not move and currents do not change $\implies$ $\overrightarrow{\mathrm{E}}$ and $\overrightarrow{\mathrm{B}}$ are static fields
	- otherwise $\implies$ $\overrightarrow{\mathrm{E}}$ and $\overrightarrow{\mathrm{B}}$ vary both in location and time $\implies$ an **electromagnetic wave** is produced.

**Plane wave**:
There is a different mathematical expression for different wave forms, depending on:
- properties of the source of the wave
- properties of the medium
A special case is the **plane wave**, where the wave fronts are planes:
$$
\vec{\mathbf{E}}=\vec{\mathbf{E}}_0\sin(kz-\omega t),\quad\vec{\mathbf{B}}=\vec{\mathbf{B}}_0\sin(kz-\omega t)
$$
where:
- the wavelength $\lambda$ $\implies$ the wave number $k=\frac{2\pi}{\lambda}$
- the frequency $f$ $\implies$ the angular frequency $\omega=2\pi f$
- the vector $\overrightarrow{\mathrm{E}}_{0}$ represents the polarization of the wave
- given that $\overrightarrow{\mathrm{E}}\times\overrightarrow{\mathrm{B}}$ points in the direction of travel $\implies$ given the direction of $\overrightarrow{\mathrm{E}}_{0}$ we know the direction of $\overrightarrow{\mathrm{B}}_{0}=\frac{\overrightarrow{\mathrm{E}}_{0}}{c}$  ($c$ is the speed of light)

Moreover, given the following representation of an electromagnetic wave traveling over the $z$ direction (see the figure below):
- an electromagnetic wave transmits energy from one point to another, the energy flux is given by the *Poynting vector* $\overrightarrow{\mathrm{S}}$:
$$
\begin{align}
\vec{\mathbf{S}}&=\frac{1}{\mu_0}\vec{\mathbf{E}}\times\vec{\mathbf{B}} \\
&= \frac{1}{\mu_0}E_0B_0\sin^2(kz-\omega t)\hat{\mathbf{k}}
\end{align}
$$
- if the receiver of the wave is oriented with its sensitive area $A$ perpendicular the $z$ we get the power entering the receiver of: $$\begin{align}P=SA&=\frac{1}{\mu_0}E_0B_0A\sin^2(kz-\omega t) \\
\implies P &=\frac{1}{\mu_{0}c}E_{0}^{2}A\sin^{2}(kz-\omega t)
\end{align}$$
- the average power in a period of time $T$ is:$$P_{\mathrm{av}}=\frac{1}{T}\int_0^TPdt$$
- the corresponding intensity is:$$I=\frac{P_\mathrm{av}}{A}=\frac{1}{2\mu_0c}E_0^2$$

>[!danger] Intensity features
>1. the intensity is proportional to the square of the amplitude $overrightarrow{\mathrm{E}}_{0}$
>2. the intensity fluctuates with time, with the frequency $2f=2\left( \frac{\omega}{2\pi} \right)$ but we don't see this rapid oscillation $\implies$ we observe the time average of many cycles

![[Pasted image 20240822163429.png|200]]
