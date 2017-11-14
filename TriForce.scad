l=30;                 // length of one equilateral triangle
x=2;                  // offset of top triangle from base triangle
                      // parameter validation
assert(l > 0);
assert(x > 0);
assert(x <= l/2);

h=x*sqrt(3);          // calculated height to maintain 60 degree slope
y=l/2*sqrt(3);        // calculated long leg

TriPoints = [
  [  0,   0,    0 ],  // 0
  [  l,   0,    0 ],  // 1
  [l/2,   y,    0 ],  // 2
  [  x,   h/2,  h ],  // 3
  [l-x,   h/2,  h ],  // 4
  [l/2, y-h/2,  h ]]; // 5
  
TriFaces = [
  [ 0, 1, 2 ],        // bottom
  [ 3, 4, 1, 0 ],     // front
  [ 5, 4, 3 ],        // top
  [ 4, 5, 2, 1 ],     // right
  [ 5, 3, 0, 2 ] ];   // left
  
translate([    0,  0,  0]) polyhedron( TriPoints, TriFaces );
translate([l-2*x,  0,  0]) polyhedron( TriPoints, TriFaces );
translate([l/2-x,y-h,  0]) polyhedron( TriPoints, TriFaces );