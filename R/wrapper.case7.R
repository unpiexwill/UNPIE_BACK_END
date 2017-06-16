#' Returns the PV(payments), adj. for inflation.
#'
#' @param rate The interest rate per period. Default is zero. Must be entered as decimal
#' @param nper The total number of payment periods. Default is one period
#' @param pmt The payment made each period (annuity). Must be entered as a negative number.
#' @param inflation The inflation rate per period. Default is zero. Must be entered as decimal
#' @seealso \code{\link{rate.real}}
#' @seealso \code{\link{pv.annuity}}
#' @export
#' @examples
#' wrapper.case7(rate=0.04,inflation=0.02,nper=35,pmt=-1000)

wrapper.case7 <- function(rate=0,inflation=0,nper=1,pmt=0){
  
  realRate = rate.real(rate,inflation)
  pv = pv.annuity(realRate,0,nper,pmt,FALSE,FALSE) #PV(payments), adj. for inflation
  
  return(pv)
}
