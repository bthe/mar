


#' Lesa vms gögn
#'
#' Athugið aðgangur er takmarkaður við fáa notendur á Hafrannsóknastofnun
#'
#' @name vms
#'
#' @param con XXX
#' @param year XXX
#'
#' @export
#'
vms <- function(con, year) {

  q <-
    tbl_mar(con, "stk.stk_vms_v") %>%
    dplyr::mutate(lon = poslon * 45 / atan(1),
                  lat = poslat * 45 / atan(1),
                  heading = heading * 45 / atan(1),
                  speed = speed * 3600/1852)
  if(!missing(year)) {
    y1 <- paste0(year, "-01-01")
    y2 <- paste0(year + 1, "-01-01")
    q <-
      q %>%
      dplyr::filter(recdate >= to_date(y1, "YYYY:MM:DD"),
                    recdate   <  to_date(y2, "YYYY:MM:DD"))
  }

  q %>%
    dplyr::select(mobileid, vid = skip_nr, date = recdate, posdate, lon, lat, speed,
                  heading, in_out_of_harbor, harborid)

}
