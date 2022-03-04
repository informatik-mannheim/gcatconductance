# Copyright 2021 by the authors.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Test file
library(testthat)

context("conductance") # Infos

test_that("2", {
  w = ones_weights(c("A", "T"), 2)
  sc = set_conductance(c("AA", "AT"), w, 2)
  expect_equal(sc, 0.5)
})

test_that("Codon", {
  w = ones_weights(nuc_bases(), 3)
  sc = set_conductance("ATG", w, 4)
  expect_equal(sc, 1)
})
