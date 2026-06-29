# Compile-time PIC Generation using LiveTyping information

🌐 [English](README.md) | [Español](README.es.md)

---

This repository contains the work developed for my Master’s thesis in Computer
Science at the University of Buenos Aires. It includes the implementation,
experiments, and thesis report on the proactive generation of
**Polymorphic Inline Caches** (PICs) in Smalltalk using type information
collected by LiveTyping.

## Abstract

Dynamic object-oriented languages such as Smalltalk rely on run-time
message dispatch, where the method to execute is determined from the
concrete class of the receiver. Although this model provides
flexibility and supports live program evolution, it also introduces
a performance cost, especially at frequently executed send sites.
Modern Smalltalk virtual machines mitigate this cost through
Just-in-Time compilation, Inline Caches, and Polymorphic Inline
Caches. However, these caches are traditionally constructed reactively
at run time, introducing an additional execution cost before the optimized
dispatch path becomes available.

This paper explores a proactive approach to Polymorphic Inline Cache
generation using type information collected by LiveTyping. Instead
of using PICs as a source of run-time type feedback, we invert the
direction of the information flow: previously collected LiveTyping
information is used to guide the generation of ICs and PICs before
the VM would normally construct them reactively. We implement this
approach in the OpenSmalltalk VM by adding VM-level support for
explicitly generating and installing dispatch caches, and by
integrating it at the image level with Cuis University and
LiveTyping.

We evaluate the technique through controlled microbenchmarks that
vary the number of send sites, receiver classes, and execution
iterations. The results show that proactive PIC generation reduces
the warm-up cost of dynamic dispatch, particularly during
early execution and in methods with multiple dynamic send sites,
while introducing a trade-off in generated code size and VM
code-space usage.

Keywords: Polymorphic Inline Caches (PIC), Inline Cache (IC), LiveTyping,
Just-in-Time Compilation (JIT), Dynamic Dispatch, OpenSmalltalk VM,
Virtual Machines (VM), Smalltalk

## Repository contents

* [`stouts/cuis/`](./stouts/cuis/): Cuis implementation and benchmarks.
* [`stouts/osvm/`](./stouts/osvm/): changes made to the OpenSmalltalk VM.
* [`cuis/`](./cuis/): Cuis image, virtual machines, and scripts used to run the experiments.
* [`report/report.pdf`](./report/report.pdf): complete Master’s thesis report.

## Thesis report

The complete thesis report, **“Compilación de PICs en Smalltalk a partir de LiveTyping,”** is available at [`report/report.pdf`](report/report.pdf). The report is currently available only in Spanish.
