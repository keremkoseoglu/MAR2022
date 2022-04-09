@AbapCatalog.sqlViewName: 'ZRAP251'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Havayolu firmaları = projeler'
define view ZI_RAP_CARRIER
  as select from scarr
{
  key carrid   as ProjectId,
      carrname as ProjectName
}
