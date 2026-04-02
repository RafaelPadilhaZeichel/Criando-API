@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - Cabeçalho do Material'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_MAT_HEADER
  as select from zmat_header
  composition [0..*] of ZI_MAT_ITEMS as _Items
{
  key mat_uuid        as MatUuid,
      material_id     as MaterialId,
      description     as Description,
      material_type   as MaterialType,

      @Semantics.user.createdBy: true
      created_by      as CreatedBy,

      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,

      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,

      _Items
}
