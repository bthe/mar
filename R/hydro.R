#' @export
hydro_hitamaelar <- function(mar) {
  tbl_mar(mar,"hydro.hitamaelar") %>%
    select(-c(snt:sbn)) %>%
    mutate(ar = to_number(to_char(timi, "YYYY")))
}
#' @export
hydro_stadir <- function(mar) {
  tbl_mar(mar, "hydro.stadir")
}
#' @export
hydro_stodvanofn <- function(mar) {
  tbl_mar(mar, "hydro.stodvanofn") %>%
    mutate(lon = -lengd * 100,
           lat = breidd * 100) %>%
    mar:::geoconvert()
}
#' @export
hydro_observation <- function(mar) {
  tbl_mar(mar, "hydro.observation") %>%
    select(-c(snt:sbn))
}
#' @export
hydro_trolltog <- function(mar) {
  tbl_mar(mar, "hydro.trolltog") %>%
    select(-c(snt:sbn))
}
#' @export
hydro_station <- function(mar) {
  tbl_mar(mar, "hydro.station") %>%
    select(-c(snt:sbn))
}
