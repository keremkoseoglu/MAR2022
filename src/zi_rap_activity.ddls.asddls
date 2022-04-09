@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aktivite için View'
define root view entity ZI_RAP_ACTIVITY
  as select from zrap_activ
  association [0..1] to ZI_RAP_CARRIER as _project on _project.ProjectId = $projection.Project
{
  key guid                  as ActivityGuid,
      bname                 as Consultant,
      carrid                as Project,
      act_date              as ActivityDate,
      act_time              as ActivityTime,
      stext                 as WorkDone,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDate.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDate.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      _project
}
