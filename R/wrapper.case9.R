#' Returns required wealth at end of savings phase (adj. for inflation)
#'
#' @param rate The interest rate per period. Default is zero. Must be entered as decimal
#' @param nper_savings Time horizon for savings (years). Default is one
#' @param nper_withdrawals Time horizon for withdrawals (years). Default is zero
#' @param inflation The inflation rate per period. Default is zero. Must be entered as decimal
#' @seealso \code{\link{rate.real}}
#' @seealso \code{\link{pv}}
#' @export
#' @examples
#' wrapper.case9(rate=0.04,inflation=0.02,nper_savings=35,nper_withdrawals=30,pmt=-1000)

wrapper.case9 <- function(rate=0,inflation=0,nper_savings=1,nper_withdrawals=0,pmt=0){
  
  realRate = rate.real(rate,inflation)
  pvTemp=pv(rate=realRate,inflation=0, nper_withdrawals,fv=0,pmt=pmt,pmtinfladj=FALSE, pmtUltimo=TRUE)
  pv=pv.single(realRate,0,nper_savings,-pvTemp[nper_withdrawals])
  pmt=pmt(rate, inflation, nper_savings, fv = pv[nper_savings])[1]
  
  
  return(pmt)
}
