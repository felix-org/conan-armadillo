# conan-armadillo
A conan wrapper for https://github.com/felix-org/armadillo-code

### Build instructions


To add Armadillo to your conan cache:
```sh

conan create . -s compiler.cppstd=14 --build missing

```


#### Dependencies

:warning: By default, Armadillo will be built _without_ `BLAS` and `LAPACK`, therefore requires no further dependencies.
