xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
(:: import schema at "../XSD/BalanceManagementServiceLocalCl_v001.xsd" ::)

declare namespace ns2 = "http://telefonica.cl/TefRequestHeader/V1";

declare variable $rechargeAgainstBillRequest as element() (:: schema-element(ns1:RechargeAgainstBillRequest) ::) external;

declare function local:rechargeAgainstBillRequestToRechargeService($rechargeAgainstBillRequest as element() (:: schema-element(ns1:RechargeAgainstBillRequest) ::)) as element() (:: schema-element(ns1:RechargeServiceRequest) ::) {
    <ns1:RechargeServiceRequest>
        <ns2:TefHeaderReq>
            <ns2:userLogin>{fn:data($rechargeAgainstBillRequest/ns2:TefHeaderReq/ns2:userLogin)}</ns2:userLogin>
            <ns2:serviceChannel>{fn:data($rechargeAgainstBillRequest/ns2:TefHeaderReq/ns2:serviceChannel)}</ns2:serviceChannel>
            {
                if ($rechargeAgainstBillRequest/ns2:TefHeaderReq/ns2:sessionCode)
                then <ns2:sessionCode>{fn:data($rechargeAgainstBillRequest/ns2:TefHeaderReq/ns2:sessionCode)}</ns2:sessionCode>
                else ()
            }
            <ns2:application>{fn:data($rechargeAgainstBillRequest/ns2:TefHeaderReq/ns2:application)}</ns2:application>
            {
                if ($rechargeAgainstBillRequest/ns2:TefHeaderReq/ns2:idMessage)
                then <ns2:idMessage>{fn:data($rechargeAgainstBillRequest/ns2:TefHeaderReq/ns2:idMessage)}</ns2:idMessage>
                else ()
            }
            <ns2:ipAddress>{fn:data($rechargeAgainstBillRequest/ns2:TefHeaderReq/ns2:ipAddress)}</ns2:ipAddress>
            {
                if ($rechargeAgainstBillRequest/ns2:TefHeaderReq/ns2:functionalityCode)
                then <ns2:functionalityCode>{fn:data($rechargeAgainstBillRequest/ns2:TefHeaderReq/ns2:functionalityCode)}</ns2:functionalityCode>
                else ()
            }
            <ns2:transactionTimestamp>{fn:adjust-dateTime-to-timezone(fn:current-dateTime(),())}</ns2:transactionTimestamp>
            <ns2:serviceName>{fn:data($rechargeAgainstBillRequest/ns2:TefHeaderReq/ns2:serviceName)}</ns2:serviceName>
            <ns2:version>{fn:data($rechargeAgainstBillRequest/ns2:TefHeaderReq/ns2:version)}</ns2:version>
        </ns2:TefHeaderReq>
        <ns1:RechargeServiceRequestData>
            <ns1:rechargeMethodInfo>
                {
                    if ($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:rechargeMethodInfo/ns1:debtCovered)
                    then <ns1:debtCovered>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:rechargeMethodInfo/ns1:debtCovered)}</ns1:debtCovered>
                    else ()
                }
                <ns1:rechargeAmount>
                    <ns1:amount>
                    {
                      if (fn:empty($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount))
                      then 0
                      else fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)
                    }
                    </ns1:amount>
                    {
                        if ($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)
                        then <ns1:units>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</ns1:units>
                        else (<ns1:units>CLP</ns1:units>)
                    }
                </ns1:rechargeAmount>
            </ns1:rechargeMethodInfo>
            <ns1:Subscriber>
                {                    
                    <ns1:primaryResourceType>{'C'}</ns1:primaryResourceType>                    
                }
                  <ns1:primaryResourceValue>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:MSISDNTarget/ns1:number)}</ns1:primaryResourceValue>
            </ns1:Subscriber>
 	<ns1:rechargePM>
	<ns1:reduceType>AD</ns1:reduceType>
	<ns1:reasonCode>0</ns1:reasonCode>
	</ns1:rechargePM>
            <ns1:paymentChannel>
                <ns1:referenceId>
                {
                 fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:referenceId)
                }
                </ns1:referenceId>
                <ns1:requestDate>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:requestDate)}</ns1:requestDate>
                {
                    if ($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:pointOfSale)
                    then <ns1:pointOfSale>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:pointOfSale)}</ns1:pointOfSale>
                    else ()
                }
                {
                    if ($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:hub)
                    then <ns1:hub>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:hub)}</ns1:hub>
                    else ()
                }
                {
                    if ($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:distributor)
                    then <ns1:distributor>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:distributor)}</ns1:distributor>
                    else ()
                }
                {
                    if ($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:location)
                    then <ns1:location>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:location)}</ns1:location>
                    else ()
                }
                {
                    if ($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:authorizationCode)
                    then <ns1:authorizationCode>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:authorizationCode)}</ns1:authorizationCode>
                    else ()
                }
                {
                    if ($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:rateCode)
                    then <ns1:rateCode>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:rateCode)}</ns1:rateCode>
                    else ()
                }
                {
                    if ($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:comments)
                    then <ns1:comments>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:comments)}</ns1:comments>
                    else ()
                }
            </ns1:paymentChannel>
            <ns1:prepaidBucket>
                <ns1:paymentCategory>PRE</ns1:paymentCategory>
            </ns1:prepaidBucket>
            <ns1:paymentMethod>
     {fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentMethod)     
                }
            </ns1:paymentMethod>           
        </ns1:RechargeServiceRequestData>
    </ns1:RechargeServiceRequest>
};

local:rechargeAgainstBillRequestToRechargeService($rechargeAgainstBillRequest)