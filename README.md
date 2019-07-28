# A12-Effect-Size

Matlab code to compute A12 effect size proposed in the following paper:

András Vargha and Harold D. Delaney. A Critique and Improvement of the "CL" Common Language Effect Size Statistics of McGraw and Wong. Journal of Educational and Behavioral Statistics, Vol. 25, No. 2 (Summer, 2000), pp.101-132

and explained in

Andrea Arcuri and Lionel Briand. A Practical Guide for Using Statistical Tests to Assess Randomized. Algorithms in Software Engineering.
 
 
As explained by the latter, a12 measures the probability that running algorithm x yields higher values of the measurement taken than running another algorithm y. For example, A12 = 0.7 entails we would obtain higher results 70% of the time with algorithm x.

In this implementation, if x is larger than y, return the usual a12(x,y).
Otherwise, return -1 * a12(y,x).

According to Vargha and Delaney, a small, medium, large difference between two populations:
+ Big is A12 >= 0.71
+ Medium is A12 >=0.64
+ Small is A12 >= 0.56
