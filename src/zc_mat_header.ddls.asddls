@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View - Cabeçalho do Material'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_MAT_HEADER
  provider contract transactional_query
  as projection on ZI_MAT_HEADER
{
  key MatUuid,
      MaterialId,
      Description,
      MaterialType,

      _Items : redirected to composition child ZC_MAT_ITEMS
}
