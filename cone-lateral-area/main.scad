// visualize how a circular "wedge" shape bends into a cone & vice versa, as
// well as how the wedge angle/shape affects the resulting cone "sharpness"

// thickness of surface
EPS = .01;

// radius of unraveled cone cutout
R = 10;

// number of slices
N = 96;

// proportion of circle
X = .8;

// animation curve
t = (1 + sin($t*360))/2;

da = 360/N;
db = 360/(N*X) * sqrt(1-X^2);
slice_poly = R * [[0, 0], [1, 0], [cos(da), sin(da)]];

module slice(n) {
  if (n > 0) {
    linear_extrude(height=EPS) polygon(slice_poly);
    rotate([db*t, 0, da]) slice(n-1);
  }
}

slice(N*X);
