#include "sum.hpp"
#include <benchmark/benchmark.h>
#include <iostream>

static void BM_Sum(benchmark::State &state) {
  int temp = 0;
  for (auto _ : state)
    benchmark::DoNotOptimize(temp = Sum(10, 20));
}
BENCHMARK(BM_Sum);
BENCHMARK_MAIN();
