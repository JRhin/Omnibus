These notes are related to the following video, named [Michael Elad - The New Era of Image Denoising](https://youtu.be/P1yBae8ZjFA?si=9tQlXJuOJ4wPeUZi)

![Michael Elad - The New Era of Image Denoising](https://youtu.be/P1yBae8ZjFA?si=9tQlXJuOJ4wPeUZi).

**Image Denoiser**: a machine that is able to remove noise from images.

![[Pasted image 20240625172046.png]]

## History & intro

The image to be denoised is the sum of a clean image and the *white gaussian noise*

![[Pasted image 20240625172220.png]]

The Gaussian white noise is a good noise assumption since:
1. a lot of papers agree with this assumption
2. when considering a poisson noise:
	1. high counts of photons ->approx. gaussian
	2. low-count poisson images -> can be converted to gaussian-noisy images by *Anscom*
3. very mathematically pleasant -> **MMSE denoisers**

>- Improvement in images processing -> improvement in denoising algorithm
>- Paradigm shift from classic methods to supervised learning (2015) and **deep learning**

### Paradigm shift advantages:
1. serve different aims at the same time (e.g. design the denoiser to optimize ssim(?), remove true noise from images)
2. adapt to different image domains

### How to use denoiser:
#### 1 - Solving general inverse problems:
Use the denoiser as a regularizer for the general inv. problem
#### 2 - Image Synthesis
#### 3 - High perceptual quality reconstruction

## Image Synthesis

Given a denoiser, we can use it to synthetize images: you can use the denoiser as a projection onto the *manifold of images*.

By iteratively alternating simple operations and denoising operations we get  a very pleasant final image (you get many many possible images)

![[Pasted image 20240627010838.png]]

**Goal**: draw a sample from distribution of images $P(x)$
**Problem**: we don't have the true image distro.
**Solution**: 
- start with random noise image $\hat{x}_{0}$
- climb to a more probable image by iterative process (steepest descent):
  $$
\mathrm{\hat{x}_{k+1}=\hat{x}_{k}+a\cdot\nabla logP(\hat{x}_{k})}
$$
-  we get a chain of better and better images
-  if we apply a particular iterative procedure we get the **Langevin Dynamics** (properly designing $a$ and $b$ const.):
  $$
\mathrm{\hat{x}_{k+1}=\hat{x}_k+a\cdot\nabla logP(\hat{x}_k)+b\cdot z_k}
$$

-  now the problem is that $\nabla logP(\hat{x}_k)$ is an unknown score function but it can be approx. by a DENOISER --> it turns out that there is an implicit relation between MMSE denoiser and the prior $P(x)$

**Take Home Message**: the algo keep calling the denoiser at each iteration, obtaining a sample from $P(x)$

###### New Problem:
this algo will work but it will take forever since the manifold of images in the space is very thin and starting form far away ($\hat{x}_{0}$) makes it very difficult to pull me towards the manifold (i.e. always  $P(\hat{x}_{0}=0 ) \implies \log(P(\hat{x}_{0}))= - \infty$) and find a good direction for the descent algorithm.

###### Solution
**Annealing**: don't synthetize images, but synthetize noisy images.
If we sum gaussian noise to an image the new distribution of noisy images will be a convolution of the original prior with the gaussian kernel... we get a blurred image manifold!

![[Pasted image 20240627013103.png]]

You start with a very wide $\sigma_{i}$ and then you are narrowing the manifold with way less iterations.

## Perceptual Quality

**Problem**: the denoiser output is a blurred image.

![[Pasted image 20240627013513.png]]

**Origin of the problem**: given a manifold of (possible) good looking images (according to some score function) and starting the algorithm from a "bad" noisy image, we want to know which images are the best suited to represent the input image without the additive gaussian noise.
The problem is that an entire set of images is equally a good candidate for the reconstruction so the MMSE denoiser simply takes an average image of all the good candidates and the result is a blurred output.

![[Pasted image 20240627014014.png]]

**Solution**: 
- $y$ -> noisy image
- $x$ -> noiseless image -> $P(x)$ represents the probability of all the possible good looking images
- conditional posterior $P(x|y)$
- instead of taking the average (expectation), we sample from this conditional distro. 
- two methods:
	- conditional GAN
	- iterated use of MMSE denoisers (diffusion)

> Notice that now I'm not returning a unique output but I'm returning a bunch of solutions

### Stochastic Image Denoiser

A look to this new denoiser

> Point 1: we have a conditional score (on $z_{k}$)

![[Pasted image 20240627014847.png]]

> Point 2: we get two types of noise:

![[Pasted image 20240627015227.png]]

The final result:

![[Pasted image 20240627015353.png]]

> Point 3: notice that by newly running the algo I would get a different result because of stochasticity!