@AbapCatalog.sqlViewName: 'ZAMDP027'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Table Function çağıran CDS'
define view ZI_AMDP_TAB_FUN_CAGIR
  as select from sbook
    inner join   ZI_AMDP_TAB_FUN_NP( p_client: $session.client ) as _tf on  _tf.carrid = sbook.carrid
                                                                        and _tf.connid = sbook.connid
                                                                        and _tf.fldate = sbook.fldate
{
  _tf.carrid,
  _tf.connid,
  _tf.fldate,
  sbook.bookid
}
