xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
(:: import schema at "../XSD/BalanceManagementServiceLocalCl_v001.xsd" ::)
declare namespace ns1="http://telefonica.cl/TefError/V1";
(:: import schema at "../../AmdocsCommon/XSD/TefErrorCl_v001.xsd" ::)

declare variable $errorTrace as element() (:: schema-element(ns1:errorTrace) ::) external;

declare function local:viewRechargesFault($errorTrace as element() (:: schema-element(ns1:errorTrace) ::)) as element() (:: schema-element(ns2:ViewRechargesFault) ::) {
    <ns2:ViewRechargesFault>
        <ns2:Error>
            <ns1:code>
                <ns1:service>{fn:data($errorTrace/ns1:code/ns1:service)}</ns1:service>
                <ns1:operation>{fn:data($errorTrace/ns1:code/ns1:operation)}</ns1:operation>
                <ns1:layer>{fn:data($errorTrace/ns1:code/ns1:layer)}</ns1:layer>
                <ns1:tamSystem>{fn:data($errorTrace/ns1:code/ns1:tamSystem)}</ns1:tamSystem>
                <ns1:legacySystem>{fn:data($errorTrace/ns1:code/ns1:legacySystem)}</ns1:legacySystem>
                <ns1:api>{fn:data($errorTrace/ns1:code/ns1:api)}</ns1:api>
                <ns1:error>{fn:data($errorTrace/ns1:code/ns1:error)}</ns1:error>
            </ns1:code>
            <ns1:description>{fn:data($errorTrace/ns1:description)}</ns1:description>
            <ns1:details>
                <ns1:timeStamp>{fn:data($errorTrace/ns1:details/ns1:timeStamp)}</ns1:timeStamp>
                <ns1:cause>{fn:data($errorTrace/ns1:details/ns1:cause)}</ns1:cause>
            </ns1:details>
        </ns2:Error>
    </ns2:ViewRechargesFault>
};

local:viewRechargesFault($errorTrace)