import 'dart:math';

double randomNormal(double mean, double stdDev) {
  // Generate two random numbers from a uniform distribution.
  final u1 = 1.0 - Random().nextDouble();
  final u2 = 1.0 - Random().nextDouble();

  // Use the Box-Muller transform to convert them into a normal distribution.
  final z0 = sqrt(-2.0 * log(u1)) * cos(2.0 * pi * u2);

  // Scale and shift the result to have the desired mean and standard deviation.
  final randomNormal = mean + stdDev * z0;

  return randomNormal;
}