xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
(:: import schema at "../XSD/BalanceManagementServiceLocalCl_v001.xsd" ::)

declare namespace ns2 = "http://telefonica.cl/TefResponseHeader/V1";

declare namespace ns3="http://telefonica.cl/TefResponseHeader/V1";
(:: import schema at "../../AmdocsCommon/XSD/TefResponseHeaderCl_v001.xsd" ::)

declare variable $rechargeServiceResponse as element() (:: schema-element(ns1:RechargeServiceResponse) ::) external;
declare variable $tefHeaderResType as element() (:: element(*, ns3:TefHeaderRes) ::) external;


declare function local:rechargeServiceResponseToRechargeAgainstBill($tefHeaderResType as element() (:: element(*, ns3:TefHeaderRes) ::), $rechargeServiceResponse as element() (:: schema-element(ns1:RechargeServiceResponse) ::)) as element() (:: schema-element(ns1:RechargeAgainstBillResponse) ::) {
    <ns1:RechargeAgainstBillResponse>
        <ns2:TefHeaderRes>
            {
                if ($tefHeaderResType/ns2:TefHeaderRes/ns2:idMessage)
                then <ns2:idMessage>{fn:data($tefHeaderResType/ns2:TefHeaderRes/ns2:idMessage)}</ns2:idMessage>
                else ()
            }
            <ns2:serviceName>{fn:data($tefHeaderResType/ns2:TefHeaderRes/ns2:serviceName)}</ns2:serviceName>
            <ns2:responseDateTime>{fn:current-dateTime()}</ns2:responseDateTime>
            <ns2:transactionID>{fn:data($tefHeaderResType/ns2:TefHeaderRes/ns2:transactionID)}</ns2:transactionID>
        </ns2:TefHeaderRes>
        <ns1:RechargeAgainstBillResponseData>
            <ns1:rechargeIdentificationInfo>
                <ns1:rechargeId>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeIdentificationInfo/ns1:rechargeId)}</ns1:rechargeId>
                <ns1:periodKey>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeIdentificationInfo/ns1:periodKey)}</ns1:periodKey>
                <ns1:bucketKey>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeIdentificationInfo/ns1:bucketKey)}</ns1:bucketKey>
            </ns1:rechargeIdentificationInfo>
            <ns1:rechargeDatesInfo>
                
                <ns1:rechargeReferenceDate>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeDatesInfo/ns1:rechargeReferenceDate)}</ns1:rechargeReferenceDate>                
                <ns1:processDate>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeDatesInfo/ns1:processDate)}</ns1:processDate>
                <ns1:logicalDate>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeDatesInfo/ns1:logicalDate)}</ns1:logicalDate>
                <ns1:rechargeRequestDate>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeDatesInfo/ns1:rechargeRequestDate)}</ns1:rechargeRequestDate>
            </ns1:rechargeDatesInfo>
            <ns1:rechargeAmountsInfo>
                <ns1:inputAmount>
                    <ns1:amount>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:inputAmount/ns1:amount)}</ns1:amount>
                    {
                        if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:inputAmount/ns1:units)
                        then <ns1:units>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:inputAmount/ns1:units)}</ns1:units>
                        else ()
                    }
                </ns1:inputAmount>
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:rechargeChannelAmount)
                    then <ns1:rechargeChannelAmount>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:rechargeChannelAmount)}</ns1:rechargeChannelAmount>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:ppsBalance)
                    then <ns1:ppsBalance>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:ppsBalance)}</ns1:ppsBalance>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:ppsNewBalance)
                    then <ns1:ppsNewBalance>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:ppsNewBalance)}</ns1:ppsNewBalance>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:ppsAmount)
                    then <ns1:ppsAmount>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:ppsAmount)}</ns1:ppsAmount>
                    else ()
                }
            </ns1:rechargeAmountsInfo>
            <ns1:rechargeBalanceExpirationInfo>
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBalanceExpirationInfo/ns1:rechargeNumberOfDays)
                    then <ns1:rechargeNumberOfDays>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBalanceExpirationInfo/ns1:rechargeNumberOfDays)}</ns1:rechargeNumberOfDays>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBalanceExpirationInfo/ns1:balanceExpirationDate)
                    then <ns1:balanceExpirationDate>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBalanceExpirationInfo/ns1:balanceExpirationDate)}</ns1:balanceExpirationDate>
                    else ()
                }
            </ns1:rechargeBalanceExpirationInfo>
            <ns1:rechargeLogInfo>
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:rechargeMainId)
                    then <ns1:rechargeMainId>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:rechargeMainId)}</ns1:rechargeMainId>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:rechargeValue)
                    then <ns1:rechargeValue>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:rechargeValue)}</ns1:rechargeValue>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:channelDetailMainId)
                    then <ns1:channelDetailMainId>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:channelDetailMainId)}</ns1:channelDetailMainId>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:channelDetailValue)
                    then <ns1:channelDetailValue>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:channelDetailValue)}</ns1:channelDetailValue>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:channelDetailUniqueId)
                    then <ns1:channelDetailUniqueId>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:channelDetailUniqueId)}</ns1:channelDetailUniqueId>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:clientTimeStamp)
                    then <ns1:clientTimeStamp>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:clientTimeStamp)}</ns1:clientTimeStamp>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:radTimeStamp)
                    then <ns1:radTimeStamp>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:radTimeStamp)}</ns1:radTimeStamp>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:rplTimeStamp)
                    then <ns1:rplTimeStamp>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:rplTimeStamp)}</ns1:rplTimeStamp>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:subscriberIdValue)
                    then <ns1:subscriberIdValue>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeLogInfo/ns1:subscriberIdValue)}</ns1:subscriberIdValue>
                    else ()
                }
            </ns1:rechargeLogInfo>
            
             <ns1:rechargeTypeInfo>
                <ns1:rechargeMethodCode>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeTypeInfo/ns1:rechargeMethodCode)}</ns1:rechargeMethodCode>
                <ns1:rechargeMethodGroup>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeTypeInfo/ns1:rechargeMethodGroup)}</ns1:rechargeMethodGroup>
                <ns1:rechargeMethodType>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeTypeInfo/ns1:rechargeMethodType)}</ns1:rechargeMethodType>
                <ns1:rechargeChannelCode>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeTypeInfo/ns1:rechargeChannelCode)}</ns1:rechargeChannelCode>
                <ns1:rechargeType>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeTypeInfo/ns1:rechargeType)}</ns1:rechargeType>
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeTypeInfo/ns1:splitRechargeSequence)
                    then <ns1:splitRechargeSequence>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeTypeInfo/ns1:splitRechargeSequence)}</ns1:splitRechargeSequence>
                    else ()
                }
            </ns1:rechargeTypeInfo>
            <ns1:rechargeStatusInfo>
                <ns1:rechargeStatus>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeStatusInfo/ns1:rechargeStatus)}</ns1:rechargeStatus>
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeStatusInfo/ns1:lastStatusUpdateDate)
                    then <ns1:lastStatusUpdateDate>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeStatusInfo/ns1:lastStatusUpdateDate)}</ns1:lastStatusUpdateDate>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeStatusInfo/ns1:releaseRechargeType)
                    then <ns1:releaseRechargeType>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeStatusInfo/ns1:releaseRechargeType)}</ns1:releaseRechargeType>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeStatusInfo/ns1:cdCancelReferenceId)
                    then <ns1:cdCancelReferenceId>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeStatusInfo/ns1:cdCancelReferenceId)}</ns1:cdCancelReferenceId>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeStatusInfo/ns1:cancelRechargeType)
                    then <ns1:cancelRechargeType>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeStatusInfo/ns1:cancelRechargeType)}</ns1:cancelRechargeType>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeStatusInfo/ns1:releaseRechargeId)
                    then <ns1:releaseRechargeId>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeStatusInfo/ns1:releaseRechargeId)}</ns1:releaseRechargeId>
                    else ()
                }
            </ns1:rechargeStatusInfo>
           
            <ns1:rechargeBucketInfo>
                <ns1:bucketId>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBucketInfo/ns1:bucketId)}</ns1:bucketId>
                <ns1:billingAccountNumber>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBucketInfo/ns1:billingAccountNumber)}</ns1:billingAccountNumber>
                <ns1:billingArrangementId>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBucketInfo/ns1:billingArrangementId)}</ns1:billingArrangementId>
                <ns1:prepaidBucketId>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBucketInfo/ns1:prepaidBucketId)}</ns1:prepaidBucketId>
                <ns1:paymentChannelName>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBucketInfo/ns1:paymentChannelName)}</ns1:paymentChannelName>
                <ns1:customerId>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBucketInfo/ns1:customerId)}</ns1:customerId>
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBucketInfo/ns1:crmExternalId)
                    then <ns1:crmExternalId>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBucketInfo/ns1:crmExternalId)}</ns1:crmExternalId>
                    else ()
                }
                <ns1:currency>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBucketInfo/ns1:currency)}</ns1:currency>
                <ns1:balanceExpirationDate>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBucketInfo/ns1:balanceExpirationDate)}</ns1:balanceExpirationDate>
            </ns1:rechargeBucketInfo>
            <ns1:subscriber>
                <ns1:subscriberId>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:subscriber/ns1:subscriberId)}</ns1:subscriberId>
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:subscriber/ns1:primaryResourceType)
                    then <ns1:primaryResourceType>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:subscriber/ns1:primaryResourceType)}</ns1:primaryResourceType>
                    else ()
                }
                <ns1:primaryResourceValue>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:subscriber/ns1:primaryResourceValue)}</ns1:primaryResourceValue>
            </ns1:subscriber>
            <ns1:accumulationsAmountsInfo>
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:installmentAmount)
                    then <ns1:installmentAmount>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:installmentAmount)}</ns1:installmentAmount>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:regularBonusAmount)
                    then <ns1:regularBonusAmount>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:regularBonusAmount)}</ns1:regularBonusAmount>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:additionalBonusAmount)
                    then <ns1:additionalBonusAmount>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:additionalBonusAmount)}</ns1:additionalBonusAmount>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:reduceByAmount)
                    then <ns1:reduceByAmount>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:reduceByAmount)}</ns1:reduceByAmount>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:debitAmount)
                    then <ns1:debitAmount>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:debitAmount)}</ns1:debitAmount>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:createChargeAmount)
                    then <ns1:createChargeAmount>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:createChargeAmount)}</ns1:createChargeAmount>
                    else ()
                }
                {
                    if ($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:loanAmount)
                    then <ns1:loanAmount>{fn:data($rechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:accumulationsAmountsInfo/ns1:loanAmount)}</ns1:loanAmount>
                    else ()
                }
            </ns1:accumulationsAmountsInfo>
        </ns1:RechargeAgainstBillResponseData>
    </ns1:RechargeAgainstBillResponse>
};

local:rechargeServiceResponseToRechargeAgainstBill($tefHeaderResType,$rechargeServiceResponse)