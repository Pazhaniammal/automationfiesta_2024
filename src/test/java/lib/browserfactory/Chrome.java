package lib.browserfactory;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Logger;

import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

public class Chrome implements Browser{
	
	private static final Logger logger = Logger.getLogger(Chrome.class.getName());
	public String hubURL = "http://98.84.97.235:4445/";
	private RemoteWebDriver driver;

	@Override
	public RemoteWebDriver launchBrowser() {
		
		logger.info("Launching Chrome Browser");
		DesiredCapabilities capabilities = new DesiredCapabilities();
		capabilities.setBrowserName("chrome");
		try {
			driver = new RemoteWebDriver(new URL(hubURL), capabilities);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		return driver;
	}

}
