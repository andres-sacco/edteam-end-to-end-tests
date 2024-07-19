package reservation.documentation;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Disabled;
import com.microsoft.playwright.*;

class PlaywrightTest {

    @Disabled
    @Test
    void should_validate_documentation() {
        Playwright playwright = Playwright.create();
        BrowserType browserType = playwright.chromium();
        Browser browser = browserType.launch();
        Page page = browser.newPage();
        page.navigate("http://localhost:3070/api/flights/reservation/documentation");

        // Interact with the Swagger UI as needed
        page.click("text=Explore");
        page.waitForSelector("text=OpenAPI definition");

        page.click("#operations-Reservation-getReservationById");
        page.waitForSelector("text=Get the information about one reservation");

        browser.close();
        playwright.close();
    }
}
