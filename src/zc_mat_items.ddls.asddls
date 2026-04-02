@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View - Itens do Material'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_MAT_ITEMS
  as projection on ZI_MAT_ITEMS
{
  key ItemUuid,
      MatUuid,
      Posnr,
      Plant,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      Quantity,
      Unit,
      _Material : redirected to parent ZC_MAT_HEADER
}
