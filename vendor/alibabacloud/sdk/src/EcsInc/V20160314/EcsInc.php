<?php

namespace AlibabaCloud\EcsInc\V20160314;

use AlibabaCloud\ApiResolverTrait;

/**
 * @deprecated
 *
 * @method static AddSystemTag addSystemTag(array $options = [])
 * @method static AddSystemTags addSystemTags(array $options = [])
 * @method static CancelAgreement cancelAgreement(array $options = [])
 * @method static CancelCopyImageAtOrigin cancelCopyImageAtOrigin(array $options = [])
 * @method static CancelSystemEvent cancelSystemEvent(array $options = [])
 * @method static CheckImageSupportCloudinit checkImageSupportCloudinit(array $options = [])
 * @method static CheckIsDefaultVpcUser checkIsDefaultVpcUser(array $options = [])
 * @method static CheckOrderNotPaid checkOrderNotPaid(array $options = [])
 * @method static CopyImageAtTarget copyImageAtTarget(array $options = [])
 * @method static CopySystemImage copySystemImage(array $options = [])
 * @method static CopySystemImageAtTarget copySystemImageAtTarget(array $options = [])
 * @method static CopyToCenterAtOrigin copyToCenterAtOrigin(array $options = [])
 * @method static CreateSystemEvent createSystemEvent(array $options = [])
 * @method static DescribeAccountAttributes describeAccountAttributes(array $options = [])
 * @method static DescribeAdvisorCheckItems describeAdvisorCheckItems(array $options = [])
 * @method static DescribeAdvisorCheckSummaries describeAdvisorCheckSummaries(array $options = [])
 * @method static DescribeAdvisorChecks describeAdvisorChecks(array $options = [])
 * @method static DescribeAvailableResource describeAvailableResource(array $options = [])
 * @method static DescribeAvailableResourceForModify describeAvailableResourceForModify(array $options = [])
 * @method static DescribeBandwidthLimitation describeBandwidthLimitation(array $options = [])
 * @method static DescribeBazaarInstances describeBazaarInstances(array $options = [])
 * @method static DescribeCopyProgressAtOrigin describeCopyProgressAtOrigin(array $options = [])
 * @method static DescribeDangerGroupAcl describeDangerGroupAcl(array $options = [])
 * @method static DescribeDangerGroupAclStat describeDangerGroupAclStat(array $options = [])
 * @method static DescribeDangerGroupInfo describeDangerGroupInfo(array $options = [])
 * @method static DescribeEipPrice describeEipPrice(array $options = [])
 * @method static DescribeElasticUpgradeInfo describeElasticUpgradeInfo(array $options = [])
 * @method static DescribeEventDetail describeEventDetail(array $options = [])
 * @method static DescribeEvents describeEvents(array $options = [])
 * @method static DescribeGroupHighRiskAcl describeGroupHighRiskAcl(array $options = [])
 * @method static DescribeGroupHighRiskStat describeGroupHighRiskStat(array $options = [])
 * @method static DescribeHighRiskGroupAcl describeHighRiskGroupAcl(array $options = [])
 * @method static DescribeHighRiskGroupAclStat describeHighRiskGroupAclStat(array $options = [])
 * @method static DescribeHighRiskGroupInfo describeHighRiskGroupInfo(array $options = [])
 * @method static DescribeInstanceTypesInner describeInstanceTypesInner(array $options = [])
 * @method static DescribePrice describePrice(array $options = [])
 * @method static DescribeRenewalPrice describeRenewalPrice(array $options = [])
 * @method static DescribeResourceCreationCapacity describeResourceCreationCapacity(array $options = [])
 * @method static DescribeResourceFilterAttributes describeResourceFilterAttributes(array $options = [])
 * @method static DescribeResourceModificationCapacity describeResourceModificationCapacity(array $options = [])
 * @method static DescribeResourceRecommendFilters describeResourceRecommendFilters(array $options = [])
 * @method static DescribeResources describeResources(array $options = [])
 * @method static DescribeResourcesBySystemTag describeResourcesBySystemTag(array $options = [])
 * @method static DescribeResourcesByTagVsw describeResourcesByTagVsw(array $options = [])
 * @method static DescribeResourcesModification describeResourcesModification(array $options = [])
 * @method static DetailCenterResourceAtOrigin detailCenterResourceAtOrigin(array $options = [])
 * @method static EcsIncApiResolver ecsIncApiResolver(array $options = [])
 * @method static FiveDaysRefund fiveDaysRefund(array $options = [])
 * @method static GdprCheckResource gdprCheckResource(array $options = [])
 * @method static GdprLogicalDeleteResource gdprLogicalDeleteResource(array $options = [])
 * @method static GdprPhysicalDeleteResource gdprPhysicalDeleteResource(array $options = [])
 * @method static GetActiveRegions getActiveRegions(array $options = [])
 * @method static GetCommodity getCommodity(array $options = [])
 * @method static GetCommodityProxy getCommodityProxy(array $options = [])
 * @method static InnerAddEntityConstraints innerAddEntityConstraints(array $options = [])
 * @method static InnerAntInstanceConvertToPrepaid innerAntInstanceConvertToPrepaid(array $options = [])
 * @method static InnerBatchAttachClassicLinkVpc innerBatchAttachClassicLinkVpc(array $options = [])
 * @method static InnerBatchAttchClassicLinkVpc innerBatchAttchClassicLinkVpc(array $options = [])
 * @method static InnerCheckEniBindEip innerCheckEniBindEip(array $options = [])
 * @method static InnerCheckEniEipOperate innerCheckEniEipOperate(array $options = [])
 * @method static InnerCheckEniUnbindEip innerCheckEniUnbindEip(array $options = [])
 * @method static InnerCheckIsDefaultVpcUser innerCheckIsDefaultVpcUser(array $options = [])
 * @method static InnerCheckOpenSnapshotService innerCheckOpenSnapshotService(array $options = [])
 * @method static InnerCheckProduce innerCheckProduce(array $options = [])
 * @method static InnerConstraintDataPush innerConstraintDataPush(array $options = [])
 * @method static InnerCreateEniQosGroup innerCreateEniQosGroup(array $options = [])
 * @method static InnerCreateNcExpression innerCreateNcExpression(array $options = [])
 * @method static InnerDeleteEniQosGroup innerDeleteEniQosGroup(array $options = [])
 * @method static InnerDeleteEntityConstraints innerDeleteEntityConstraints(array $options = [])
 * @method static InnerDeleteNcExpression innerDeleteNcExpression(array $options = [])
 * @method static InnerDeleteTags innerDeleteTags(array $options = [])
 * @method static InnerDescribeEni innerDescribeEni(array $options = [])
 * @method static InnerDescribeEniBdf innerDescribeEniBdf(array $options = [])
 * @method static InnerDescribeEniQosGroupByEni innerDescribeEniQosGroupByEni(array $options = [])
 * @method static InnerDescribeEniQosGroupByInstance innerDescribeEniQosGroupByInstance(array $options = [])
 * @method static InnerDescribeEniQosGroupInfo innerDescribeEniQosGroupInfo(array $options = [])
 * @method static InnerDescribeInstanceTypes innerDescribeInstanceTypes(array $options = [])
 * @method static InnerDescribeNcExpression innerDescribeNcExpression(array $options = [])
 * @method static InnerDescribeSnapshotBusinessStatus innerDescribeSnapshotBusinessStatus(array $options = [])
 * @method static InnerDescribeTags innerDescribeTags(array $options = [])
 * @method static InnerDetailInstanceFamilyDefine innerDetailInstanceFamilyDefine(array $options = [])
 * @method static InnerDiskFindDiskByDiskId innerDiskFindDiskByDiskId(array $options = [])
 * @method static InnerDiskQueryByParam innerDiskQueryByParam(array $options = [])
 * @method static InnerDiskQueryByParamForConsole innerDiskQueryByParamForConsole(array $options = [])
 * @method static InnerDiskQueryUserDiskSummary innerDiskQueryUserDiskSummary(array $options = [])
 * @method static InnerDiskReset innerDiskReset(array $options = [])
 * @method static InnerDiskResizeByParam innerDiskResizeByParam(array $options = [])
 * @method static InnerEcsCountInRegion innerEcsCountInRegion(array $options = [])
 * @method static InnerEcsDescribeDangerAcl innerEcsDescribeDangerAcl(array $options = [])
 * @method static InnerEcsDescribeDangerGroupAcl innerEcsDescribeDangerGroupAcl(array $options = [])
 * @method static InnerEcsDescribeDangerGroupVmCount innerEcsDescribeDangerGroupVmCount(array $options = [])
 * @method static InnerEcsDescribeIpsInGroup innerEcsDescribeIpsInGroup(array $options = [])
 * @method static InnerEcsDescribeVPortInfo innerEcsDescribeVPortInfo(array $options = [])
 * @method static InnerEcsExpireRegionQuery innerEcsExpireRegionQuery(array $options = [])
 * @method static InnerEcsFindById innerEcsFindById(array $options = [])
 * @method static InnerEcsGetBflagByBidAndUid innerEcsGetBflagByBidAndUid(array $options = [])
 * @method static InnerEcsInstanceDetail innerEcsInstanceDetail(array $options = [])
 * @method static InnerEcsInstanceDetailForConsole innerEcsInstanceDetailForConsole(array $options = [])
 * @method static InnerEcsInstanceQueryByParam innerEcsInstanceQueryByParam(array $options = [])
 * @method static InnerEcsInstanceQueryByParam4QT innerEcsInstanceQueryByParam4QT(array $options = [])
 * @method static InnerEcsInstanceQueryRegionNoFilter innerEcsInstanceQueryRegionNoFilter(array $options = [])
 * @method static InnerEcsInstanceQueryRegions innerEcsInstanceQueryRegions(array $options = [])
 * @method static InnerEcsIsChannelMerchant innerEcsIsChannelMerchant(array $options = [])
 * @method static InnerEcsIsClassicLinkVpcUser innerEcsIsClassicLinkVpcUser(array $options = [])
 * @method static InnerEcsQueryByHpcClusterId innerEcsQueryByHpcClusterId(array $options = [])
 * @method static InnerEcsQueryByInstanceId innerEcsQueryByInstanceId(array $options = [])
 * @method static InnerEcsQueryByInternetIp innerEcsQueryByInternetIp(array $options = [])
 * @method static InnerEcsQueryByIntranetIp innerEcsQueryByIntranetIp(array $options = [])
 * @method static InnerEcsQueryByIp innerEcsQueryByIp(array $options = [])
 * @method static InnerEcsQueryByParam innerEcsQueryByParam(array $options = [])
 * @method static InnerEcsQueryBySerialNumber innerEcsQueryBySerialNumber(array $options = [])
 * @method static InnerEcsQueryIpThreshold innerEcsQueryIpThreshold(array $options = [])
 * @method static InnerEcsQueryNcInfoByInstanceId innerEcsQueryNcInfoByInstanceId(array $options = [])
 * @method static InnerEcsQuerySecurity innerEcsQuerySecurity(array $options = [])
 * @method static InnerEcsRegionQueryActive innerEcsRegionQueryActive(array $options = [])
 * @method static InnerEcsRegionQueryAll innerEcsRegionQueryAll(array $options = [])
 * @method static InnerEcsRegionQueryByBid innerEcsRegionQueryByBid(array $options = [])
 * @method static InnerEcsReleaseByDriver innerEcsReleaseByDriver(array $options = [])
 * @method static InnerEcsResourceGroupQueryByResources innerEcsResourceGroupQueryByResources(array $options = [])
 * @method static InnerEcsRiskControlPunish innerEcsRiskControlPunish(array $options = [])
 * @method static InnerEcsRiskControlPunishRemove innerEcsRiskControlPunishRemove(array $options = [])
 * @method static InnerEcsRiskControlQuery innerEcsRiskControlQuery(array $options = [])
 * @method static InnerEcsSnapshotQueryAllSnapshotsByEcsId innerEcsSnapshotQueryAllSnapshotsByEcsId(array $options = [])
 * @method static InnerEcsTransitionModify innerEcsTransitionModify(array $options = [])
 * @method static InnerEcsTransitionQuery innerEcsTransitionQuery(array $options = [])
 * @method static InnerGetInstanceTypeModelByType innerGetInstanceTypeModelByType(array $options = [])
 * @method static InnerGetZoneVendibleDataAndStatusById innerGetZoneVendibleDataAndStatusById(array $options = [])
 * @method static InnerGroupAuthorize innerGroupAuthorize(array $options = [])
 * @method static InnerGroupCreate innerGroupCreate(array $options = [])
 * @method static InnerGroupDetail innerGroupDetail(array $options = [])
 * @method static InnerGroupFindDefaultSystemGroup innerGroupFindDefaultSystemGroup(array $options = [])
 * @method static InnerGroupJoin innerGroupJoin(array $options = [])
 * @method static InnerGroupLeave innerGroupLeave(array $options = [])
 * @method static InnerGroupQuery innerGroupQuery(array $options = [])
 * @method static InnerGroupQueryVm innerGroupQueryVm(array $options = [])
 * @method static InnerGroupRemove innerGroupRemove(array $options = [])
 * @method static InnerGroupRevoke innerGroupRevoke(array $options = [])
 * @method static InnerImageConvert2Product innerImageConvert2Product(array $options = [])
 * @method static InnerImageDetail innerImageDetail(array $options = [])
 * @method static InnerImageKeepUsing innerImageKeepUsing(array $options = [])
 * @method static InnerImageModify innerImageModify(array $options = [])
 * @method static InnerImageModifyProductCapacity innerImageModifyProductCapacity(array $options = [])
 * @method static InnerImageQueryAvailableImgs innerImageQueryAvailableImgs(array $options = [])
 * @method static InnerImageQueryImgsByParam innerImageQueryImgsByParam(array $options = [])
 * @method static InnerImageQueryNeedKeepUsing innerImageQueryNeedKeepUsing(array $options = [])
 * @method static InnerImageQueryProductQuota innerImageQueryProductQuota(array $options = [])
 * @method static InnerImageQueryUserImages innerImageQueryUserImages(array $options = [])
 * @method static InnerInstallCloudAssistant innerInstallCloudAssistant(array $options = [])
 * @method static InnerInstanceDetail innerInstanceDetail(array $options = [])
 * @method static InnerInstanceDisableSLBFlow innerInstanceDisableSLBFlow(array $options = [])
 * @method static InnerInstanceEnableSLBFlow innerInstanceEnableSLBFlow(array $options = [])
 * @method static InnerInstanceGetInstanceTypeModelByType innerInstanceGetInstanceTypeModelByType(array $options = [])
 * @method static InnerInstanceQueryByParam innerInstanceQueryByParam(array $options = [])
 * @method static InnerInstanceQueryByParamBackyard innerInstanceQueryByParamBackyard(array $options = [])
 * @method static InnerInstanceQueryEcsByImgPc innerInstanceQueryEcsByImgPc(array $options = [])
 * @method static InnerInstanceSetEndTime innerInstanceSetEndTime(array $options = [])
 * @method static InnerIpLoad innerIpLoad(array $options = [])
 * @method static InnerIzQueryForVmSale innerIzQueryForVmSale(array $options = [])
 * @method static InnerJoinEniQosGroup innerJoinEniQosGroup(array $options = [])
 * @method static InnerLeaveEniQosGroup innerLeaveEniQosGroup(array $options = [])
 * @method static InnerListClusterFlowCtrls innerListClusterFlowCtrls(array $options = [])
 * @method static InnerMaliceEcsLock innerMaliceEcsLock(array $options = [])
 * @method static InnerMaliceEcsUnlock innerMaliceEcsUnlock(array $options = [])
 * @method static InnerMarketplaceImageExpire innerMarketplaceImageExpire(array $options = [])
 * @method static InnerModifyEniQosGroup innerModifyEniQosGroup(array $options = [])
 * @method static InnerModifyEntityConstraints innerModifyEntityConstraints(array $options = [])
 * @method static InnerModifyInstanceChargeType innerModifyInstanceChargeType(array $options = [])
 * @method static InnerModifyPublicIpAddress innerModifyPublicIpAddress(array $options = [])
 * @method static InnerModifySnapshotBusinessStatus innerModifySnapshotBusinessStatus(array $options = [])
 * @method static InnerMonitor innerMonitor(array $options = [])
 * @method static InnerMonitorDataDescribeDisk innerMonitorDataDescribeDisk(array $options = [])
 * @method static InnerMonitorDataDescribeInstance innerMonitorDataDescribeInstance(array $options = [])
 * @method static InnerNetworkModifyValidation innerNetworkModifyValidation(array $options = [])
 * @method static InnerOpenSnapshotService innerOpenSnapshotService(array $options = [])
 * @method static InnerProduce innerProduce(array $options = [])
 * @method static InnerQueryConstraints innerQueryConstraints(array $options = [])
 * @method static InnerQueryCopyImageSupportRegions innerQueryCopyImageSupportRegions(array $options = [])
 * @method static InnerQueryEcsCountByCondition innerQueryEcsCountByCondition(array $options = [])
 * @method static InnerQueryEcsPermit innerQueryEcsPermit(array $options = [])
 * @method static InnerQueryEniQosGroupByEni innerQueryEniQosGroupByEni(array $options = [])
 * @method static InnerQueryEniQosGroupByInstance innerQueryEniQosGroupByInstance(array $options = [])
 * @method static InnerQueryExplanation innerQueryExplanation(array $options = [])
 * @method static InnerQueryImageBindByInstance innerQueryImageBindByInstance(array $options = [])
 * @method static InnerQueryInstanceCreatedByProduct innerQueryInstanceCreatedByProduct(array $options = [])
 * @method static InnerQueryLazyLoadProgress innerQueryLazyLoadProgress(array $options = [])
 * @method static InnerQueryRetainVcpu innerQueryRetainVcpu(array $options = [])
 * @method static InnerRefundVcpuCallBack innerRefundVcpuCallBack(array $options = [])
 * @method static InnerRefundVcpuQuery innerRefundVcpuQuery(array $options = [])
 * @method static InnerRegionSupportInstancetypes innerRegionSupportInstancetypes(array $options = [])
 * @method static InnerReleaseDedicatedHost innerReleaseDedicatedHost(array $options = [])
 * @method static InnerReleasePublicIpAddress innerReleasePublicIpAddress(array $options = [])
 * @method static InnerRemedyRenewInstance innerRemedyRenewInstance(array $options = [])
 * @method static InnerRenewInstance innerRenewInstance(array $options = [])
 * @method static InnerSendMessage innerSendMessage(array $options = [])
 * @method static InnerSnapshotDescribeMountedSnapshots innerSnapshotDescribeMountedSnapshots(array $options = [])
 * @method static InnerSnapshotIsUserAutoSnapshotPause innerSnapshotIsUserAutoSnapshotPause(array $options = [])
 * @method static InnerSnapshotQueryUserSnapshots innerSnapshotQueryUserSnapshots(array $options = [])
 * @method static InnerSnapshotSecurityMount innerSnapshotSecurityMount(array $options = [])
 * @method static InnerSnapshotSecurityUnmount innerSnapshotSecurityUnmount(array $options = [])
 * @method static InnerStockListUsedVms innerStockListUsedVms(array $options = [])
 * @method static InnerUpdateEntityConstraints innerUpdateEntityConstraints(array $options = [])
 * @method static InnerVncQueryPasswd innerVncQueryPasswd(array $options = [])
 * @method static InstanceOwnershipTransfer instanceOwnershipTransfer(array $options = [])
 * @method static KeepUsing keepUsing(array $options = [])
 * @method static LaunchBazaarInstance launchBazaarInstance(array $options = [])
 * @method static ListAllIzMap listAllIzMap(array $options = [])
 * @method static ListBandwidthHistory listBandwidthHistory(array $options = [])
 * @method static ListBoundMarketImage listBoundMarketImage(array $options = [])
 * @method static ListEcsInstanceOrderInfo listEcsInstanceOrderInfo(array $options = [])
 * @method static ListImageBinding listImageBinding(array $options = [])
 * @method static ModifyInstanceAutoRenewAttributeInner modifyInstanceAutoRenewAttributeInner(array $options = [])
 * @method static ModifySystemEventAttribute modifySystemEventAttribute(array $options = [])
 * @method static ModifySystemEventPlanTime modifySystemEventPlanTime(array $options = [])
 * @method static NotifyRefund notifyRefund(array $options = [])
 * @method static OpsDescribeAccountAttributes opsDescribeAccountAttributes(array $options = [])
 * @method static QueryAvailableRegion queryAvailableRegion(array $options = [])
 * @method static QueryEcsElasticUpgradeInfo queryEcsElasticUpgradeInfo(array $options = [])
 * @method static QueryEcsInstanceOrderInfo queryEcsInstanceOrderInfo(array $options = [])
 * @method static QueryImageByImageId queryImageByImageId(array $options = [])
 * @method static QueryImageCopyProgress queryImageCopyProgress(array $options = [])
 * @method static QueryImageIdByRegion queryImageIdByRegion(array $options = [])
 * @method static QueryInstanceInfo queryInstanceInfo(array $options = [])
 * @method static QueryMarketImageCategory queryMarketImageCategory(array $options = [])
 * @method static QueryMarketImages queryMarketImages(array $options = [])
 * @method static QueryNeedKeepUsing queryNeedKeepUsing(array $options = [])
 * @method static QueryRecommendInstanceType queryRecommendInstanceType(array $options = [])
 * @method static QueryResourceModify queryResourceModify(array $options = [])
 * @method static QueryResourceTransit queryResourceTransit(array $options = [])
 * @method static QueryUsableSnapshots queryUsableSnapshots(array $options = [])
 * @method static QueryUserInfo queryUserInfo(array $options = [])
 * @method static ReInitDisks reInitDisks(array $options = [])
 * @method static RemoveSystemTags removeSystemTags(array $options = [])
 * @method static ReopenInstance reopenInstance(array $options = [])
 * @method static ResourceOwnershipTransfer resourceOwnershipTransfer(array $options = [])
 * @method static SignAgreement signAgreement(array $options = [])
 * @method static TagResourceVSwitch tagResourceVSwitch(array $options = [])
 * @method static TerminateBazaarInstance terminateBazaarInstance(array $options = [])
 * @method static UploadSystemImageAtOrigin uploadSystemImageAtOrigin(array $options = [])
 */
class EcsInc
{
    use ApiResolverTrait;
}
