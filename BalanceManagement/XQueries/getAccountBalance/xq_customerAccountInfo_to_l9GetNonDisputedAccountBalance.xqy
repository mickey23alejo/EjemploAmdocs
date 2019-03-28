xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns2="http://datatypes.datalayer.ar.amdocs";

declare namespace amd = "java:amdocs.ar.datalayer.datatypes";

declare variable $CustomerAccount as element()  external;

declare function local:func($CustomerAccount as element() ) as element()  {
    <ns2:l9GetNonDisputedAccountBalance>
        <ns2:arg0>
            <accountId>{fn:data($CustomerAccount/ns1:ID)}</accountId>
            { 
            if ( fn:data($CustomerAccount/ns1:cmAccountId) ) then
            <cmAccountNumber>{fn:data($CustomerAccount/ns1:cmAccountId)}</cmAccountNumber>
            else ()
            }
        </ns2:arg0>
    </ns2:l9GetNonDisputedAccountBalance>
};

local:func($CustomerAccount)