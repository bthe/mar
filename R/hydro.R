#' @title Umhverfismælingar Hafrannsóknastofnunnar
#' @param con Tegning við Oracle grunn
#' @name hydro
#' @return SQL fyrirspurn

#' @rdname hydro
#' @export
hydro_hitamaelar <- function(con) {
  tbl_mar(con,"hydro.hitamaelar") %>%
    dplyr::select(-c(snt:sbn)) %>%
    dplyr::mutate(ar = to_number(to_char(timi, "YYYY")))
}

#' @rdname hydro
#' @export
hydro_stadir <- function(con) {
  tbl_mar(con, "hydro.stadir") %>%
    dplyr::select(-c(snt:sbn))
}

#' @rdname hydro
#' @export
hydro_stodvanofn <- function(con) {
  tbl_mar(con, "hydro.stodvanofn") %>%
    dplyr::mutate(lengd = -lengd * 100,
           breidd = breidd * 100) %>%
    geoconvert()
}

#' @rdname hydro
#' @export
hydro_observation <- function(con) {
  tbl_mar(con, "hydro.observation") %>%
    dplyr::select(-c(snt:sbn))
}

#' @rdname hydro
#' @export
hydro_trolltog <- function(con) {
  tbl_mar(con, "hydro.trolltog") %>%
    dplyr::select(-c(snt:sbn))
}

#' @rdname hydro
#' @export
hydro_station <- function(con) {
  tbl_mar(con, "hydro.station") %>%
    dplyr::select(-c(snt:sbn)) %>%
    dplyr::mutate(lon =   as.integer(longitude) * 100 + ifelse(is.na(la_sec), 0, as.integer(lo_sec)),
           lat =   as.integer(latitude)  * 100 + ifelse(is.na(lo_sec), 0, as.integer(la_sec))) %>%
    geoconvert(col.names = c("lon", "lat")) %>%
    dplyr::mutate(lon = ifelse(lo_id == "W", -lon,  lon),
           lat = ifelse(la_id == "N",  lat, -lat)) %>%
    dplyr::select(l_id:id, lon, lat, q_cont:name)
}

#' @rdname hydro
#' @export
hydro_sonda <- function(con) {
  tbl_mar(con, "hydro.sonda") %>%
    dplyr::select(-c(snt:sbg))
}
