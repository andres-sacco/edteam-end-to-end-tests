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
    get.inject(rampUsers(1) during (1 seconds)).protocols(protocol)
  ).assertions()
}