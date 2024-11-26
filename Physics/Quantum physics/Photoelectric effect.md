---
title: Photoelectric effect
created: 2024-09-16
authors:
  - Engrima
tags:
  - Physics
  - Quantum_physics
---
**Author of the fist experiment**:
Heinrich Hertz in 1887

**Phenomenon in few words**:
When a metal surface is illuminated with light, electrons (**photoelectrons**) can be emitted from the surface:
1. the surface of the metal is illuminated by an electromagnetic wave of intensity $I$
2. the surface absorbs energy from the wave until the energy exceeds the binding energy of the electron to the metal
3. at that point the electron is released
4. minimum quantity of energy needed to remove an electron is called the work function $\phi$ of the material

**Condition**:
The experiment must be done in an *evacuated tube*, $\iff$ the electrons do not lose energy in collisions with molecules of the air

**Main properties**:
1. *Rate of electron emission* can be measured as an **electric current** $i$ by an ammeter in the external circuit
2. *The maximum kinetic energy* of the electrons can be measured by applying a negative potential to the collector that is just enough to repel the most energetic electrons, which then do not have enough energy to “climb” the potential energy hill. Or better:
   - apply $\Delta V$: potential difference between the emitter and the collector (negative)
  -  get $\Delta U=q \Delta V=-e \Delta V$: potential energy gained from electrons traveling from the emitter to the collector (positive)
  - the same quantity $\Delta U$ is lost in kinetic energy by those electrons
  - electrons leaving the emitter with a kinetic energy smaller than $\Delta U$ cannot reach the collector and are pushed back toward the emitter
  - let $\Delta V$ becomes larger $\implies$ we get the *stopping potential* $V_{s}$ , where even the most energetic electrons do not have enough kinetic energy to reach the collector
$$
K_{max}=e \cdot V_{s}
$$

### Classical theory

**Classical wave theory implications**:
1. The maximum kinetic energy of the electrons should be proportional to the intensity of the radiation
2. The photoelectric effect should occur for light of any frequency or wavelength
3. The first electrons should be emitted in a time interval of the order of seconds after the radiation begins to strike the surface

**Explanation of the classical theory implications**:
1. increasing the intensity of the light source 
   $\implies$increases the electric field $\vec{E}$
   $\implies$ increases the force on the electron $\vec{F}=e\vec{E}$
   $\implies$ increases kinetic energy of the electron when it leaves the surface
2. Wave theory $\implies$ as long as the light is intense enough to release electrons, the photoelectric effect should occur (no matter what the frequency or wavelength)
3. Energy of the wave is uniformly distributed over the wave front
   $\implies$the amount of energy delivered to any electron is determined by how much radiant energy is incident on the surface
   $\implies$assume this area is about the size of an atom
   $\implies$estimate that the time lag between turning on the light and observing the first photoelectrons should be of the order of seconds

**Experimental failures of wave theory**:
1. For a fixed value of the wavelength or frequency of the light source, the maximum kinetic energy of the emitted photoelectrons is totally independent of the intensity of the light source
2. The photoelectric effect does not occur at all if the frequency of the light source is below a certain value $f_{c}$
3. The first photoelectrons are emitted virtually instantaneously ($< 10^{-9}$s) after the light source is turned on.

### Quantum theory

**Author of the quantum theory of photoelectric effect**:
Albert Einstein, 1905.

**Idea**:
- The energy of electromagnetic radiation is not continuously distributed over the wave front, but instead is concentrated in localized bundles or quanta (photons).
- a photoelectron is released as a result of an encounter with a single photon.

**Process**:
- Energy of a photon associated with an electromagnetic wave with frequency $f$:
$$
E = hf
$$
- $h$: Planck's constant
- By substituting $\lambda=c / f$ we get an alternative equation for the energy of a photon:
$$
E =\frac{hc}{\lambda}
$$
- photons travel at the speed of light, and so they must obey the *relativistic* relationship for the momentum:
$$
p =\frac{E}{c} = \frac{h}{\lambda}  
$$
- Photons carry *linear momentum* as well as *energy*, and thus they share this characteristic **property of particles**.
- Photons travel at speed of light $\implies$ must have zero mass $\implies$ photon **rest energy** is zero:
$$
 E_{0}= mc^2 =0
$$

**Solving the experimental failures of classical theory**:
1. If the photon energy $hf$ exceeds the work function $\phi$, the excess energy appears as the kinetic energy of the electron $K_{max}=hf-\phi$ $\implies$ no dependency on the intensity of the light source
2. If the photon energy $hf$ is greater than the work function $\phi$ of the material, the photoelectron will be released, otherwise the photoelectric effect will not occur.
3. The entire energy of the photon is delivered instantaneously to a single photoelectron

>[!danger] Cutoff frequency vs material work function
>- a photon that supplies an energy equal to $\phi$, exactly the minimum amount needed to remove an electron, corresponds to light of frequency equal to the cutoff frequency $f_{c}=\frac{\phi}{h}$.
>- the corresponding cutoff wavelength is $\lambda_{c}=\frac{hc}{\phi}$.

>[!tip] Planck's constant
> $$h=6.6260696 \times 10^{-34} \: J \cdot s$$

