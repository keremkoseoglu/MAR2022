@EndUserText.label: 'Aktivite için Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_RAP_ACTIVITY
  as projection on ZI_RAP_ACTIVITY
{
  key ActivityGuid,
      @Search.defaultSearchElement: true
      Consultant,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{
        entity: {
          name : 'ZI_RAP_CARRIER',
          element : 'ProjectId'
        }
      }]
      Project,
      @Search.defaultSearchElement: true
      ActivityDate,
      ActivityTime,
      WorkDone,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _project
}
