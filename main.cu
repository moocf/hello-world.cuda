#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <stdio.h>
#include "error.h"


// Prints "Hello world!" from GPU.
// A kernel function in CUDA is defined with __global__. NVCC picks it up and
// generates (intermediate) GPU code for this function. It also generates a
// placeholder (CPU code) that can be trigger the execution of this kernel
// through CUDA runtime. Its return type is always "void".
// 1. printf is managed by CUDA driver (how?).
__global__ void kernel() {
  printf("GPU: Hello world!\n"); // 1
}


// Prints "Hello world!" from GPU & CPU.
// A kernel is called with "kernel<<<blocks, threads>>>(arguments...)" syntax.
// Each execution of kernel is called a thread. A number of threads are grouped
// into thread blocks. All thread blocks of a kernel call are grouped into a
// grid. Threads within a block can communicate and synchronize with each
// other, but blocks execute independently of each other (though they can still
// communicate through global GPU memory).
// 1. Kernel is called with 12 "threads".
// 2. Waits for GPU to finish executing the kernel.
// 3. CPU prints after GPU is already done.
int main() {
  kernel<<<1, 12>>>();          // 1
  TRY(cudaDeviceSynchronize()); // 2
  printf("CPU: Hello world!");  // 3
  return 0;
}
