#' @name adjacency_matrix
#' @title Creat adjacency matrix for all the operations in the context
#' @param ctx dlr_context object
#' @examples
#' library(aria)
#' ctx <- get_context()
#' register_ops(ctx, cars)
#' register_ops(ctx, data.frame)
#' x <- cpu_tensor(5, dims = 1)
#' y <- x ** 3
#' y <- (x ** 3) / 2
#' all.ops <- get_all_ops_ptr(ctx)
#' adj_mat <- adjacency_matrix(ctx)
#' print(adj_mat)
#' plot(adj_mat)
#' @export
adjacency_matrix <- function(ctx){
  mat <- .Call(C_adjacency_matrix, ctx[['_container']])
  class(mat) <- c("soprano_adjacency_matrix", class(mat))
  return(mat)
}

#' @name plot
#' @title Plot soprano adjacency matrix
#' @param adj_mat An object of class `soprano_adjacency_matrix`
#' @export
plot.soprano_adjacency_matrix<- function(adj_mat){
  # TODO: use visNetwork?
  # TODO: colour nodes do differ functions and tensors
  plot(igraph::graph_from_adjacency_matrix(adj_mat))
}

# TODO: rename etc.
plot.dlr_context <- function(ctx){
  plot(adjacency_matrix(ctx))
}
