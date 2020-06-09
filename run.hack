#!/usr/bin/env hhvm
require_once __DIR__.'/vendor/hh_autoload.hh';

<<__EntryPoint>>
async function main(): Awaitable<void> {
  (new Mandelbrot())->run();
}
