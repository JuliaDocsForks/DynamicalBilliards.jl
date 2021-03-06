![DynamicalBilliards v2.0 Logo: The Julia billiard](https://raw.githubusercontent.com/JuliaDynamics/JuliaDynamicsDocumentation.jl/master/animations/billiards/DynamicalBilliards_logo_animated.gif?raw=true)

A Julia package for dynamical billiard systems in two dimensions.
The goals of the package is to provide a flexible and intuitive framework for fast implementation of billiard systems of arbitrary construction.

| **Documentation**   | **Citation** | **Travis**     | **AppVeyor** | **Gitter** |
|:--------:|:--------:|:---------------:|:-----:|:-----:|
|[![](https://img.shields.io/badge/docs-latest-blue.svg)](https://JuliaDynamics.github.io/DynamicalBilliards.jl/latest), [![](https://img.shields.io/badge/docs-stable-blue.svg)](https://JuliaDynamics.github.io/DynamicalBilliards.jl/stable)| [![status](http://joss.theoj.org/papers/753469f6b18c9c38127a7727d13c87cd/status.svg)](http://joss.theoj.org/papers/753469f6b18c9c38127a7727d13c87cd) | [![Build Status](https://travis-ci.org/JuliaDynamics/DynamicalBilliards.jl.svg?branch=master)](https://travis-ci.org/JuliaDynamics/DynamicalBilliards.jl) | [![Build status](https://ci.appveyor.com/api/projects/status/ksgb8pv5xl0j315y?svg=true)](https://ci.appveyor.com/project/JuliaDynamics/dynamicalbilliards-jl-wt09b) | [![Gitter](https://img.shields.io/gitter/room/nwjs/nw.js.svg)](https://gitter.im/JuliaDynamics/Lobby)

If you have used this package for research that resulted in a publication, please be
kind enough to cite the paper associated with DynamicalBilliards.jl. The DOI is
https://doi.org/10.21105/joss.00458 and you can cite as:

>G. Datseris, [The Journal of Open Source Software **2**, 458
(2017)](https://doi.org/10.21105/joss.00458).

or if you use BibTeX:
```latex
@article{Datseris2017,
  doi = {10.21105/joss.00458},
  url = {https://doi.org/10.21105/joss.00458},
  year  = {2017},
  month = {nov},
  publisher = {The Open Journal},
  volume = {2},
  number = {19},
  pages = {458},
  author = {George Datseris},
  title = {{DynamicalBilliards}.jl: An easy-to-use,  modular and extendable Julia package for Dynamical Billiard systems in two dimensions.},
  journal = {The Journal of Open Source Software}
}
```

## Features
Please see the documentation for list of features, tutorials and installation instructions.

## Acknowledgements
This package is mainly developed by George Datseris. However, this development would not have been possible without significant help from other people:

1. [Lukas Hupe](https://github.com/lhupe)(@lhupe) Contributed the lyapunov spectrum calculation for magnetic propagation, implemented the boundary map function and did other contributions in bringing this package to version 2.0 (see [here](https://github.com/JuliaDynamics/DynamicalBilliards.jl/projects/1)).
1. [Diego Tapias](https://github.com/dapias) (@dapias) Contributed the lyapunov spectrum calculation method for straight propagation.
1. [David. P. Sanders](https://github.com/dpsanders) (@dpsanders) and [Ragnar Fleischmann](https://www.ds.mpg.de/person/20199/118124) contributed in fruitful discussions about the programming and physics of Billiard systems all-around.
2. [Christopher Rackauckas](https://github.com/ChrisRackauckas) (@ChrisRackauckas) helped set-up the continuous integration, testing, documentation publishing and all around package development-related concepts.
3. [Tony Kelman](https://github.com/tkelman) (@tkelman) helped significantly in the package publication process, especially in making it work correctly without destroying METADATA.jl.
