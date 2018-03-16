#include "spdlog/spdlog.h"
#include <benchmark/benchmark.h>
#include <mutex>

static void BM_Sum(benchmark::State &state) {

  namespace spd = spdlog;
  static std::shared_ptr<spd::logger> logger1; 
  static std::once_flag Once;
  auto init = [&](){
    spd::set_async_mode(1048576);
    logger1 = spdlog::create<spd::sinks::simple_file_sink_mt>("vinit_logger", "logs/spd-bench-async.txt", true);
    logger1->set_pattern("[%Y-%b-%d %T.%e]: %v");
  };
  std::call_once(Once, init);
  double counter = 0.00;
  for (auto _ : state) {
    logger1->info("spdlog message #{}: This is some text for your pleasure", counter);
    ++counter;
  }
}

BENCHMARK(BM_Sum);
BENCHMARK_MAIN();