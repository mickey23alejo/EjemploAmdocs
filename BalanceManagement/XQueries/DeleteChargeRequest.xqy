xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.kruger.com.ec/";
(:: import schema at "../../AmdocsCkABP/WSDL/Invoicing/ChargeServiceBS.wsdl" ::)

declare namespace amd = "java:amdocs.bl3g.datatypes";

declare variable $chargeId as xs:string external;

declare function local:deleteChargeRequest($chargeId as xs:string) as element() (:: schema-element(ns1:deleteCharge) ::) {
    <ns1:deleteCharge>
        <ns1:arg0>
            <chargeId>
            {
                if(fn:empty(fn:data($chargeId)))
                then 0
                else
                      xs:long(fn:data($chargeId))
            }
            </chargeId>
        </ns1:arg0>
        <ns1:arg1>
            <correctionId>0</correctionId>
        </ns1:arg1>
    </ns1:deleteCharge>
};



local:deleteChargeRequest($chargeId)