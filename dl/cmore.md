malloc
  memory persist out of the function scope
  array length not known in compile time
  needs to be freed

array[10]
  length known at compile time

Header guard preprocessor directives
#ifndef HEADER_H // checks if HEADER_H is not defined
  if true (note defined) the code inside runs, starting with #define HEADER_H
  if false (already declared) code continues from matching #endif
this prevents including multiple definitions when 2 seperate #include lines include the same header.


Layer layer;  // direct struct variable
layer.weights = xavier_init(64, 128);  // using dot
layer.output_size = 64;  // using dot

Layer* layer_ptr;  // pointer to struct
layer_ptr->weights    // using arrow
(*layer_ptr).weights  // using dot with dereference
