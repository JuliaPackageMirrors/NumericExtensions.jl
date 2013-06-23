# Test of vbroadcast

using NumericExtensions
using Base.Test

#### 2D ####

x = randn(5, 6)
yr = rand(6) + 0.5
yrm = reshape(yr, 1, 6)
yc = rand(5) + 0.5

# badd

@test_approx_eq badd(x, yc, 1) x .+ yc
@test_approx_eq badd(x, yr, 2) x .+ yrm

r = copy(x); badd!(r, yc, 1)
@test_approx_eq r x .+ yc

r = copy(x); badd!(r, yr, 2)
@test_approx_eq r x .+ yrm

# bsubtract

@test_approx_eq bsubtract(x, yc, 1) x .- yc
@test_approx_eq bsubtract(x, yr, 2) x .- yrm

r = copy(x); bsubtract!(r, yc, 1)
@test_approx_eq r x .- yc

r = copy(x); bsubtract!(r, yr, 2)
@test_approx_eq r x .- yrm

# bmultiply

@test_approx_eq bmultiply(x, yc, 1) x .* yc
@test_approx_eq bmultiply(x, yr, 2) x .* yrm

r = copy(x); bmultiply!(r, yc, 1)
@test_approx_eq r x .* yc

r = copy(x); bmultiply!(r, yr, 2)
@test_approx_eq r x .* yrm

# bdivide

@test_approx_eq bdivide(x, yc, 1) x ./ yc
@test_approx_eq bdivide(x, yr, 2) x ./ yrm

r = copy(x); bdivide!(r, yc, 1)
@test_approx_eq r x ./ yc

r = copy(x); bdivide!(r, yr, 2)
@test_approx_eq r x ./ yrm


#### 3D ####

x = randn(4, 5, 6)

y1 = rand(4) + 0.5; y1m = reshape(y1, 4, 1, 1)
y2 = rand(5) + 0.5; y2m = reshape(y2, 1, 5, 1)
y3 = rand(6) + 0.5; y3m = reshape(y3, 1, 1, 6)

y12 = rand(4, 5) + 0.5; y12m = reshape(y12, 4, 5, 1)
y13 = rand(4, 6) + 0.5; y13m = reshape(y13, 4, 1, 6)
y23 = rand(5, 6) + 0.5; y23m = reshape(y23, 1, 5, 6)

# badd

@test_approx_eq badd(x, y1, 1) x .+ y1m
@test_approx_eq badd(x, y2, 2) x .+ y2m
@test_approx_eq badd(x, y3, 3) x .+ y3m

@test_approx_eq badd(x, y12, (1, 2)) x .+ y12m
@test_approx_eq badd(x, y13, (1, 3)) x .+ y13m
@test_approx_eq badd(x, y23, (2, 3)) x .+ y23m

# bsubtract

@test_approx_eq bsubtract(x, y1, 1) x .- y1m
@test_approx_eq bsubtract(x, y2, 2) x .- y2m
@test_approx_eq bsubtract(x, y3, 3) x .- y3m

@test_approx_eq bsubtract(x, y12, (1, 2)) x .- y12m
@test_approx_eq bsubtract(x, y13, (1, 3)) x .- y13m
@test_approx_eq bsubtract(x, y23, (2, 3)) x .- y23m

# bmultiply

@test_approx_eq bmultiply(x, y1, 1) x .* y1m
@test_approx_eq bmultiply(x, y2, 2) x .* y2m
@test_approx_eq bmultiply(x, y3, 3) x .* y3m

@test_approx_eq bmultiply(x, y12, (1, 2)) x .* y12m
@test_approx_eq bmultiply(x, y13, (1, 3)) x .* y13m
@test_approx_eq bmultiply(x, y23, (2, 3)) x .* y23m

# bdivide

@test_approx_eq bdivide(x, y1, 1) x ./ y1m
@test_approx_eq bdivide(x, y2, 2) x ./ y2m
@test_approx_eq bdivide(x, y3, 3) x ./ y3m

@test_approx_eq bdivide(x, y12, (1, 2)) x ./ y12m
@test_approx_eq bdivide(x, y13, (1, 3)) x ./ y13m
@test_approx_eq bdivide(x, y23, (2, 3)) x ./ y23m


