package traderx.tradeservice.shared

/** Generated based on TradeService.Shared.TradeSide
*/
case class TupleKeyCommand[K, C](
  @scala.beans.BeanProperty @com.fasterxml.jackson.annotation.JsonProperty ("key") key: K,
  @scala.beans.BeanProperty @com.fasterxml.jackson.annotation.JsonProperty ("command") command: C
){}

/** Generated based on TradeService.Shared.TradeSide
*/
abstract class SpringBootStatefulAppAdapter[K, C, S, E](
  statefulApp: traderx.tradeservice.shared.StatefulApp[K, C, S, E]
){

  val requests = traderx.tradeservice.shared.MainApplication.metricRegistry.meter("statefulAppRequests")
  
  val table = new scala.collection.mutable.HashMap[K, S]
  
  @org.springframework.web.bind.annotation.PostMapping(value= Array("/v1.0/command"), consumes = Array(org.springframework.http.MediaType.APPLICATION_JSON_VALUE), produces = Array("application/json"))
  def entryPoint(
    @org.springframework.web.bind.annotation.RequestBody input: TupleKeyCommand[K, C]
  ): E =
    {requests.mark
    val state = table.get(input.key)
    val result = process(input.command, state)
    update(input.key, state, result)
    result._2}
  
  
  def update(
    key: K,
    state: Option[S],
    result: (morphir.sdk.Maybe.Maybe[S], E)
  ) =
    (state, result) match {
      case (None, (morphir.sdk.Maybe.Just(a), _)) => 
        table.addOne((key, a))
      case (Some(_), (morphir.sdk.Maybe.Nothing, _)) => 
        table.remove(key)
      case _ => 
        None
    }
  
  def process(
    command: C,
    state: Option[S]
  ): (morphir.sdk.Maybe.Maybe[S], E) =
    statefulApp.businessLogic(state)(command)
  
  @springfox.documentation.annotations.ApiIgnore
  @org.springframework.web.bind.annotation.RequestMapping(value = Array("/"))
  def home =
    new org.springframework.web.servlet.ModelAndView("redirect:/swagger-ui/index.html")
  
  
  @org.springframework.web.bind.annotation.GetMapping(value = Array("/v1.0/list"))
  def list =
    {implicit val formats = org.json4s.DefaultFormats
    org.json4s.jackson.Serialization.write(table)}
  

}