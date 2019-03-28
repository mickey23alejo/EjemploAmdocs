xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns1="http://www.kruger.com.ec/";
declare namespace ns3 = "http://telefonica.cl/TefResponseHeader/V1";

declare namespace amd = "java:amdocs.ar.datalayer.datatypes";

declare variable $l9GetNonDisputedAccountBalanceResponse as element()  external;


declare function local:func($l9GetNonDisputedAccountBalanceResponse as element() ) as element()  {
    <ns2:GetAccountBalanceResponse>
        <ns2:GetAccountBalanceResponseData>
            <ns2:accountBalanceList>


          </ns2:accountBalanceList>
        </ns2:GetAccountBalanceResponseData>
   </ns2:GetAccountBalanceResponse>
};

local:func($l9GetNonDisputedAccountBalanceResponse)