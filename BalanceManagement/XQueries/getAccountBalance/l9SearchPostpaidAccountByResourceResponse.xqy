xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
declare namespace ns1="http://www.kruger.com.ec/";



declare variable $l9SearchPostpaidAccountByResourceResponse as element() external;

declare function local:func($l9SearchPostpaidAccountByResourceResponse as element()) as element()  {
    <AccountList>
    {
    for $AccountSearchResultInfoFixed in $l9SearchPostpaidAccountByResourceResponse/ns1:return
          return
          <ns2:customerAccountInfo>
              <ns2:ID>{fn:data($AccountSearchResultInfoFixed/accountNo)}</ns2:ID>
          </ns2:customerAccountInfo>
          }
    
    </AccountList>
};

local:func($l9SearchPostpaidAccountByResourceResponse)