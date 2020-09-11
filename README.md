A "Hello, World!" program generally is a computer program that outputs or
displays the message "Hello, World!".


```c
kernel():
Prints "Hello world!" from GPU.
A kernel function in CUDA is defined with __global__. NVCC picks it up and
generates (intermediate) GPU code for this function. It also generates a
placeholder (CPU code) that can be trigger the execution of this kernel
through CUDA runtime. Its return type is always "void".

1. printf is managed by CUDA driver (how?).
```

```c
main():
Prints "Hello world!" from GPU & CPU.
A kernel is called with "kernel<<<blocks, threads>>>(arguments...)" syntax.
Each execution of kernel is called a thread. A number of threads are grouped
into thread blocks. All thread blocks of a kernel call are grouped into a
grid. Threads within a block can communicate and synchronize with each
other, but blocks execute independently of each other (though they can still
communicate through global GPU memory).

1. Kernel is called with 12 "threads".
2. Waits for GPU to finish executing the kernel.
3. CPU prints after GPU is already done.
```

See [main.cu] for code.

[main.cu]: main.cu


### references

- [CUDA by Example :: Jason Sanders, Edward Kandrot](http://www.mat.unimi.it/users/sansotte/cuda/CUDA_by_Example.pdf)
- [CUDA Crash Course (v2): Visual Studio 2019 Setup :: CoffeeBeforeArch](https://www.youtube.com/watch?v=cuCWbztXk4Y)
