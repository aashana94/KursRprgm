
context("fast_swe_pop()")

test_that("fast_swe_pop()", {  
  library(pxweb)
  expect_attached_package("pxweb")
  expect_true(exists("fast_swe_pop"),
              info = "Fel: fast_swe_pop() saknas.")
  checkmate::expect_function(fast_swe_pop, nargs = 0,
                             info = "Fel: babylon är inte en funktion.")
#  expect_function_self_contained(object = fast_swe_pop, "Fel: Funktionen innehåller fria variabler")

  
  expect_silent(fast_swe_pop_output <- fast_swe_pop())
  expect_class(fast_swe_pop_output, "data.frame",
              info="Fel: fast_swe_pop() returnerar inte en data.frame.")
  expect_names(names(fast_swe_pop_output), permutation.of =  c("year", "population"))
  expect_numeric(fast_swe_pop_output$year)
  expect_numeric(fast_swe_pop_output$population)

  expect_equal(fast_swe_pop_output$year[12:15], c(1979,1980,1981,1982))
  expect_equal(fast_swe_pop_output$population[12:15], c(8303010,8317937,8323033,8327484))

})
