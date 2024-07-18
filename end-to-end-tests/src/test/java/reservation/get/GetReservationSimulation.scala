package reservation.get

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._

class GetReservationSimulation extends Simulation {

  def urlPattern = "GET /api/flights/reservation/"

  val protocol = karateProtocol(
    "/reservation/{id}" -> Nil
  )

  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")

  //Which is the environment to run the test
  protocol.runner.karateEnv("dev")

  //The name of the file and the scenario to run
  val get = scenario("Get all the information about one reservation").exec(karateFeature("classpath:reservation/get/get-reservation-ok.feature"))

  setUp(
    //The number of users that receive the endpoint for a period of time
    get.inject(
      // Simple
      rampUsers(10) during (10 seconds) // increment the number of users

      // atOnceUsers(10) // 10 users one time at the same moment
      // constantUsersPerSec(20).during(15).randomized //20 users random
      // stressPeakUsers(100).during(10)

      // Multiple
      // constantConcurrentUsers(10).during(10),
      // rampConcurrentUsers(10).to(20).during(10)
    ).protocols(protocol)
  ).assertions(
    global.responseTime.max.lt(2000), // Maximum response time should be less than 2 seconds
    global.responseTime.mean.lt(500), // Mean response time should be less than 500 ms

    global.responseTime.percentile1.lt(1000), // 50th percentile response time should be less than 1 second
    global.responseTime.percentile2.lt(700), // 75th percentile response time should be less than 700 millisecond
    global.responseTime.percentile3.lt(500), // 95th percentile response time should be less than 500 millisecond
    global.responseTime.percentile4.lt(100), // 99th percentile response time should be less than 100 millisecond

    global.successfulRequests.percent.gt(95), // More than 95% of requests should be successful
    global.failedRequests.count.is(0) // There should be no failed requests
  )
}