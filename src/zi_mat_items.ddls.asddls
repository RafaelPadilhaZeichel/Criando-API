@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - Itens do Material'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_MAT_ITEMS
  as select from zmat_items
  association to parent ZI_MAT_HEADER as _Material on $projection.MatUuid = _Material.MatUuid
{
  key item_uuid             as ItemUuid,
      mat_uuid              as MatUuid,
      posnr                 as Posnr,
      plant                 as Plant,

      @Semantics.quantity.unitOfMeasure: 'Unit'
      quantity              as Quantity,
      unit                  as Unit,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Material
}
