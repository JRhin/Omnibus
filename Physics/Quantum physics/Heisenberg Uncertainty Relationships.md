
**Goal**:
1. We want to use *de Broglie waves* to describe particles
2. The amplitude of the wave will tell us something about the *location* of the particle
3. Let's analyze 2 possibilities:
	1. pure sinusoidal wave 
	   $\implies$ the wave extends from $-\infty$ to $\infty$ 
	   $\implies$ no good for locating the particle but easy to find wavelength
	2. narrow wave pulse 
	   $\implies$ not easily identifiable wavelength but easy to locate
 
![[Pasted image 20240824122033.png|200]]

4. For a quantum particle 
   $\implies$ de Broglie hypothesis is valid
   $\implies$ better we know the wavelength, better we know the momentum
   $\implies$ less we know location

### Uncertainty in classical waves

#### 1. Location-wavelength uncertainty relationship

**Setup**:
1. All real waves can be represented as wave packets $\implies$ disturbances that are localized to a finite region of space
2. disturbance is well localized to a small region of space of length $\Delta x$
3. measurement of the wavelength is therefore subject to a small uncertainty $\Delta\lambda \sim \epsilon\lambda$ that is a small fraction of $\lambda$
4. let's examine the product of the size of the wave packet and the uncertainty in the wavelength:
$$
\Delta x\Delta\lambda\sim\epsilon\lambda^2
$$

**Interpretation**:
For a given wavelength, the smaller the size of the wave packet, the greater the uncertainty in our knowledge of the wavelength

>[!warning]
>Making a larger wave packet doesn’t help us at all. Figure b shows a larger wave packet with the same wavelength, but it is easy to derive the same result for the product $\Delta x \Delta\lambda$

![[Pasted image 20240824124016.png]]

#### 2. Frequency-time uncertainty relationship

**Setup**:
1. Wave disturbance as a function of time rather than location
2. Size of the wave packet is now its duration in time $\implies$ e.g. one period $\Delta t \sim T$
3. uncertainty is some small fraction of the period, i.e. $\Delta T \sim \epsilon T$
4. this time the product is:
$$
\Delta t\Delta T\sim\epsilon T^2
$$

**Interpretation**:
For a wave of a given period, the smaller the duration of the wave packet, the larger is the uncertainty in our measurement of the period.

![[Pasted image 20240824124647.png]]

>[!tip] In terms of frequency
>1. We know that $f=\frac{1}{T}$
>2. We take the differentials $df=- \frac{1}{T^2}dT$
>3. Convert in finite intervals and ignore the minus $\Delta f=- \frac{1}{T^2}\Delta T$
>4. Finally we get:
>   $$ \Delta f\Delta t \sim \epsilon$$

### Uncertainty in de Broglie waves

**First relationship**:
1. use the basic de Broglie relationship:
$$
p=\frac{h}{\lambda}
$$
2. Take the differentials, consider finite intervals and ignore the sign:
$$
\Delta p=\frac{h}{\lambda^2} \Delta \lambda
$$
3. Finally we get:
$$
\Delta x \Delta p \sim \epsilon h
$$

**Interpretation**:
The smaller the size of the wave packet of the particle, the larger is the uncertainty in its momentum (and thus in its velocity).

>[!tip] *First Heisenberg uncertainty relationship*
>1. wave packet with the smallest possible value of the product $\Delta x\Delta p$, which turns out to be $h / 4\pi$
>2. combination $h / 2\pi$ occurs frequently in quantum mechanics so we define $\hbar=\frac{h}{2\pi}$
>3. we can rewrite the *First Heisenberg uncertainty relationship* as $$\Delta x\Delta p \geq \frac{1}{2}\hbar$$
>4. it is acceptable to write $$\Delta x\Delta p_{x}\sim \hbar$$

**Second relationship**:
1. If we assume $E=hf$  $\implies$ we get $\Delta E = h\Delta f$
2. Remember form the second uncertainty relationship of classical waves that: $\Delta f \Delta t \sim \epsilon$
3. Finally:
$$
\Delta e\Delta t \sim \epsilon h
$$
4. In other terms:
$$
\Delta E\Delta t \geq \frac{1}{2} \hbar
$$

**Interpretation**:
- the more precisely we try to determine the time coordinate of a particle, the less precisely we know its energy
- the rest energy of a stable particle (one with an infinite lifetime, so that $\Delta t = \infty$) can in principle be measured with unlimited precision ($\Delta E=0$).

>[!tip] Take-home messages:
>1. It is not possible to make a simultaneous determination of the position and the momentum of a particle with unlimited precision
>2. It is not possible to make a simultaneous determination of the energy and the time coordinate of a particle with unlimited precision

