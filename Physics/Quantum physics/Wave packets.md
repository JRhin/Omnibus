---
title: Wave packets
created: 2024-11-25
authors:
  - Engrima
tags:
  - Physics
  - Quantum_physics
---
**Definition**:
- We consider a wave packet to be a finite group of oscillations of a wave
- As the wave packet moves, individual locations in space will oscillate with the frequency or wavelength that characterizes the wave packet

**Assumptions**:
1. finite group of oscillations $\iff$the wave amplitude is large over a finite region of space or time and is very small outside that region
2. we are discussing **traveling waves**, which we imagine as moving in one direction with a uniform speed

### How to mathematically describe a wave packet

1. We cannot simply take a sinusoidal function to describe a wave packet since it would be impossible for a particle to be *localized*
2. Idea: adding together waves of different wavelength (frequency)
3. For example we may add two waves with wave number $k=\frac{2\pi}{\lambda}$:
$$
y(x)=A_1\cos k_1x+A_2\cos k_2x=A_1\cos(2\pi x/\lambda_1)+A_2\cos(2\pi x/\lambda_2)
$$

>[!info] Why we add waves
>- Adding 2 waves of different wavelengths $\implies$ reduced the amplitude of the wave packet at some locations
>- Adding more waves $\implies$ obtain still narrower regions of large amplitude
> - Adding more waves of a greater range of wavelengths $\implies$ restricts the size of the wave packet $\iff$ inverse relationship between $\Delta x$ and $\Delta \lambda$ from the first uncertainty relationship for classical waves (see [[Heisenberg Uncertainty Relationships]])
> - Simply adding waves is not enough: all of these patterns repeat endlessly from $-\infty$ to $\infty$
>  
>  ![[Pasted image 20240824191707.png|500]]

4. Taking the previous example with 2 waves and assuming $A_{1}=A_{2}=A$:
$$
y(x)=2A\cos\left(\frac{\pi x}{\lambda_1}-\frac{\pi x}{\lambda_2}\right)\cos\left(\frac{\pi x}{\lambda_1}+\frac{\pi x}{\lambda_2}\right)
$$
5. Note that for all four of the above wave patterns, the disturbance seems to have a wavelength of about 10, equal to the central wavelength of the range of values of the functions we constructed
6. We can therefore regard these functions as a cosine wave with a wavelength of 10 that is shaped or modulated by the other cosine waves included in the function
