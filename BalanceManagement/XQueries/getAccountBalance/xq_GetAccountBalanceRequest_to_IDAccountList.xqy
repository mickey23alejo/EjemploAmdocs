xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";


declare variable $GetAccountBalanceRequest as element() external;

declare function local:func($GetAccountBalanceRequest as element() ) as element() {
    <AccountList>
          <ns1:customerAccountInfo>
              <ns1:ID>{fn:data($GetAccountBalanceRequest/ns1:GetAccountBalanceRequestData/ns1:customerAccountInfo/ns1:ID)}</ns1:ID>
              { 
              if (fn:data($GetAccountBalanceRequest/ns1:GetAccountBalanceRequestData/ns1:customerAccountInfo/ns1:cmAccountId)) then
              <ns1:cmAccountId>{fn:data($GetAccountBalanceRequest/ns1:GetAccountBalanceRequestData/ns1:customerAccountInfo/ns1:cmAccountId)}</ns1:cmAccountId>
              else ()
              }
          </ns1:customerAccountInfo>
    </AccountList>
};

local:func($GetAccountBalanceRequest)