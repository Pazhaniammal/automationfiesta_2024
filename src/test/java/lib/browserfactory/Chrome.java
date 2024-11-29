package lib.browserfactory;

import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Logger;

public class Chrome implements Browser{
	
	private static final Logger logger = Logger.getLogger(Chrome.class.getName());
	public String hubURL = "http://3.89.242.215:4445";
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
