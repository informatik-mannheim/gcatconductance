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

test_that("Code", {
  nucs = list(nuc_bases(), nuc_bases()) # Row and column names
  W1 = matrix(1, nrow = 4, ncol = 4) - diag(1, nrow = 4)
  dimnames(W1) = nucs
  
  sc = set_conductance("ATG", list(W1, W1, W1), 4)
  expect_equal(sc, 1)
})
