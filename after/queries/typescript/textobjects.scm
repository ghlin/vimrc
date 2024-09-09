;extends

(type_arguments  (_) @parameter.inner)
(type_parameters (_) @parameter.inner)

(object_type
  ["," ";"] @_start
  .
  (property_signature) @parameter.inner
  (#make-range! "parameter.outer" @_start @parameter.inner))

(object_type
  .
  (property_signature) @parameter.inner
  .
  ["," ";"] @_end
  (#make-range! "parameter.outer" @parameter.inner @_end))

(tuple_type
  "," @_start
  .
  (_) @parameter.inner
  (#make-range! "parameter.outer" @_start @parameter.inner))

(tuple_type
  .
  (_) @parameter.inner
  .
  ","? @_end
  (#make-range! "parameter.outer" @parameter.inner @_end))
