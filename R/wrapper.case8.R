#' Returns Wealth at end of savings phase (adj. for inflation)
#'
#' @param rate The interest rate per period. Default is zero. Must be entered as decimal
#' @param nper_savings The total number of payment periods. Default is one period
#' @param nper_withdrawals The total number of withdraws periods. Default is zero period
#' @param inflation The inflation rate per period. Default is zero. Must be entered as decimal
#' @param pmt The payment made each period (annuity). Must be entered as a negative number.
#' @seealso \code{\link{fv}}
#' @seealso \code{\link{pmt}}
#' @export
#' @examples
#' wrapper.case8(rate=0.04,inflation=0.02,nper_savings=35,nper_withdrawals=30,pmt=-1000)

wrapper.case8 <- function(rate=0,inflation=0,nper_savings=1,nper_withdrawals=0,pmt=0){
  
  fvTemp=fv(rate,inflation,nper_savings,0,pmt,TRUE)
  fvTemp=fvTemp[length(fvTemp)]
  pmtTemp=pmt(rate, inflation,nper_withdrawals,fvTemp)
  fv=pmtTemp[1]
  
  return(fv)
}