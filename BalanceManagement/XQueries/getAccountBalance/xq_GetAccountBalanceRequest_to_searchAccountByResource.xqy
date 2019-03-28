xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns2="http://www.kruger.com.ec/";

declare namespace amd = "java:amdocs.csm3g.datatypes";

declare variable $GetAccountBalanceRequest as element()  external;

declare function local:func($GetAccountBalanceRequest as element()) as element()  {
    <ns2:l9SearchPostpaidAccountByResource>
        <ns2:arg0>
            <parameterValue>{fn:data($GetAccountBalanceRequest/ns1:GetAccountBalanceRequestData/ns1:msisdn)}</parameterValue>
            <parameterType>C</parameterType>
        </ns2:arg0>
    </ns2:l9SearchPostpaidAccountByResource>
};

local:func($GetAccountBalanceRequest)