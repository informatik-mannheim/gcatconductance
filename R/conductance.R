# prototype for conductance
library(stringi)

# TODO:
# wedges: make independent of numbers, use any symbol.

#' Calculate sum of weighted edges for a set S.
#' @param tuples List of tuples represented by a vector of strings.
#' @param W List of transition weight matrices. The size of the list
#' must be the tuple size.
#' @param n Alphabet size, e.g. |{A, T, C, G}| = 4.
#' @return Sum of weighted edges.
#' @export
sum_all_wedges = function(tuples, W, n) {
  l = length(W) # Tuple length
  # For all tuples...
  s = sapply(tuples, function(t) {
    tv = strsplit(t, "")[[1]]
    # For all positions in tuple t...
    sl = sapply(1:l, function(i) {
      w = W[[i]] # i-th transition matrix
      sp = sapply(1:n, function(j) w[tv[i], j])
      sp
    })
    sl # remove later
  })
  sum(s)
}


#' Calculate sum of internal weighted edges for a set S.
#' @param tuples List of tuples represented by a vector of strings.
#' @param W List of transition weights.
#' @return Sum of weighted internal edges.
#' @export
sum_intern_wedges = function(tuples, W) {
  S = to_matrix(tuples)
  l = length(W) # Tuple size
  ro = asplit(S, 1) # get rows
  k = expand.grid(ro, ro) # all combinations
  idx = apply(k, 1, function(r) {
    a = r[[1]]
    b = r[[2]]
    diff = sapply(1:l, function(i) if (a[i] != b[i]) 1 else 0)
    h = sum(diff)
    # print(c(a = a, b = b, h = h))
    if (h == 1) TRUE else FALSE
  })
  pairs = k[idx, ]
  q = dim(pairs)[1]
  if (dim(pairs)[1] == 0) {
    return(0)
  } # nothing to do.
  # For all pairs...
  s = apply(pairs, 1, function(p) {
    p1 = p[[1]] # first tuple
    p2 = p[[2]] # second tuple
    # For all positions in tuples p1 and p2...
    sl = sapply(1:l, function(i) {
      w = W[[i]] # i-th transition matrix
      i1 = p1[i]
      i2 = p2[i]
      w[i1, i2]
    })
    sl
  })
  sum(s)
}

#' Calculate the conductance for a set S of tuples.
#' @param tuples List of tuples represented by a vector of strings.
#' @param W List of transition weights matrices.
#' @param n Alphabet size, e.g. |{A, T, C, G}| = 4.
#' @return Set conductane.
#' @export
set_conductance = function(tuples, W, n) {
  i = sum_intern_wedges(tuples, W)
  e = sum_all_wedges(tuples, W, n)
  (e - i) / e
}

#' Calculate the set conductance for a partition.
#'
#' @param tuples List of tuples represented by a vector of strings.
#' @param p Partitions for tuples. The size of p must match the size of tuples.
#' @param W List of transition weights matrices.
#' @param n Alphabet size, e.g. |{A, T, C, G}| = 4.
#' @return Vector of set partitions
#' @export
part_conductance = function(tuples, p, W, n) {
  P = split(tuples, p)
  s = sapply(P, function(S) {
    sc = set_conductance(S, W, n)
    sc
  })
  s
}

# to base package?
to_matrix = function(S) {
  l = lapply(S, function(s) strsplit(s, "")[[1]])
  M = stri_list2matrix(l)
  t(M)
}