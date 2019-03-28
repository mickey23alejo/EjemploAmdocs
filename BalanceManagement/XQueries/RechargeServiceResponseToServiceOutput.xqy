xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace functx = "http://www.functx.com";

declare namespace ns2="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
(:: import schema at "../XSD/BalanceManagementServiceLocalCl_v001.xsd" ::)
declare namespace ns1="http://www.kruger.com.ec/";
(:: import schema at "../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)

declare namespace ns3="http://telefonica.cl/TefResponseHeader/V1";
(:: import schema at "../../AmdocsCommon/XSD/TefResponseHeaderCl_v001.xsd" ::)

declare namespace ec. = "java:ec.com.kruger.ejb.rpl1rechargeservices.rechargeservices";

declare variable $rechargeServiceResponse as element() (:: schema-element(ns1:rechargeServiceResponse) ::) external;
declare variable $tefHeaderResType as element() (:: element(*, ns3:TefHeaderRes) ::) external;

declare function functx:substring-before-if-contains
  ( $arg as xs:string? ,
    $delim as xs:string )  as xs:string? {

   if (contains($arg,$delim))
   then substring-before($arg,$delim)
   else $arg
 } ;
 
declare function local:rechargeServiceResponseToServiceOutput($tefHeaderResType as element() (:: element(*, ns3:TefHeaderRes) ::), $rechargeServiceResponse as element() (:: schema-element(ns1:rechargeServiceResponse) ::)) as element() (:: schema-element(ns2:RechargeServiceResponse) ::) {
    <ns2:RechargeServiceResponse>
        <ns3:TefHeaderRes>
            {
                if ($tefHeaderResType/ns3:TefHeaderRes/ns3:idMessage)
                then <ns3:idMessage>{fn:data($tefHeaderResType/ns3:TefHeaderRes/ns3:idMessage)}</ns3:idMessage>
                else ()
            }
            <ns3:serviceName>{fn:data($tefHeaderResType/ns3:TefHeaderRes/ns3:serviceName)}</ns3:serviceName>
            <ns3:responseDateTime>{fn:current-dateTime()}</ns3:responseDateTime>
            <ns3:transactionID>{fn:data($tefHeaderResType/ns3:TefHeaderRes/ns3:transactionID)}</ns3:transactionID>
        </ns3:TefHeaderRes>
        <ns2:RechargeServiceResponseData>
            <ns2:rechargeIdentificationInfo>
                <ns2:rechargeId>{fn:data($rechargeServiceResponse/ns1:return/rechargeIdentInfo/rcgId)}</ns2:rechargeId>
                <ns2:periodKey>{fn:data($rechargeServiceResponse/ns1:return/rechargeIdentInfo/periodKey)}</ns2:periodKey>
                <ns2:bucketKey>{fn:data($rechargeServiceResponse/ns1:return/rechargeIdentInfo/bucketKey)}</ns2:bucketKey>
            </ns2:rechargeIdentificationInfo>
            <ns2:rechargeDatesInfo>
                <ns2:rechargeReferenceDate>{functx:substring-before-if-contains(xs:string(fn:data($rechargeServiceResponse/ns1:return/rechargeDatesInfo/rcgRefDate)),'T')}</ns2:rechargeReferenceDate>
                <ns2:processDate>{functx:substring-before-if-contains(xs:string(fn:data($rechargeServiceResponse/ns1:return/rechargeDatesInfo/processDate)),'T')}</ns2:processDate>
                <ns2:logicalDate>{functx:substring-before-if-contains(xs:string(fn:data($rechargeServiceResponse/ns1:return/rechargeDatesInfo/logicalDate)),'T')}</ns2:logicalDate>
                <ns2:rechargeRequestDate>{functx:substring-before-if-contains(xs:string(fn:data($rechargeServiceResponse/ns1:return/rechargeDatesInfo/rcgReqDate)),'T')}</ns2:rechargeRequestDate>
            </ns2:rechargeDatesInfo>
            <ns2:rechargeAmountsInfo>
                <ns2:inputAmount>
                    <ns2:amount>{fn:round(fn:data($rechargeServiceResponse/ns1:return/rechargeAmountsInfo/inputAmt))}</ns2:amount>
                    <ns2:units>{fn:substring(fn:data($rechargeServiceResponse/ns1:return/rechargeAmountsInfo/inputCurrency),1,3)}</ns2:units>
                </ns2:inputAmount>
                <ns2:rechargeChannelAmount>{fn:data($rechargeServiceResponse/ns1:return//rechargeAmountsInfo/rcgChlAmt)}</ns2:rechargeChannelAmount>
                <ns2:ppsBalance>{fn:data($rechargeServiceResponse/ns1:return//rechargeAmountsInfo/ppsBalance)}</ns2:ppsBalance>
                <ns2:ppsNewBalance>{fn:data($rechargeServiceResponse/ns1:return/rechargeAmountsInfo/ppsNewBalance)}</ns2:ppsNewBalance>
                <ns2:ppsAmount>{fn:data($rechargeServiceResponse/ns1:return//rechargeAmountsInfo/ppsAmt)}</ns2:ppsAmount>
            </ns2:rechargeAmountsInfo>
            <ns2:rechargeBalanceExpirationInfo>
                <ns2:rechargeNumberOfDays>{fn:data($rechargeServiceResponse/ns1:return/rechargeBalanceExpirationInfo/rcgNumOfDays)}</ns2:rechargeNumberOfDays>
                <ns2:balanceExpirationDate>{functx:substring-before-if-contains(xs:string(fn:data($rechargeServiceResponse/ns1:return/rechargeBalanceExpirationInfo/balExpDateCalc)),'T')}</ns2:balanceExpirationDate>
            </ns2:rechargeBalanceExpirationInfo>
            <ns2:rechargeLogInfo>
                <ns2:rechargeMainId>{fn:data($rechargeServiceResponse/ns1:return/rechargeLogInfo/rmdMainId)}</ns2:rechargeMainId>
                <ns2:rechargeValue>{fn:data($rechargeServiceResponse/ns1:return/rechargeLogInfo/rmdVals)}</ns2:rechargeValue>
                <ns2:channelDetailMainId>{fn:data($rechargeServiceResponse/ns1:return/rechargeLogInfo/cdMainId)}</ns2:channelDetailMainId>
                <ns2:channelDetailValue>{fn:data($rechargeServiceResponse/ns1:return/rechargeLogInfo/cdVals)}</ns2:channelDetailValue>
                <ns2:channelDetailUniqueId>{fn:data($rechargeServiceResponse/ns1:return/rechargeLogInfo/cdUniqueId)}</ns2:channelDetailUniqueId>
                <ns2:clientTimeStamp>{fn:data($rechargeServiceResponse/ns1:return/rechargeLogInfo/clientTimeStamp)}</ns2:clientTimeStamp>
                <ns2:radTimeStamp>{fn:data($rechargeServiceResponse/ns1:return/rechargeLogInfo/radTimeStamp)}</ns2:radTimeStamp>
                <ns2:rplTimeStamp>{fn:data($rechargeServiceResponse/ns1:return/rechargeLogInfo/rplTimeStamp)}</ns2:rplTimeStamp>
                <ns2:subscriberIdValue>{fn:data($rechargeServiceResponse/ns1:return/rechargeLogInfo/subIdVals)}</ns2:subscriberIdValue>
            </ns2:rechargeLogInfo>
            <ns2:rechargeTypeInfo>
                <ns2:rechargeMethodCode>{fn:substring(fn:data($rechargeServiceResponse/ns1:return/rechargeTypeInfo/methodCode),1,4)}</ns2:rechargeMethodCode>
                <ns2:rechargeMethodGroup>{fn:substring(fn:data($rechargeServiceResponse/ns1:return/rechargeTypeInfo/methodGroup),1,2)}</ns2:rechargeMethodGroup>
                <ns2:rechargeMethodType>{fn:substring(fn:data($rechargeServiceResponse/ns1:return/rechargeTypeInfo/methodType),1,2)}</ns2:rechargeMethodType>
                <ns2:rechargeChannelCode>{fn:substring(fn:data($rechargeServiceResponse/ns1:return/rechargeTypeInfo/channelCode),1,2)}</ns2:rechargeChannelCode>
                <ns2:rechargeType>{fn:data($rechargeServiceResponse/ns1:return/rechargeTypeInfo/rcgType)}</ns2:rechargeType>
                <ns2:splitRechargeSequence>{fn:data($rechargeServiceResponse/ns1:return/rechargeTypeInfo/splitRcgSeq)}</ns2:splitRechargeSequence>
            </ns2:rechargeTypeInfo>
            <ns2:rechargeStatusInfo>
                <ns2:rechargeStatus>{fn:data($rechargeServiceResponse/ns1:return/rechargeStatusInfo/rcgStatus)}</ns2:rechargeStatus>
                <ns2:lastStatusUpdateDate>{fn:data($rechargeServiceResponse/ns1:return/rechargeStatusInfo/lastStsUpdate)}</ns2:lastStatusUpdateDate>
                <ns2:releaseRechargeType>{fn:data($rechargeServiceResponse/ns1:return/rechargeStatusInfo/relRcgType)}</ns2:releaseRechargeType>
                <ns2:cdCancelReferenceId>{fn:data($rechargeServiceResponse/ns1:return/rechargeStatusInfo/cdCancelRefId)}</ns2:cdCancelReferenceId>
                <ns2:cancelRechargeType>{fn:data($rechargeServiceResponse/ns1:return/rechargeStatusInfo/cancelRcgType)}</ns2:cancelRechargeType>
                <ns2:releaseRechargeId>{fn:data($rechargeServiceResponse/ns1:return/rechargeStatusInfo/relRcgId)}</ns2:releaseRechargeId>
            </ns2:rechargeStatusInfo>
            <ns2:rechargeBucketInfo>
                <ns2:bucketId>{fn:data($rechargeServiceResponse/ns1:return/rechargeBucketInfo/bucketId)}</ns2:bucketId>
                <ns2:billingAccountNumber>{fn:data($rechargeServiceResponse/ns1:return/rechargeBucketInfo/ban)}</ns2:billingAccountNumber>
                <ns2:billingArrangementId>{fn:data($rechargeServiceResponse/ns1:return/rechargeBucketInfo/ben)}</ns2:billingArrangementId>
                <ns2:prepaidBucketId>{fn:data($rechargeServiceResponse/ns1:return/rechargeBucketInfo/pcn)}</ns2:prepaidBucketId>
                <ns2:paymentChannelName>{fn:data($rechargeServiceResponse/ns1:return/rechargeBucketInfo/pcnName)}</ns2:paymentChannelName>
                <ns2:customerId>{fn:data($rechargeServiceResponse/ns1:return/rechargeBucketInfo/customerId)}</ns2:customerId>
                <ns2:crmExternalId>{fn:data($rechargeServiceResponse/ns1:return/rechargeBucketInfo/crmExternalId)}</ns2:crmExternalId>
                <ns2:currency>{fn:substring(fn:data($rechargeServiceResponse/ns1:return/rechargeBucketInfo/currency),1,3)}</ns2:currency>
                <ns2:balanceExpirationDate>{functx:substring-before-if-contains(xs:string(fn:data($rechargeServiceResponse/ns1:return/rechargeBucketInfo/balExpDate)),'T')}</ns2:balanceExpirationDate>
            </ns2:rechargeBucketInfo>
            <ns2:subscriber>
                <ns2:subscriberId>{fn:substring(xs:string(fn:data($rechargeServiceResponse/ns1:return/rechargeSubscriberInfo/subscriberNo)),1,9)}</ns2:subscriberId>
                <ns2:primaryResourceType>{fn:substring(fn:data($rechargeServiceResponse/ns1:return/rechargeSubscriberInfo/primaryResourceType),1,4)}</ns2:primaryResourceType>
                <ns2:primaryResourceValue>{fn:data($rechargeServiceResponse/ns1:return/rechargeSubscriberInfo/primaryResourceValue)}</ns2:primaryResourceValue>
            </ns2:subscriber>
            <ns2:accumulationsAmountsInfo>
                <ns2:installmentAmount>{fn:data($rechargeServiceResponse/ns1:return/accumulationsAmounts/instlAmt)}</ns2:installmentAmount>
                <ns2:regularBonusAmount>{fn:data($rechargeServiceResponse/ns1:return/accumulationsAmounts/regBonusAmt)}</ns2:regularBonusAmount>
                <ns2:additionalBonusAmount>{fn:data($rechargeServiceResponse/ns1:return/accumulationsAmounts/addBonusAmt)}</ns2:additionalBonusAmount>
                <ns2:reduceByAmount>{fn:data($rechargeServiceResponse/ns1:return/accumulationsAmounts/reduceAmt)}</ns2:reduceByAmount>
                <ns2:debitAmount>{fn:data($rechargeServiceResponse/ns1:return/accumulationsAmounts/debtAmt)}</ns2:debitAmount>
                <ns2:createChargeAmount>{fn:data($rechargeServiceResponse/ns1:return/accumulationsAmounts/createChargeAmt)}</ns2:createChargeAmount>
                <ns2:loanAmount>{fn:data($rechargeServiceResponse/ns1:return/accumulationsAmounts/loanAmt)}</ns2:loanAmount>
            </ns2:accumulationsAmountsInfo>
        </ns2:RechargeServiceResponseData>
    </ns2:RechargeServiceResponse>
};

local:rechargeServiceResponseToServiceOutput($tefHeaderResType,$rechargeServiceResponse)