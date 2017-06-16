#' Returns the future value of annuity payments (fv) with inflation adjusted.
#'
#' @param rate The interest rate per period. Default is zero. Must be entered as decimal
#' @param nper The total number of payment periods. Default is one period
#' @param pv The present value of single payment made today. Default is assumed to be zero. Must be entered as a negative number
#' @param inflation The inflation rate per period. Default is zero. Must be entered as decimal
#' @seealso \code{\link{fv.single}}
#' @seealso \code{\link{fv.annuity}}
#' @export
#' @examples
#' wrapper.case5(rate=0.04,inflation=0.02,nper=35,pv=-1000)

wrapper.case5 <- function(rate=0,inflation=0,nper=1,pv=0){
  
  pmt_infladj=fv.single(inflation,0,nper,pv/(1+inflation))
  fv=fv.annuity(rate,0,nper,-pmt_infladj)
  
  return(fv)
}
