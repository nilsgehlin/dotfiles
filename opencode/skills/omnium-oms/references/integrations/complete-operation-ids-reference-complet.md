# Integrations — Data Flow, Events & Connectors — [Complete Operation IDs Reference](#complete-operation-ids-reference)

## [Complete Operation IDs Reference](#complete-operation-ids-reference)

Event operation IDs follow a structured numbering system:

*   **1x xxxx**: Core operations
*   **2x xxxx**: Internal API (GUI) operations
*   **3x xxxx**: Public API operations
*   **4x xxxx**: Provider/Integration operations
*   **5x xxxx**: Domain events

### [Core Operations (1x xxxx)](#core-operations-1x-xxxx)

#### [Orders (110x)](#orders-110x)

*   `110100` - CreatedOrderFromCart
*   `110101` - CreatedPartialShipment
*   `110102` - CancelOrderLine
*   `110103` - ExportOrder
*   `110104` - ExportOrderToAllExporters
*   `110105` - ExecuteExportOrder
*   `110106` - AddOrder
*   `110107` - ProcessingOrder
*   `110108` - ProcessedOrder
*   `110109` - DeletedOrder
*   `110110` - DeletedOrderPermanently
*   `110111` - ExecuteExportPayments

#### [Workflow (111x)](#workflow-111x)

*   `111100` - WorkflowStarted
*   `111101` - WorkflowSavingOrderAsReadOnly
*   `111102` - WorkflowCompleted
*   `111103` - WorkflowRunningStep
*   `111104` - WorkflowChangeStatus
*   `111105` - WorkflowCompletedRunAfterOrderIsSaved

#### [Distribution (112x)](#distribution-112x)

*   `112100` - DistributionSetWarehouseBasedOnZip
*   `112101` - DistributionReallocatedOrderByProductCategory
*   `112102` - DistributionReallocatedOrderByProductStoreCategory
*   `112103` - DistributionReallocatedOrderByProductIdsToStore
*   `112104` - DistributionSplittedShipmentsToSpecifiedWarehouse
*   `112105` - DistributionReallocatedShipmentToSpecifiedWarehouse
*   `112106` - DistributionReallocatedOrderOnCancel

#### [Invoice (113x)](#invoice-113x)

*   `113100` - InvoicesExported
*   `113101` - InvoicesUpdatedFromTripletex

#### [Picklists (114x)](#picklists-114x)

*   `114100` - UpdateOrdersForPickListAttentionRequired
*   `114101` - UpdateOrdersForPickListOrderCanceled
*   `114102` - UpdateOrdersForPickListOrderUpdatedWithoutWorkflow
*   `114103` - UpdateOrdersForPickListOrderUpdatedWithWorkflow
*   `114104` - UpdateOrdersForPickListToInProgress
*   `114105` - UpdateOrdersForPickListAddingPartialShipment
*   `114106` - UpdateOrdersForPickListCancelLineItems
*   `114107` - UpdateOrdersForPickListRemoveShipmentFromPickList
*   `114108` - UpdateOrdersForPickListMovedItemsForTransit
*   `114109` - UpdateOrdersForPickListSendPartiallyCanceledNotification
*   `114110` - UpdateOrdersForPickListErrorCanceled
*   `114111` - UpdateOrdersForPickListErrorDelivered
*   `114112` - UpdateOrdersForPickListErrorReturned
*   `114113` - UpdateOrdersForPickListToStatus
*   `114200` - CreatedPickList
*   `114201` - RemovedShipmentFromPickList
*   `114202` - AddedItemsToPickList
*   `114203` - UpdateOrdersToCompletedBasedOnPickList
*   `114204` - UpdateOrdersToInProgressBasedOnPickList
*   `114205` - DeletedPickList
*   `114206` - UpdatedPickList
*   `114207` - UpdateOrdersToStatusBasedOnPickList

#### [Click and Collect (115x)](#click-and-collect-115x)

*   `115100` - CancelExpiredOrders

#### [Returns (118x)](#returns-118x)

*   `118100` - CreatedReturn
*   `118101` - ReturnWorkflowStarted
*   `118102` - ReturnWorkflowCompleted
*   `118103` - ReturnWorkflowCompletedRunAfterOrderIsSaved

#### [Customers (130x)](#customers-130x)

*   `130100` - CreatePrivateCustomerFromOrder
*   `130101` - AddedPrivateCustomerFromOrder
*   `130102` - UpdatedPrivateCustomerFromOrder
*   `130103` - AddedBusinessCustomer
*   `130104` - UpdatedBusinessCustomer
*   `130105` - UpdatedBusinessCustomerContact
*   `130106` - AddedPrivateCustomer
*   `130107` - UpdatedPrivateCustomer
*   `130108` - PrivateCustomerBatchUpdate
*   `130109` - BusinessCustomerBatchUpdate

#### [Incomplete Products (142x)](#incomplete-products-142x)

*   `142100` - CompletedIncompleteProduct

#### [Promotions (145x)](#promotions-145x)

*   `145100` - CreatePromotionWithPriceUpdate
*   `145101` - CreatePromotion
*   `145102` - UpdatePromotionWithPriceUpdate
*   `145103` - UpdatePromotion
*   `145104` - DeletePromotionWithPriceUpdate
*   `145105` - DeletePromotion

#### [Inventory (150x)](#inventory-150x)

*   `150100` - ProcessingGoodsReception
*   `150101` - ProcessingGoodsReceptionUpdatingInventory
*   `150102` - ProcessingGoodsReceptionUpdatedInventory
*   `150103` - ProcessGoodsTransferFromWarehouse
*   `150104` - ProcessGoodsReceptionNoLineItemsFound
*   `150105` - ProcessingUpdateInventory
*   `150106` - UpdatedAtpIndex

#### [Purchase Orders (151x)](#purchase-orders-151x)

*   `151101` - PurchaseOrderWorkflowStarted
*   `151102` - PurchaseOrderWorkflowCompleted
*   `151103` - ExportPurchaseOrder
*   `151104` - ExportPurchaseOrderToAllExporters
*   `151105` - ExecuteExportPurchaseOrder

#### [Projects (160x)](#projects-160x)

*   `160100` - ProjectWorkflowStarted
*   `160101` - ReleasedProjectOnHold
*   `160102` - ProjectCreated

#### [Analytics (181x)](#analytics-181x)

*   `181100` - IndexAnalyticsReorderSuggestions

#### [Other Core Operations (190x)](#other-core-operations-190x)

*   `190100` - ExcelImportProcessImportBackground
*   `190101` - ExcelImportProcessedBatch
*   `190102` - ExcelImportProcessedLastBatch
*   `190103` - ExcelImportCompleted
*   `190104` - ExcelImportCustomerClubBonusPointsProcessedBatch

#### [Comments (1902x)](#comments-1902x)

*   `190200` - CommentAdded
*   `190201` - CommentDeleted
*   `190202` - CommentProcessed
*   `190203` - CommentNotificationSent

#### [Scheduled Tasks (195x)](#scheduled-tasks-195x)

*   `195100` - RunScheduledTask

#### [Notifications (196x)](#notifications-196x)

*   `196100` - NotificationGetAndSendPendingNotificationMessagesOrders
*   `196101` - NotificationGetAndSendPendingNotificationMessagesProjects
*   `196102` - NotificationIsSentForOrder
*   `196103` - NotificationIsSentForProject
*   `196104` - NotificationIsSentForPurchaseOrder
*   `196201` - NotificationIsSentForPayByLink

### [Internal API Operations (2x xxxx)](#internal-api-operations-2x-xxxx)

#### [General (200x)](#general-200x)

*   `200001` - GuiExtensionTriggered

#### [GUI Orders (210x)](#gui-orders-210x)

*   `210100` - GuiOrderAddedOrder
*   `210101` - GuiOrderUpdatedOrder
*   `210102` - GuiOrderUpdateAndRunWorkflow
*   `210103` - GuiOrderUpdateAndRunWorkflowStep
*   `210104` - GuiOrderUpdatedOrderLines
*   `210105` - GuiOrderAddedOrderLine
*   `210106` - GuiExportOrder
*   `210107` - GuiOrderClearError
*   `210108` - GuiOrderSolveError
*   `210109` - GuiOrderUpdateStatus
*   `210110` - GuiOrderUpdateStatusMultipleWithWorkflow
*   `210111` - GuiOrderUpdateStatusMultipleWithoutWorkflow
*   `210112` - GuiOrderUpdateShipments
*   `210113` - GuiOrderUpdateCustomer
*   `210114` - GuiOrderUpdateDiscount
*   `210115` - GuiOrderUpdateCouponCodes
*   `210116` - GuiOrderUpdateMetadata
*   `210117` - GuiOrderUpdateStoreAndWarehouse
*   `210118` - GuiOrderUpdateBillingAddress
*   `210119` - GuiOrderChangeShipmentOrderLine
*   `210120` - GuiOrderAddOrderLine
*   `210121` - GuiOrderAddShipmentOrderLine
*   `210122` - GuiOrderSendNotifications
*   `210123` - GuiOrderSendNotificationsByTemplate
*   `210124` - GuiOrderSplitOrderLine
*   `210125` - GuiOrderSendGiftCardNotifications
*   `210126` - GuiOrderCancelProducts
*   `210127` - GuiOrderReplaceProducts
*   `210128` - GuiOrderPrintReceipt
*   `210129` - GuiOrderPrintOrderConfirmation
*   `210130` - GuiOrderGlobalOrderSearch
*   `210131` - GuiExportDepositOrder

#### [GUI Distribution (212x)](#gui-distribution-212x)

*   `212100` - GuiChangedDistribution

#### [GUI Invoice (213x)](#gui-invoice-213x)

*   `213100` - GuiUpdatedInvoice

#### [GUI Picklists (214x)](#gui-picklists-214x)

*   `214100` - GuiPickListCreate
*   `214101` - GuiPickListAddItems
*   `214102` - GuiPickListUpdateOrdersBasedOnPickList
*   `214103` - GuiPickListTransferToOtherWarehouse
*   `214104` - GuiPickListRemoveShipment
*   `214105` - GuiPickListRefreshOrderData
*   `214106` - GuiPickListRefreshShipmentInfo

#### [GUI Click and Collect (215x)](#gui-click-and-collect-215x)

*   `215100` - GuiClickCollectCancelOrderLines
*   `215101` - GuiClickCollectUpdateOrder
*   `215102` - GuiClickCollectUpdateOrderMetadata
*   `215103` - GuiClickCollectCompleteOrderLines

#### [GUI Payments (216x)](#gui-payments-216x)

*   `216101` - GuiAddInStorePayment
*   `216102` - GuiPaymentDeleted
*   `216103` - GuiPaymentRegisterPayment
*   `216104` - GuiPaymentAuthorize
*   `216105` - GuiPaymentAddAwaiting
*   `216106` - GuiPaymentDirectCapture
*   `216107` - GuiPaymentCapture
*   `216108` - GuiPaymentCancel
*   `216109` - GuiPaymentRelease
*   `216110` - GuiPaymentManualTransaction
*   `216111` - GuiPaymentCreateBonusPointsPayment
*   `216112` - GuiPaymentCreateSalesPayment
*   `216113` - GuiPaymentCreateInvoicePayment
*   `216114` - GuiPaymentUpdatePaymentProperties
*   `216115` - GuiPaymentUpdatePaymentLine
*   `216116` - GuiPaymentUpdateAuthorization
*   `216117` - GuiPaymentUpdateAuthorizationExtendTime
*   `216118` - GuiPaymentUpdateAuthorizationExtendTimeMultiple
*   `216119` - GuiPaymentCredit
*   `216120` - GuiPaymentExport
*   `216121` - GuiPaymentCreateCreditNote
*   `216122` - CaptureCallbackOutsideOmnium

#### [GUI Shipments (217x)](#gui-shipments-217x)

*   `217100` - GuiShipmentUpdateStatus
*   `217101` - GuiUpdatedShipment

#### [GUI Returns (218x)](#gui-returns-218x)

*   `218100` - GuiCreateReturn
*   `218101` - GuiCreateReturnOrder
*   `218102` - GuiAddOrderLineToReturnOrderEvent
*   `218103` - GuiExportReturn
*   `218104` - GuiUpdateReturnStatus
*   `218105` - GuiUpdateReturnStatusError
*   `218106` - GuiUpdateReturnOrderLines
*   `218107` - GuiAddOrderLineToReturn
*   `218108` - GuiUpdateReturnMetadata

#### [GUI Replacement Orders (219x)](#gui-replacement-orders-219x)

*   `219100` - GuiCreateReplacementOrder

#### [GUI Carts (220x)](#gui-carts-220x)

*   `220100` - GuiCreatedCart
*   `220101` - GuiCreatedCartId
*   `220102` - GuiCreatedCartFromSource
*   `220103` - GuiCreatedCartFromOrder
*   `220104` - GuiUpdatedCart
*   `220105` - GuiDeletedCart
*   `220106` - GuiCartSplitOrderLine
*   `220107` - GuiCartRemovedLineItem
*   `220108` - GuiCartAddOrderLine
*   `220109` - GuiCartUpdateOrderLineQuantity
*   `220110` - GuiCartAddedStore
*   `220111` - GuiCreatedClickCollectOrderFromCart
*   `220112` - GuiUpdateShipments
*   `220113` - GuiCartClearError
*   `220114` - GuiAddLineItemsToCart
*   `220115` - GuiCancelCart
*   `220116` - GuiCreatedCartFromCart
*   `220117` - GuiApplyVoucherToCart
*   `220118` - GuiCartConnectorExport
*   `220119` - GuiCartDepositConnectorExport

#### [GUI Private Customers (2301x)](#gui-private-customers-2301x)

*   `230100` - GuiAddedPrivateCustomer
*   `230101` - GuiUpdatedPrivateCustomer
*   `230102` - GuiDeletedPrivateCustomer
*   `230103` - GuiUpdatedPrivateCustomerMetadata
*   `230104` - GuiUpdatedPrivateCustomerStores
*   `230105` - GuiAnonymizedPrivateCustomer
*   `230106` - GuiUpdatedPrivateCustomerExternalIds
*   `230107` - GuiMergePrivateCustomer

#### [GUI Business Customers (2302x)](#gui-business-customers-2302x)

*   `230200` - GuiCreatedBusinessCustomer
*   `230201` - GuiUpdatedBusinessCustomer
*   `230202` - GuiUpdatedBusinessCustomerExternalIds
*   `230203` - GuiMergeBusinessCustomer
*   `230204` - GuiAddedBusinessCustomerContact
*   `230205` - GuiUpdatedBusinessCustomerContact
*   `230206` - GuiDeletedBusinessCustomerContact
*   `230207` - GuiDeletedBusinessCustomer

#### [GUI Customer Club (231x)](#gui-customer-club-231x)

*   `231100` - GuiAddedCustomerClubMembership
*   `231101` - GuiUpdatedCustomerClubMembership
*   `231102` - GuiCreatedCustomerClubMembershipFromCustomer
*   `231103` - GuiDeletedCustomerClubMembership
*   `231104` - GuiDeletedCustomerClubMembershipWithInvalidPhoneNumber
*   `231105` - GuiDeletedCustomerClubMembershipEndedBySystem

#### [GUI Customer Segmentation (232x)](#gui-customer-segmentation-232x)

*   `232100` - GuiSentCustomerToCustomerList

#### [GUI Newsletter (233x)](#gui-newsletter-233x)

*   `233100` - GuiAddNewsletter
*   `233101` - GuiUpdateNewsletter
*   `233102` - GuiDeleteNewsletter

#### [GUI Vouchers (234x)](#gui-vouchers-234x)

*   `234100` - GuiAddVoucher
*   `234101` - GuiUpdateVoucher
*   `234102` - GuiDeleteVoucher

#### [GUI Products (240x)](#gui-products-240x)

*   `240100` - GuiAddProduct
*   `240101` - GuiDeleteProduct
*   `240102` - GuiDeleteProducts
*   `240103` - GuiAddProductImage
*   `240104` - GuiProductUpdatePrices
*   `240105` - GuiProductUpdateMetadata
*   `240106` - GuiEnrichProduct
*   `240107` - GuiEnrichProductFromQuickEdit
*   `240108` - GuiEnrichProductFromQuickEditList
*   `240109` - GuiEnrichVariantFromQuickEditList
*   `240110` - GuiProductClearError
*   `240111` - GuiProductAddCategory
*   `240112` - GuiProductRemoveCategory
*   `240113` - GuiProductUpdateMainCategory
*   `240114` - GuiProductPatch
*   `240115` - GuiProductExcelImport
*   `240116` - GuiProductUpdateStatus
*   `240117` - GuiProductUpdateCost
*   `240118` - GuiProductUpdateLocation
*   `240119` - GuiExportProduct

#### [GUI Incomplete Products (242x)](#gui-incomplete-products-242x)

*   `242100` - GuiCreateIncompleteProduct
*   `242101` - GuiUpdateIncompleteProduct

#### [GUI Price Lists (243x)](#gui-price-lists-243x)

*   `243100` - GuiCreatePriceList
*   `243101` - GuiUpdatePriceList
*   `243102` - GuiAddedProductsToPriceList
*   `243103` - GuiCreatedPriceListFromProducts
*   `243104` - GuiCreatedCopyOfPriceList
*   `243105` - GuiActivatedPriceList
*   `243106` - GuiDeactivatedPriceList
*   `243107` - GuiDeletedPriceList
*   `243108` - GuiUpdatedPriceListPrices

#### [GUI Gift Cards (249x)](#gui-gift-cards-249x)

*   `249100` - GuiCreateGiftCard

#### [GUI Inventory (250x)](#gui-inventory-250x)

*   `250100` - GuiUpdatedInventories
*   `250101` - GuiUpdatedInventoryBatches
*   `250102` - GuiUpdatedInventoriesForAllWarehouses
*   `250103` - GuiUpdatedInventoryBatchesExcelImport
*   `250104` - GuiAllocationOfInventoryToVsl
*   `250105` - GuiImportInventoryFromApi
*   `250106` - GuiImportInventoryFromApiScroll
*   `250107` - GuiImportInventoryFromApiScrollBatch
*   `250108` - GuiUpdatedSingleInventory

#### [GUI Purchase Orders (251x)](#gui-purchase-orders-251x)

*   `251100` - GuiAddPurchaseOrder
*   `251101` - GuiAddPurchaseOrderLine
*   `251102` - GuiUpdatePurchaseOrderLine
*   `251103` - GuiUpdatePurchaseOrderLines
*   `251104` - GuiUpdatePurchaseOrderLineQuantity
*   `251105` - GuiUpdatePurchaseOrderStatus
*   `251106` - GuiUpdatePurchaseOrderSupplier
*   `251107` - GuiUpdatePurchaseOrderMetadata
*   `251108` - GuiDeletePurchaseOrderLine
*   `251109` - GuiPurchaseOrderPackageBreakdown
*   `251110` - GuiUpdatePurchaseOrderStatusError
*   `251111` - GuiUpdatePurchaseOrderStatusWithoutWorkflow
*   `251112` - GuiCreatePurchaseOrderFromSuggestions
*   `251113` - GuiPurchaseOrderClearError
*   `251114` - GuiPurchaseOrderSolveError
*   `251115` - GuiPurchaseOrderCancelLineItem
*   `251116` - GuiPurchaseOrderSplitOrderLine

#### [GUI Deliveries (252x)](#gui-deliveries-252x)

*   `252100` - GuiExportDelivery
*   `252101` - GuiUpdatedDeliveryMetadata
*   `252102` - GuiDeliveryUpdatedEstimatedTimeOfArrival
*   `252103` - GuiDeliveryDeleteInternalComment
*   `252104` - GuiDeliveryDeletePublicComment
*   `252105` - GuiDeliveryUpdateDeliveryIdOnOrders
*   `252106` - GuiDeliveryCreateNewDelivery
*   `252107` - GuiDeliveryAddToExistingDelivery
*   `252108` - GuiDeliveryInventoryReducedByInternalDelivery
*   `252109` - GuiDeliveryUpdatedWithNewLineItems
*   `252110` - GuiDeliverySplitLineItem
*   `252111` - GuiDeliveryCancelLineItem
*   `252112` - GuiDeliveryProcessGoodsReception
*   `252113` - GuiDeliveryRemoveLineItem
*   `252114` - GuiDeliveryDeleteFromOrders
*   `252115` - GuiDeliveryDeleted

#### [GUI Suppliers (253x)](#gui-suppliers-253x)

*   `253100` - GuiUpdatedSupplier
*   `253101` - GuiDeletedSupplier

#### [GUI Projects (260x)](#gui-projects-260x)

*   `260100` - GuiAddProject
*   `260101` - GuiDeleteProject
*   `260102` - GuiProjectCancelByPartner
*   `260103` - GuiProjectCancelByInternal
*   `260104` - GuiProjectCancelByCustomer
*   `260105` - GuiSaveProject
*   `260106` - GuiSaveProjectWithWorkflow
*   `260107` - GuiSaveProjectWithCheckList
*   `260108` - GuiSaveProjectWithNewStore
*   `260109` - GuiSaveProjectWithNewPartner
*   `260110` - GuiSaveProjectWithNewContactPerson
*   `260111` - GuiProjectWorkflowPreviousStep
*   `260112` - GuiProjectWorkflowNextStep
*   `260113` - GuiProjectCompleted
*   `260114` - GuiProjectActivated
*   `260115` - GuiProjectOnHold
*   `260116` - GuiProjectOnHoldUntil
*   `260117` - GuiProjectPartsUpdated
*   `260118` - GuiProjectContactsUpdated
*   `260119` - GuiProjectChangeOrdersUpdated
*   `260120` - GuiProjectSendNotifications
*   `260121` - GuiProjectRemoveContactPerson
*   `260122` - GuiProjectProductsUpdated

#### [GUI Stores (270x)](#gui-stores-270x)

*   `270100` - GuiAddedStore
*   `270101` - GuiUpdatedStore
*   `270102` - GuiDeletedStore

#### [GUI Users (271x)](#gui-users-271x)

*   `271100` - GuiDeletedUser
*   `271101` - GuiUpdatedUser

#### [GUI Analytics (281x)](#gui-analytics-281x)

*   `281100` - GuiIndexAnalyticsReorderSuggestionsByProductSearchRequest

#### [GUI Other (290x)](#gui-other-290x)

*   `290100` - EventSubscriptionExecuted
*   `290101` - EventSubscriptionEventExecuted

#### [GUI Tenant Settings (297x)](#gui-tenant-settings-297x)

*   `297100` - GuiTenantSettingsSavedFullDraft
*   `297101` - GuiTenantSettingsUseDraft
*   `297102` - GuiTenantSettingsSavedDraft
*   `297103` - GuiTenantSettingsSavedVersion
*   `297104` - GuiTenantSettingsPublished
*   `297105` - GuiTenantSettingsDeleted
*   `297106` - GuiTenantSettingsPublishedDraft
*   `297107` - GuiTenantSettingsUpdatedByImport

#### [GUI Categories (298x)](#gui-categories-298x)

*   `298100` - GuiCategoryAdd
*   `298101` - GuiCategoryUpdate
*   `298102` - GuiCategoryDeleted
*   `298103` - GuiCategoryBatchUpdate

### [Public API Operations (3x xxxx)](#public-api-operations-3x-xxxx)

#### [API Orders (310x)](#api-orders-310x)

*   `310100` - ApiOrderPatch
*   `310101` - ApiOrderUpdateStatus
*   `310102` - ApiOrderUpdateStatusWithoutWorkflow
*   `310103` - ApiOrderUpdateStatusPartial
*   `310104` - ApiOrderLinePatch
*   `310105` - ApiOrderLineAddProperties
*   `310106` - ApiOrderLineCancel
*   `310107` - ApiOrderAddPayment

#### [API Invoice (313x)](#api-invoice-313x)

*   `313100` - ApiInvoiceUpload
*   `313200` - ApiInvoiceAdd
*   `313300` - ApiInvoiceUpdate

#### [API Click and Collect (315x)](#api-click-and-collect-315x)

*   `315100` - CustomerPickupLimitExtended

#### [API Returns (318x)](#api-returns-318x)

*   `318100` - ApiCreateReturn
*   `318101` - ApiUpdateReturnStatus
*   `318102` - ApiUpdateReturnStatusError

#### [API Replacement Orders (319x)](#api-replacement-orders-319x)

*   `319100` - ApiCreateReplacementOrder

#### [API Carts (320x)](#api-carts-320x)

*   `320100` - ApiCreateCart
*   `320101` - ApiSaveCart
*   `320102` - ApiDeleteCart
*   `320103` - ApiCreateCartFromOrderLine
*   `320104` - ApiAddProductOptionsItemToCart
*   `320105` - ApiAddItemToCart
*   `320106` - ApiAddItemToCartBySkuAndQuantity
*   `320107` - ApiUpdateItemQuantityBySku
*   `320108` - ApiUpdateItemQuantityByOrderLineId
*   `320109` - ApiAddOrderLineToCart
*   `320110` - ApiAddCustomerIdToCart
*   `320111` - ApiAddStoreToCart
*   `320112` - ApiAddGiftCardToCart
*   `320113` - ApiRemoveGiftCardFromCart
*   `320114` - ApiAddCouponCodeToCart
*   `320115` - ApiRemoveCouponCodeToCart
*   `320116` - ApiAddPaymentToCart
*   `320117` - ApiAddShipmentToCart
*   `320118` - ApiCartDeleteOrderLine
*   `320119` - ApiApplyVoucherToCart
*   `320200` - ApiDeleteShipmentsFromCart
*   `320121` - ApiRemoveVoucherFromCart

#### [API Private Customers (3301x)](#api-private-customers-3301x)

*   `330100` - ApiAddPrivateCustomer
*   `330101` - ApiUpdatePrivateCustomer
*   `330102` - ApiAddPrivateCustomerConsent
*   `330103` - ApiAddCustomerClubMember
*   `330104` - ApiAddCustomerClubMemberWithConsent
*   `330105` - ApiAddCustomerClubMemberWithPatch
*   `330106` - ApiUpdateCustomerClubMemberWithPatch
*   `330107` - ApiUpdateCustomerClubMemberWithInterests
*   `330108` - ApiAddCustomerClubMemberWithConsentList
*   `330109` - ApiUpdateCustomerClubMemberWithConsentList
*   `330110` - ApiAddPendingCustomerClubMember
*   `330111` - ApiUpdateCustomerClubMemberConsents
*   `330112` - ApiDeleteCustomerClubMember
*   `330113` - ApiPrivateCustomerPatch
*   `330114` - ApiAnonymizePrivateCustomer
*   `330115` - ApiMergePrivateCustomer
*   `330116` - ApiDeletePrivateCustomer
*   `330117` - ApiAddManyPrivateCustomers
*   `330118` - ApiUpdateManyPrivateCustomers

#### [API Business Customers (3302x)](#api-business-customers-3302x)

*   `330200` - ApiAddBusinessCustomer
*   `330201` - ApiUpdateBusinessCustomer
*   `330202` - ApiMergeBusinessCustomer
*   `330203` - ApiAddedBusinessCustomerContact
*   `330204` - ApiUpdatedBusinessCustomerContact
*   `330205` - ApiDeletedBusinessCustomerContact
*   `330206` - ApiBusinessCustomerAssetAdded
*   `330207` - ApiBusinessCustomerAssetsAdded
*   `330208` - ApiBusinessCustomerAssetsUpdated
*   `330209` - ApiBusinessCustomerAssetsDeleted
*   `330210` - ApiBusinessCustomerPatch
*   `330211` - ApiBusinessCustomerContactPersonAdded
*   `330212` - ApiBusinessCustomerContactPersonUpdated
*   `330213` - ApiBusinessCustomerContactPersonDeleted
*   `330214` - ApiDeleteBusinessCustomer
*   `330215` - ApiUpdateManyBusinessCustomer

#### [API Customer Club (331x)](#api-customer-club-331x)

*   `331100` - ApiCustomerClubUnsubscribe

#### [API Price Lists (343x)](#api-price-lists-343x)

*   `343100` - ApiAddPriceList
*   `343105` - ApiActivatedPriceList
*   `343106` - ApiDeactivatedPriceList
*   `343110` - ApiDeletePriceList

#### [API Inventory (350x)](#api-inventory-350x)

*   `350000` - ApiInventoryAddMany
*   `350001` - ApiInventoryDelete
*   `350002` - ApiInventoryUpdateMany

#### [API Purchase Orders (351x)](#api-purchase-orders-351x)

*   `351100` - ApiAddPurchaseOrder
*   `351101` - ApiUpdatePurchaseOrder
*   `351102` - ApiPatchPurchaseOrder
*   `351103` - ApiDeletePurchaseOrder
*   `351104` - ApiCancelPurchaseOrderLine

#### [API Products (140x)](#api-products-140x)

🙈_yeah... we might’ve messed up the prefix on these_

*   `140101` - DeletedProduct
*   `140102` - AddManyProducts
*   `140103` - UpdateManyProducts
*   `140104` - UpdatedAtpDate
*   `140105` - PatchProduct
*   `140106` - AddProduct
*   `140107` - AddProductVariant
*   `140108` - AddManyProductVariants
*   `140109` - PatchProductVariant
*   `140110` - PatchManyProductVariants

#### [API Deliveries (352x)](#api-deliveries-352x)

*   `352112` - ApiDeliveryProcessGoodsReception
*   `352113` - ApiUpdatedDeliveryFromPatch
*   `352114` - ApiDeletedDelivery
*   `352115` - ApiUpdatedDelivery
*   `352116` - ApiCreatedDelivery

#### [API Suppliers (353x)](#api-suppliers-353x)

*   `353100` - ApiUpdatedSupplier
*   `353101` - ApiDeletedSupplier

#### [API Projects (3601x)](#api-projects-3601x)

*   `360100` - ApiProjectUpdateStatus
*   `360101` - ApiProjectDeletePartner
*   `360102` - ApiProjectAddAssets
*   `360103` - ApiProjectAddPartners
*   `360104` - ApiProjectDeletePartners
*   `360105` - ApiProjectAddCustomerComment
*   `360106` - ApiProjectDecline
*   `360107` - ApiProjectDeclinePartnerRequest
*   `360108` - ApiProjectAccept
*   `360109` - ApiProjectAcceptPartnerRequest
*   `360110` - ApiProjectGoToWorkflowStep
*   `360111` - ApiProjectAddRejectingPartner
*   `360112` - ApiProjectRemoveRejectingPartner
*   `360113` - ApiProjectSendEmail
*   `360114` - ApiProjectSendSms
*   `360115` - ApiProjectAddCustomer
*   `360116` - ApiProjectAddBusinessCustomer
*   `360117` - ApiProjectUpdate
*   `360118` - ApiProjectPatch
*   `360119` - ApiProjectActivated

#### [API Project Change Orders (3602x)](#api-project-change-orders-3602x)

*   `360200` - ApiProjectChangeOrderAdd
*   `360201` - ApiProjectChangeOrderAddMany
*   `360202` - ApiProjectChangeOrderUpdate
*   `360203` - ApiProjectChangeOrderUpdateMany
*   `360204` - ApiProjectChangeOrderDelete

#### [API Project Parts (3603x)](#api-project-parts-3603x)

*   `360300` - ApiProjectPartsAdd
*   `360301` - ApiProjectPartsAddMany
*   `360302` - ApiProjectPartsUpdate
*   `360303` - ApiProjectPartsUpdateMany
*   `360304` - ApiProjectPartsDelete
*   `360305` - ApiProjectPartTaskUpdate

#### [API Project Transactions (3604x)](#api-project-transactions-3604x)

*   `360400` - ApiProjectTransactionsAdd
*   `360401` - ApiProjectTransactionsAddMany
*   `360402` - ApiProjectTransactionsUpdate
*   `360403` - ApiProjectTransactionsUpdateMany
*   `360404` - ApiProjectTransactionsDelete

#### [API Stores (370x)](#api-stores-370x)

*   `370100` - ApiStoreAdd
*   `370101` - ApiStoreUpdate
*   `370102` - ApiStoreDelete
*   `370103` - ApiStoreDeleteById
*   `370104` - ApiStoreCreateOrUpdate
*   `370105` - ApiStoreEnrich
*   `370106` - ApiStoreEnrichAdd
*   `370107` - ApiStorePatch

#### [API Categories (398x)](#api-categories-398x)

*   `398100` - ApiCategoryAdd
*   `398102` - ApiCategoryDeleted
*   `398104` - ApiCategoryBatchAdd

### [Batch operations (510x)](#batch-operations-510x)

_The batch update events will be triggered for every batch update regardless of origin_

*   `510102` - ProductBatchUpdate

### [Related Documentation](#related-documentation)

*   [Event Queues](/docs/Integrations/queues) - Queue configuration for events
*   [Event-Driven vs Polling Integrations](/docs/Integrations/data-out#event-driven-vs-polling-integrations) - Guidance on choosing between events and polling for data export

[

Previous

Data Out

](/docs/Integrations/data-out)[

Next

Delta Queries

](/docs/Integrations/delta)

---


## GUI Export and Import

[Integrations](/docs/Integrations)

# GUI Export and Import

Manual data export and import using Omnium's UI in JSON and Excel formats for transferring information between systems.


## [Omnium Data Import & Export](#omnium-data-import--export)

### [JSON Format](#json-format)

You can use JSON to export and import data with external systems such as inventory management, CRM, e-commerce platforms, and shipping providers. JSON provides a structured format for exchanging data and supports automated processes and API integrations.

### [Use Cases](#use-cases)

*   **Data Transfer**: Move data between environments.
*   **Debugging**: Extract and modify data for troubleshooting.
*   **Integration**: Sync Omnium data with external applications.

### [Exporting JSON Data](#exporting-json-data)

1.  Go to **Configuration → Export → JSON**.
2.  Select the document type.
3.  Enter the document IDs (comma-separated or line break).
4.  Click **Export** to download the JSON file.

![Export Interface](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fgui_export.cb83416c.jpg&w=3840&q=75)

### [Importing JSON Data](#importing-json-data)

1.  Go to **Configuration → Export → JSON**.
2.  Select the document type.
3.  Paste the raw JSON content into the **Data** field.
4.  Click **Import**.

![Export Interface](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fgui_import.921d6891.jpg&w=3840&q=75)

**Note:** Importing data will replace existing documents with the same ID in Omnium.

### [Excel](#excel)

Importing data from Excel files provides a straightforward way to manage data without requiring coding or API integrations. Users can map Excel headers to Omnium properties, ensuring data is imported correctly. This method is useful for working with structured data in a familiar spreadsheet format.

![Image](/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fimport_excel.6cb31d44.jpg&w=3840&q=75)

[

Previous

Queues

](/docs/Integrations/queues)[

Next

Troubleshooting

](/docs/Integrations/troubleshooting)

---
