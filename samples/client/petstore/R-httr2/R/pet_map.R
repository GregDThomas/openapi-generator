#' Create a new PetMap
#'
#' @description
#' A mock map of a pet and some properties
#'
#' @docType class
#' @title PetMap
#' @description PetMap Class
#' @format An \code{R6Class} generator object
#' @field pet  named list(character) [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
PetMap <- R6::R6Class(
  "PetMap",
  public = list(
    `pet` = NULL,

    #' @description
    #' Initialize a new PetMap class.
    #'
    #' @param pet pet
    #' @param ... Other optional arguments.
    initialize = function(`pet` = NULL, ...) {
      if (!is.null(`pet`)) {
        stopifnot(is.vector(`pet`), length(`pet`) != 0)
        sapply(`pet`, function(x) stopifnot(is.character(x)))
        self$`pet` <- `pet`
      }
    },

    #' @description
    #' To JSON String
    #'
    #' @return PetMap in JSON format
    toJSON = function() {
      PetMapObject <- list()
      if (!is.null(self$`pet`)) {
        PetMapObject[["pet"]] <-
          self$`pet`
      }
      PetMapObject
    },

    #' @description
    #' Deserialize JSON string into an instance of PetMap
    #'
    #' @param input_json the JSON input
    #' @return the instance of PetMap
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`pet`)) {
        self$`pet` <- ApiClient$new()$deserializeObj(this_object$`pet`, "map(character)", loadNamespace("petstore"))
      }
      self
    },

    #' @description
    #' To JSON String
    #'
    #' @return PetMap in JSON format
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`pet`)) {
          sprintf(
          '"pet":
            %s
          ',
          jsonlite::toJSON(lapply(self$`pet`, function(x){ x }), auto_unbox = TRUE, digits = NA)
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },

    #' @description
    #' Deserialize JSON string into an instance of PetMap
    #'
    #' @param input_json the JSON input
    #' @return the instance of PetMap
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`pet` <- ApiClient$new()$deserializeObj(this_object$`pet`, "map(character)", loadNamespace("petstore"))
      self
    },

    #' @description
    #' Validate JSON input with respect to PetMap and throw an exception if invalid
    #'
    #' @param input the JSON input
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
    },

    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of PetMap
    toString = function() {
      self$toJSONString()
    },

    #' @description
    #' Return true if the values in all fields are valid.
    #'
    #' @return true if the values in all fields are valid.
    isValid = function() {
      TRUE
    },

    #' @description
    #' Return a list of invalid fields (if any).
    #'
    #' @return A list of invalid fields (if any).
    getInvalidFields = function() {
      invalid_fields <- list()
      invalid_fields
    },

    #' @description
    #' Print the object
    print = function() {
      print(jsonlite::prettify(self$toJSONString()))
      invisible(self)
    }
  ),
  # Lock the class to prevent modifications to the method or field
  lock_class = TRUE
)
## Uncomment below to unlock the class to allow modifications of the method or field
# PetMap$unlock()
#
## Below is an example to define the print function
# PetMap$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# PetMap$lock()

