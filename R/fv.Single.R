#' Returns the future value of an single payment (fv)
#'
#' @param rate The interest rate per period. Default is zero. Must be entered as decimal or ts
#' @param inflation The inflation rate per period. Default is zero. Must be entered as decimal or ts
#' @param nper The total number of payment periods. Default is one period. If rate and inflation are entered as ts nper is ignored.
#' @param pv The present value of single payment made today. Default is assumed to be zero. Must be entered as a negative number
#' @seealso \code{\link{fv}}
#' @export
#' @examples
#' fv.single(rate=0.01,nper=20,pv=-1000)

fv.single <- function(rate=0,inflation=0,nper=1,pv=0){
  ##Type check
  if(!(is.ts(inflation) || is.scalar(inflation))) return(stop("inflation must either be of type scalar or ts.",call. = FALSE))
  if(!(is.ts(rate) || is.scalar(rate))) return(stop("rate must either be of type scalar or ts",call. = FALSE))
  if(!is.scalar(nper)|| nper<1 ) return(stop("nper must be of type integer larger than zero",call. = FALSE))
  if(!is.scalar(pv)) return(stop("pv must be of type scalar",call. = FALSE))

  #Find start, end and frequency
  if(is.ts(rate)){
    start = start(rate)
    end = end(rate)
    frequency = frequency(rate)
  }else if(is.ts(inflation)) {
    start = start(inflation)
    end = end(inflation)
    frequency = frequency(inflation)
  }else{
    start = c(1,1)
    end = c(nper,1)
    frequency = 1
  }

  if(is.scalar(inflation)){
    inflation = ts(rep(inflation,nper), frequency = 1, start = start, end = end)
  }

  if(is.scalar(rate)){
    rate = ts(rep(rate,nper), frequency = 1, start = start, end = end)
  }


  accRate = ts(cumprod(rate+1)-1, frequency = frequency(rate), start = start, end = end)
  fv = -pv*(1+accRate) ## non inflation adjusted

  if (any(inflation!=0)){
    fv = infladj.single(fv,inflation,nper)
  }
  return(fv)
}
