use function printf;
use function microtime;

final class Mandelbrot {

  const int BAILOUT = 16;
  const int MAX_ITERATIONS = 1000;
  
  public function run(): void {
    $d1 = microtime(true);
    for ($y = -39; $y < 39; $y++) {
      for ($x = -39; $x < 39; $x++) {
        $this->iterate($x / 40.0, $y / 40.0);
      }
    }
    $d2 = microtime(true);
    $diff = $d2 - $d1;
    printf("Hack Elapsed %0.3f\n", $diff);
  }

  <<__Rx, __Memoize>>
  private function iterate(
    float $x,
    float $y
  ): int {
    $cr = $y - 0.5;
    $ci = $x;
    $zr = 0.0;
    $zi = 0.0;
    $i = 0;
    while (true) {
      $i++;
      $temp = $zr * $zi;
      $zr2 = $zr * $zr;
      $zi2 = $zi * $zi;
      $zr = $zr2 - $zi2 + $cr;
      $zi = $temp + $temp + $ci;
      if ($zi2 + $zr2 > self::BAILOUT) {
        return $i;
      }
      if ($i > self::MAX_ITERATIONS) {
        return 0;
      }
    }
  }
}
