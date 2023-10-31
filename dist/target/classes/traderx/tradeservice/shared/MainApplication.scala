package traderx.tradeservice.shared

/** Generated based on TradeService.Shared.TradeSide
*/
@org.springframework.boot.autoconfigure.SpringBootApplication
class MainApplication{

  @org.springframework.beans.factory.annotation.Autowired
  private val servletContext: javax.servlet.ServletContext = _null
  
  
  @org.springframework.context.annotation.Bean
  def adminServletRegistrationBean = {
    (servletContext.setAttribute(
      com.codahale.metrics.servlets.MetricsServlet.METRICS_REGISTRY,
      morphir.reference.model.MainApplication.metricRegistry
    )) 
     (new org.springframework.boot.web.servlet.ServletRegistrationBean(
      new com.codahale.metrics.servlets.MetricsServlet(),
      "/metrics"
    ))
  }
  
  
  @org.springframework.context.annotation.Bean
  def api: springfox.documentation.spring.web.plugins.Docket =
    new springfox.documentation.spring.web.plugins.Docket(springfox.documentation.spi.DocumentationType.SWAGGER_2).select.apis(springfox.documentation.builders.RequestHandlerSelectors.basePackage( "traderx.tradeservice.shared" )).paths(springfox.documentation.builders.PathSelectors.any).build
  

}


/** Generated based on TradeService.Shared.TradeSide
*/
object MainApplication extends App{

  val metricRegistry = new com.codahale.metrics.MetricRegistry


  org.springframework.boot.SpringApplication.run(classOf[MainApplication], args:_*)}